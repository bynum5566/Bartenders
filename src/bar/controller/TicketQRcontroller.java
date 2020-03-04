package bar.controller;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import bar.model.CompanyService;
import bar.model.ImageResponse;
import bar.model.ImgurAPI;
import bar.model.Orders;
import bar.model.OrdersService;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.GsonConverterFactory;
import retrofit2.Response;
import retrofit2.Retrofit;
@Controller
public class TicketQRcontroller {

	private CompanyService cService;
	private OrdersService oService;
	private String qrPath;
	private String qrUrl;
	
	@Autowired
	public TicketQRcontroller(CompanyService cService,OrdersService oService) {
		this.cService = cService;
		this.oService = oService;
	}
	
	@RequestMapping(path = "/rqQR", method = RequestMethod.POST)
	@SuppressWarnings("all")
	public String createQR(HttpServletRequest hsRequest, Model m) {
		String validDate=(String) hsRequest.getSession().getAttribute("validDate");
		String expireDate=(String) hsRequest.getSession().getAttribute("expireDate");
		String orderId=(String)hsRequest.getSession().getAttribute("orderId");
		int width = 500, height = 500;
		String format = "png", contents = "http://localhost:8080/Bartenders/chkQR?orderId="+orderId+"&validDate="+validDate+"&expireDate="+expireDate;
//存放二維碼引數
		HashMap hashMap = new HashMap();
		hashMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
//二維碼的糾錯等級
		hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
//設定二維碼邊距
		hashMap.put(EncodeHintType.MARGIN, 2);
//生成二維碼
		try {
			BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height,hashMap);
//檔案生成路徑
			qrPath = "C://DataSource/SpringMVCFinalProject/Bartenders/WebContent/WEB-INF/resources/images/"+orderId+"QR.png";
			File file = new File(qrPath);
			if (!file.exists()) {
				file.mkdirs();
			}
			MatrixToImageWriter.writeToPath(bitMatrix, format, file.toPath());
		} catch (Exception e) {
			e.printStackTrace();
		}
		imgurHandler(qrPath);
		hsRequest.setAttribute("qrUrl", qrUrl);
		int status=3;
		oService.updateStatusAndQR(orderId, status, qrUrl);
		m.addAttribute("validDate", null);
		m.addAttribute("expireDate", null);
		return "qrDelever";
	}
	
	public void imgurHandler(String qrPath){
		final String PATH = qrPath;
		final ImgurAPI imgurApi = createImgurAPI();
			try{
				File image = new File(PATH);
				RequestBody request = RequestBody.create(MediaType.parse("image/*"), image);
				Call<ImageResponse> call =  imgurApi.postImage(request);
				Response<ImageResponse> res = call.execute();
				System.out.println(res.body().data.link);
				System.out.println("是否成功: " + res.isSuccessful());
				qrUrl=res.body().data.link;	
			}catch(Exception err){
				err.printStackTrace();
			}
	}
	static ImgurAPI createImgurAPI(){
		Retrofit retrofit = new Retrofit.Builder()
				.addConverterFactory(GsonConverterFactory.create())
			    .baseUrl(ImgurAPI.SERVER)
			    .build();
		return retrofit.create(ImgurAPI.class);
	}
	
	@RequestMapping(path = "/chkQR", method = RequestMethod.GET)
	public String chkQR(HttpServletRequest hsRequest, Model m) throws ParseException {
		Date toDay = new Date();   
		System.out.println("toDay="+toDay);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		
		Date validDate = sdf.parse(hsRequest.getParameter("validDate"));
		System.out.println("validDate="+validDate);
		Date expireDate = (Date)sdf.parse(hsRequest.getParameter("expireDate"));
		System.out.println("expireDate="+expireDate);
		
		String orderId = (String)hsRequest.getParameter("orderId");
    	String onlineCac = (String)hsRequest.getSession().getAttribute("Caccount");
    	int cId = oService.selectOrder(orderId).getCompanyId();
    	String orderCac = cService.selectCompany(cId).getAccount();
    	System.out.println("onlineCac="+onlineCac);
    	System.out.println("orderCac="+orderCac);
    	
    	if (orderCac.equals(onlineCac)) {
    		if (toDay.after(validDate) && toDay.before(expireDate) || toDay.after(validDate) || toDay.equals(validDate) ) {
    			Orders order = oService.selectOrder(orderId);
    			if(order.getStatus()==6) {
    				return "usedQR";
    			}else {
    				int status=6;
    				oService.updateToCancel(orderId, status);
    				return "validQR";	
    			}
    		}
    		return "invalidQR";
    	}else {
    		m.addAttribute("msg", "請以票券發行用戶登入以利驗票");
    		return "index";
    	}
	}
}