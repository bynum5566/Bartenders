package bar.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ProductDataService {

	private ProductDataDAO pdao;
	private ProductData proD;

	public ProductDataService() {
	}

	@Autowired
	public ProductDataService(ProductDataDAO pdao, ProductData proD) {
		this.pdao = pdao;
		this.proD = proD;
	}

	public void addNewProduct(int companyId, String productName, int pdStock, int pdPrice, String pdTag1, String pdTag2,
			String pdTag3, String pdDetail, String Url, String Time) {
		try {
			String productImageUrl = "";
			if (Url.length() != 0) {
				productImageUrl = Url;
			}

			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String strDate = sdFormat.format(date);
			String pdId = companyId + strDate + ((int) (Math.random() * 9999 + 1));

			String autoLaunchTime = "";
			String autoPullTime = "";

			if (Time.length() > 20) {
				String[] T = Time.split(" ~ ");
				autoLaunchTime = T[0];
				autoPullTime = T[1];
			} else {
				autoLaunchTime = Time;
				autoPullTime = null;
			}

			String pdAvailable = "";
			boolean St = checkTime(autoLaunchTime);
			if (St) {
				pdAvailable = "Launched";
			} else {
				pdAvailable = "Pulled";
			}

			int pdSoldQuantity = 0;
			String pdSoldOut = "";

			proD.setProductImageUrl(productImageUrl);
			proD.setPdId(pdId);
			proD.setAutoLaunchTime(autoLaunchTime);
			proD.setAutoPullTime(autoPullTime);
			proD.setPdAvailable(pdAvailable);
			proD.setPdSoldQuantity(pdSoldQuantity);
			proD.setCompanyId(companyId);
			proD.setProductName(productName);
			proD.setPdTag1(pdTag1);
			proD.setPdTag2(pdTag2);
			proD.setPdTag3(pdTag3);
			proD.setPdStock(pdStock);
			proD.setPdPrice(pdPrice);
			proD.setPdDetail(pdDetail);
			proD.setPdSoldOut(pdSoldOut);

			pdao.insert(proD);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("e" + e);
		}
	}

	public void addNewTKProduct(int companyId, String productName, int pdStock, int pdPrice, String pdTag1,
			String pdTag2, String pdTag3, String pdDetail, String Url, String TkTime, String Time) {
		try {
			String productImageUrl = "";
			if (Url.length() != 0) {
				productImageUrl = Url;
			}

			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String strDate = sdFormat.format(date);
			String pdId = companyId + strDate + ((int) (Math.random() * 9999 + 1));

			String autoLaunchTime = "";
			String autoPullTime = "";

			String[] Vt = TkTime.split(" ~ ");
			String validDate = Vt[0];
			String expiryDate = Vt[1];

			if (Time.length() > 20) {
				String[] T = Time.split(" ~ ");
				autoLaunchTime = T[0];
				autoPullTime = T[1];
			} else {
				autoLaunchTime = Time;
				autoPullTime = null;
			}

			String pdAvailable = "";
			boolean St = checkTime(autoLaunchTime);
			if (St) {
				pdAvailable = "Launched";
			} else {
				pdAvailable = "Pulled";
			}

			int pdSoldQuantity = 0;
			String pdSoldOut = "";

			proD.setProductImageUrl(productImageUrl);
			proD.setPdId(pdId);
			proD.setAutoLaunchTime(autoLaunchTime);
			proD.setAutoPullTime(autoPullTime);
			proD.setPdAvailable(pdAvailable);
			proD.setPdSoldQuantity(pdSoldQuantity);
			proD.setValidDate(validDate);
			proD.setExpiryDate(expiryDate);
			proD.setCompanyId(companyId);
			proD.setProductName(productName);
			proD.setPdTag1(pdTag1);
			proD.setPdTag2(pdTag2);
			proD.setPdTag3(pdTag3);
			proD.setPdStock(pdStock);
			proD.setPdPrice(pdPrice);
			proD.setPdDetail(pdDetail);
			proD.setPdSoldOut(pdSoldOut);

			pdao.insert(proD);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("e" + e);
		}
	}

	public boolean checkTime(String autoLaunchTime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String strDate = sdf.format(date);
		try {
			Date a = sdf.parse(autoLaunchTime);
			Date b = sdf.parse(strDate);

			if (a.before(b)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("e" + e);
			return false;
		}
	}

	public String selectLaunched(int companyId) {
		List<ProductData> products = pdao.selectPdsLaunched(companyId);

		String Launched = "";
		for (ProductData product : products) {
			Launched = Launched
					+ "<tr class=\"pdRow\"><form action=\"/Bartenders/pulPD\" method=\"POST\"><td class=\"LSide\">"
					+ "<input type=\"text\" name=\"pdidckL\" class=\"pdidckLL\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/>"
					+ "<input type=\"submit\" value=\"下架\" class=\"bT2\"></td></form><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\">" + product.getPdId() + "</div>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" + product.getProductName()
					+ "</div></td><td class=\"MidS2\">" + "<div name=\"pdPri1\">價格<br>" + product.getPdPrice()
					+ "</div></td><td class=\"MidS3\">" + "<div name=\"pdStk1\">數量<br>" + product.getPdStock()
					+ "</div></td>" + "<form action=\"/Bartenders/Product.EditPDL\" method=\"GET\"><td class=\"RSide\">"
					+ "<input type=\"text\" name=\"pdidckL\" class=\"pdidckLL\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/><input type=\"submit\" value=\"編輯\"  class=\"bT2\"></td></form></tr>";
		}
		return Launched;
	}

	public String selectPulled(int companyId) {
		List<ProductData> products = pdao.selectPdsPulled(companyId);

		String Pulled = "";
		for (ProductData product : products) {
			Pulled = Pulled
					+ "<tr class=\"pdRow\"><form action=\"/Bartenders/lauPD\" method=\"POST\"><td class=\"LSide\">"
					+ "<input type=\"text\" name=\"pdidckP\" class=\"pdidckPP\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/>"
					+ "<input type=\"submit\" value=\"上架\" class=\"bT2\"></td></form><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\">" + product.getPdId() + "</div>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" + product.getProductName()
					+ "</div></td><td class=\"MidS2\">" + "<div name=\"pdPri1\">價格<br>" + product.getPdPrice()
					+ "</div></td><td class=\"MidS3\">" + "<div name=\"pdStk1\">數量<br>" + product.getPdStock()
					+ "</div></td>" + "<form action=\"/Bartenders/Product.EditPDP\" method=\"GET\"><td class=\"RSide\">"
					+ "<input type=\"text\" name=\"pdidckP\" class=\"pdidckPP\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/><input type=\"submit\" value=\"編輯\"  class=\"bT2\"><a></td></form></tr>";
		}
		return Pulled;
	}

	public String selectTkLaunched(int companyId) {
		List<ProductData> products = pdao.selectTKPdsLaunched(companyId);

		String Launched = "";
		for (ProductData product : products) {
			Launched = Launched
					+ "<tr class=\"pdRow\"><form action=\"/Bartenders/pulTkPD\" method=\"POST\"><td class=\"LSide\">"
					+ "<input type=\"text\" name=\"pdidckL\" class=\"pdidckLL\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/>"
					+ "<input type=\"submit\" value=\"下架\" class=\"bT2\"></td></form><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\">" + product.getPdId() + "</div>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" + product.getProductName()
					+ "</div></td><td class=\"MidS2\">" + "<div name=\"pdPri1\">價格<br>" + product.getPdPrice()
					+ "</div></td><td class=\"MidS3\">" + "<div name=\"pdStk1\">數量<br>" + product.getPdStock()
					+ "</div></td>"
					+ "<form action=\"/Bartenders/Product.EditTkPDL\" method=\"GET\"><td class=\"RSide\">"
					+ "<input type=\"text\" name=\"pdidckL\" class=\"pdidckLL\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/><input type=\"submit\" value=\"編輯\"  class=\"bT2\"></td></form></tr>";
		}
		return Launched;
	}

	public String selectTkPulled(int companyId) {
		List<ProductData> products = pdao.selectTKPdsPulled(companyId);

		String Pulled = "";
		for (ProductData product : products) {
			Pulled = Pulled
					+ "<tr class=\"pdRow\"><form action=\"/Bartenders/lauTkPD\" method=\"POST\"><td class=\"LSide\">"
					+ "<input type=\"text\" name=\"pdidckP\" class=\"pdidckPP\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/>"
					+ "<input type=\"submit\" value=\"上架\" class=\"bT2\"></td></form><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\">" + product.getPdId() + "</div>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" + product.getProductName()
					+ "</div></td><td class=\"MidS2\">" + "<div name=\"pdPri1\">價格<br>" + product.getPdPrice()
					+ "</div></td><td class=\"MidS3\">" + "<div name=\"pdStk1\">數量<br>" + product.getPdStock()
					+ "</div></td>"
					+ "<form action=\"/Bartenders/Product.EditTkPDP\" method=\"GET\"><td class=\"RSide\">"
					+ "<input type=\"text\" name=\"pdidckP\" class=\"pdidckPP\" value=\"" + product.getPdId()
					+ "\" readonly=\"readonly\"/><input type=\"submit\" value=\"編輯\"  class=\"bT2\"><a></td></form></tr>";
		}
		return Pulled;
	}

	public String selectTop3Pd(int companyId) {
		String t3 = "";
		List<ProductData> products = pdao.selectTop3(companyId);
		for (ProductData product : products) {
			t3 = t3 + "<td><a href=\"/bartenders/Product.show?pdidck=" + product.getPdId() + "\"><img src=\""
					+ product.getProductImageUrl() + "\"></a></td>";
		}
		return t3;
	}

	public String selectDrinks(int companyId) {
		String drinks = "";
		int x = 0;
		List<ProductData> products = pdao.selectPdsLaunched(companyId);
		for (ProductData product : products) {
			if (x % 3 == 0) {
				drinks = drinks + "<tr>";
			}
			drinks = drinks + "<td><a href=\"/Bartenders/Product.show?pdidck=" + product.getPdId()
					+ "\"><img class=\"pdImg\" src=\"" + product.getProductImageUrl() + "\"></a></td>";
			if (x % 3 == 2) {
				drinks = drinks + "</tr>";
			}
			x++;
		}
		return drinks;
	}

	public String selectTickets(int companyId) {
		String tickets = "";
		int x = 0;
		List<ProductData> products = pdao.selectTKPdsLaunched(companyId);
		for (ProductData product : products) {
			if (x % 3 == 0) {
				tickets = tickets + "<tr>";
			}
			tickets = tickets + "<td><a href=\"/Bartenders/Product.show?pdidck=" + product.getPdId()
					+ "\"><img class=\"pdImg\" src=\"" + product.getProductImageUrl() + "\"></a></td>";
			if (x % 3 == 2) {
				tickets = tickets + "</tr>";
			}
			x++;
		}
		return tickets;
	}

	public boolean pdPull(String pdidckL) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String pullT = sdf.format(date);
		String pdAvailable = "Pulled";
		return pdao.pullP(pullT, pdAvailable, pdidckL);
	}

	public boolean pdLaunch(String pdidckP) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String launchT = sdf.format(date);
		String pdAvailable = "Launched";
		return pdao.launchP(launchT, pdAvailable, pdidckP);
	}

	public ProductData editThisPd(int companyId, String pdId) {
		ProductData pData = pdao.selectProduct(companyId, pdId);
		return pData;
	}

	public ProductData editThisTkPd(int companyId, String pdId) {
		ProductData pData = pdao.selectTKProduct(companyId, pdId);
		return pData;
	}

	public void editPd(String pdId, String productName, int pdStock, int pdPrice, String pdTag1, String pdTag2,
			String pdTag3, String pdDetail, String Url, String autoLaunchTime, String autoPullTime) {
		try {
			String productImageUrl = "";
			if (Url.length() != 0) {
				productImageUrl = Url;
			}

			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String strDate = sdFormat.format(date);

			pdao.edit(pdId, productName, pdTag1, pdTag2, pdTag3, pdStock, pdPrice, pdDetail, productImageUrl);

			if (autoLaunchTime != null && autoLaunchTime.length() != 0) {
				if (autoPullTime != null && autoPullTime.length() != 0) {
					pdao.editALaunchPullT(autoLaunchTime, autoPullTime, pdId);
				} else {
					pdao.editALaunchT(autoLaunchTime, pdId);
				}
			} else {
				if (autoPullTime != null && autoPullTime.length() != 0) {
					pdao.editAPullT(autoPullTime, pdId);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void editTKPd(String pdId, String productName, int pdStock, int pdPrice, String pdTag1, String pdTag2,
			String pdTag3, String pdDetail, String Url, String validDate, String expiryDate, String autoLaunchTime,
			String autoPullTime) {
		try {
			String productImageUrl = "";
			if (Url.length() != 0) {
				productImageUrl = Url;
			}

			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String strDate = sdFormat.format(date);

			pdao.edit(pdId, productName, pdTag1, pdTag2, pdTag3, pdStock, pdPrice, pdDetail, productImageUrl);

			if (validDate != null && validDate.length() != 0) {
				if (expiryDate != null && expiryDate.length() != 0) {
					pdao.editValidExpiryT(validDate, expiryDate, pdId);
				} else {
					pdao.editValidT(validDate, pdId);
				}
			} else {
				if (expiryDate != null && expiryDate.length() != 0) {
					pdao.editExpiryT(expiryDate, pdId);
				}
			}

			if (autoLaunchTime != null && autoLaunchTime.length() != 0) {
				if (autoPullTime != null && autoPullTime.length() != 0) {
					pdao.editALaunchPullT(autoLaunchTime, autoPullTime, pdId);
				} else {
					pdao.editALaunchT(autoLaunchTime, pdId);
				}
			} else {
				if (autoPullTime != null && autoPullTime.length() != 0) {
					pdao.editAPullT(autoPullTime, pdId);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

////////////////////////////////////////////////////////	
	public ProductData select(String pdId) {// 豪
		return pdao.selectP(pdId);
	}
	// public ProductData selectProductVer2(String pdId) {//豪
	// ProductData pData = pdao.selectProductVer2(pdId);
	// return pData;
	// }
}
