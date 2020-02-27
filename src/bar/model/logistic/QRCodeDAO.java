package bar.model.logistic;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.logistic.Logistic;

@Repository
public class QRCodeDAO {

	private SessionFactory sessionFactory;
	private OrdersService oService;


	@Autowired
	public QRCodeDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory,OrdersService oService) {
		this.sessionFactory = sessionFactory;
		this.oService = oService;
	}

	public Logistic QRCodeAction(String oID, Integer sID) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Logistic where oID=:oID";
			System.out.println("hqlStr:" + hqlStr);
			Query query = session.createQuery(hqlStr);
			query.setParameter("oID", oID);
//			query.setParameter("Status", status);
			Logistic order = (Logistic)query.uniqueResult();
			System.out.println("order query result:"+order);
			if(order!=null) {
				if(order.getoStatus()==1&&order.getoComplete()==null) {
					order.setoStatus(2);
					String date = getTime();
					order.setoTimeB(date);
					order.setsID(sID);
					System.out.println("update status");
//					String name = order.getoName();
//					CreateQR(ID,status+1,name);
					Orders reUpdate = oService.selectOrder(oID);
					reUpdate.setStatus(4);
				}else if(order.getoStatus()==2&&order.getoComplete()==1) {
					order.setoStatus(3);
					String date = getTime();
					order.setoTimeC(date);
					Orders reUpdate = oService.selectOrder(oID);
					reUpdate.setStatus(6);
					System.out.println("update status");
				}
			}
			System.out.println("return result");
			return order;
		} catch (Exception e) {
			System.out.println("e:" + e);
			return null;
		}
	}

	@SuppressWarnings("all")
	public void CreateQR(String orderID, Integer orderStatus, String name) {
//基本引數
		int width = 500, height = 500;
		String format = "png", contents = "http://localhost:8080/Bartenders/logistic/QRCodeAction.do?orderID="+orderID;
		System.out.println("QR code: "+contents);
		//存放二維碼引數
		HashMap hashMap = new HashMap();
//內容的字符集編碼
		hashMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
//二維碼的糾錯等級
		hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
//設定二維碼邊距
		hashMap.put(EncodeHintType.MARGIN, 2);
//生成二維碼
		try {
			BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height,
					hashMap);
//檔案生成路徑
			File file = new File("C:/test/"+orderID+name+".png");
			if (!file.exists()) {
				file.mkdirs();
			}
			MatrixToImageWriter.writeToPath(bitMatrix, format, file.toPath());
			System.out.println("Create code success:"+orderID+name+".png");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String readQR() {
		try {
			MultiFormatReader formatReader = new MultiFormatReader();
			File file = new File("F:/test/img.png");
			BufferedImage image = ImageIO.read(file);
//存放二維碼引數
			HashMap hashMap = new HashMap();
//內容的字符集編碼
			hashMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));
			Result result = formatReader.decode(binaryBitmap, hashMap);
			System.out.println("解析結果：" +result.toString());
			System.out.println("二維碼格式型別：" +result.getBarcodeFormat());
			System.out.println("二維碼文字內容：" +result.getText());
			return result.getText();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} catch (NotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		System.out.println(strDate);
		return strDate;
	}
}
