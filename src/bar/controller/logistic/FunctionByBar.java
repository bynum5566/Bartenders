package bar.controller.logistic;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.MyBar;
import bar.model.MyBarService;
import bar.model.UsersDAO;
import bar.model.logistic.Activity;
import bar.model.logistic.ActivityDAO;
import bar.model.logistic.ActivityService;
import bar.model.logistic.Bar;
import bar.model.logistic.BarDAO;
import net.coobird.thumbnailator.Thumbnails;


@Controller

public class FunctionByBar {
	
	private ActivityService aSer;
	private CompanyService cSer;
	private MyBarService mSer;
	
	public FunctionByBar(ActivityService aSer,CompanyService cSer,MyBarService mSer) {

		this.aSer=aSer;
		this.mSer=mSer;
		this.cSer=cSer;
	}

	@RequestMapping(path = "getBarData.do",method = RequestMethod.GET)
	public String getBarData(HttpServletRequest request, HttpServletResponse response,Model m,
//			@RequestParam(name = "preUrl")String preUrl,
			@RequestParam(name = "userId")Integer companyId
			) throws IOException, ParseException {
		Company bar = cSer.selectCompany(companyId);
		MyBar myBar = mSer.selectBarDetail(companyId);
		m.addAttribute("bar",bar);
		m.addAttribute("myBar",myBar);
		return "logistic/BarCreate";
	}
		
	@RequestMapping(path = "saveBar.do",method = RequestMethod.POST)
	public String saveBar(HttpServletRequest request, HttpServletResponse response,Model m,
			@RequestParam(name = "preUrl")String preUrl,
			@RequestParam(name = "userId")Integer userId,
			@RequestParam(name = "name")String name,
			@RequestParam(name = "address")String address,
			@RequestParam(name = "lat")float lat,
			@RequestParam(name = "lng")float lng,
			@RequestParam(name = "brief")String brief,
			@RequestParam(name = "realType")String type,
			@RequestParam(name = "beginTime")String beginTime,
			@RequestParam(name = "endTime")String endTime
			) throws IOException, ParseException {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		Map<String, String> temp = new HashMap<String, String>();
		m.addAttribute("temp", temp);
		if (name == null || name.length() == 0) {
			errors.put("name", "尚未輸入活動名稱");
		}

		if (type.equals("no")) {
			errors.put("type", "no");
		}
		
		if (beginTime.length() ==0) {
			errors.put("beginTime", "尚未完整設定時間");
		}
		if (endTime.length() ==0) {
			errors.put("endTime", "尚未完整設定時間");
		}
		
		if (address == null || address.length() == 0) {
			errors.put("address", "尚未輸入活動地點");
		}
		
		if ((lat==0)||(lng==0)) {
			errors.put("map", "尚未點選地圖設定地點");
		}
		
		if (brief == null || brief.length() == 0) {
			errors.put("brief", "尚未輸入簡介");
		}

		if (userId==null) {
//			errors.put("type", "尚未選擇類型");
			System.out.println("閒置過久，請重新登入");
			return "WelcomeCompany";
		}

		if (errors != null && !errors.isEmpty()) {
			System.out.println("資料不完整");
			temp.put("name", String.valueOf(name));
			temp.put("type", type);
			temp.put("beginTime", beginTime);
			temp.put("endTime", endTime);
			temp.put("address", address);
			temp.put("lat", String.valueOf(lat));
			temp.put("lng", String.valueOf(lng));
			temp.put("brief", brief);
			
			return "logistic/BarCreate";
		}
		System.out.println("this is preUrl: "+preUrl+" ;userId: "+userId);
		String realPath = request.getSession().getServletContext().getRealPath("\\WEB-INF\\resource\\images/");
		System.out.println("this is realPath:"+realPath);
		String testPath = request.getRequestURI();
		System.out.println("this is testPath:"+testPath);
		String filePath=request.getServletPath();
		System.out.println("this is filePath:"+filePath);
		String contextPath = request.getContextPath();    
		String realPath2 = request.getSession().getServletContext().getRealPath("/");    
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
		System.out.println("this is contextPath:"+contextPath);
		System.out.println("this is realPath2:"+realPath2);
		System.out.println("this is basePath:"+basePath);
		
		String tempPath = "C:\\DataSource\\SpringMVCFinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Bartenders\\WEB-INF\\resources\\images";
		System.out.println("upload file: "+request.getContentLengthLong());
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String filename;
		if(!file.isEmpty()) {
			filename = file.getOriginalFilename();
			InputStream input = file.getInputStream();
		
			System.out.println("start Thumbnails, saving file: "+tempPath+filename);
			File savePath2 = new File(tempPath+filename);
			
			Thumbnails.of(input).size(30, 30).toFile(savePath2);
			System.out.println("Thumbnails complete");
		}else {
			System.out.println("no file selected");
			filename="noImage.png";
		}
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String beginD = sdf.format(today);
		String prefix = beginD.substring(0, 11);
		String prefix2 = "2050/12/31 ";
		String finalB = prefix+beginTime;
		String finalE = prefix2+endTime;
		System.out.println("this is finalB: "+finalB);
		System.out.println("this is finalE: "+finalE);
		Integer limitNum = null;
		Integer targetNum = null;
		Integer actualNum = null;
		String newDetail = null;
		Activity activity = new Activity();
		String newBrief = brief.replace("\n", "<br>");
		aSer.saveActivity(activity,userId, name, address, lat, lng, type, filename, newBrief,newDetail, finalB, finalE, limitNum, targetNum, actualNum);
		
//		response.sendRedirect("ActivityHall");
//		return "createActivity";
		return "WelcomeCompany";
	}
}
