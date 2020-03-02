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
	
	public boolean updateQuantityByPid(String pdId, int pdSoldOut) {
		boolean result = pdao.updateQuantityByPid(pdId, pdSoldOut);
		return result;
	}

	public void addNewProduct(int companyId, String productName, int pdStock, int pdPrice, String pdTag1, String pdTag2,
			String pdTag3, String pdDetail, String productImageUrl, String productImageUrl2, String productImageUrl3,
			String Time) {
		try {
			String pUrl1 = "";
			if (productImageUrl.length() != 0) {
				pUrl1 = productImageUrl;
			}
			String pUrl2 = "";
			if (productImageUrl2.length() != 0) {
				pUrl2 = productImageUrl2;
			}
			String pUrl3 = "";
			if (productImageUrl3.length() != 0) {
				pUrl3 = productImageUrl3;
			}

			String size = String.valueOf(pdao.selectAllProducts(companyId).size());
			
//			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
//			Date date = new Date();
//			String strDate = sdFormat.format(date);
			String pdId = String.valueOf(companyId) + ((int) (Math.random() * 999 + 1)) + size;

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

			int pdSoldQuantity = 0;
			String pdSoldOut = "";

			proD.setProductImageUrl(pUrl1);
			proD.setProductImageUrl2(pUrl2);
			proD.setProductImageUrl3(pUrl3);
			proD.setPdId(pdId);
			proD.setAutoLaunchTime(autoLaunchTime);
			proD.setAutoPullTime(autoPullTime);
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
			String pdTag2, String pdTag3, String pdDetail, String productImageUrl, String productImageUrl2,
			String productImageUrl3, String TkTime, String Time) {
		try {
			String pUrl1 = "";
			if (productImageUrl.length() != 0) {
				pUrl1 = productImageUrl;
			}
			String pUrl2 = "";
			if (productImageUrl2.length() != 0) {
				pUrl2 = productImageUrl2;
			}
			String pUrl3 = "";
			if (productImageUrl3.length() != 0) {
				pUrl3 = productImageUrl3;
			}
			
			String size = String.valueOf(pdao.selectAllProducts(companyId).size());

//			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
//			Date date = new Date();
//			String strDate = sdFormat.format(date);
			String pdId = String.valueOf(companyId) + ((int) (Math.random() * 999 + 1)) + size;

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

			int pdSoldQuantity = 0;
			String pdSoldOut = "";

			proD.setProductImageUrl(pUrl1);
			proD.setProductImageUrl2(pUrl2);
			proD.setProductImageUrl3(pUrl3);
			proD.setPdId(pdId);
			proD.setAutoLaunchTime(autoLaunchTime);
			proD.setAutoPullTime(autoPullTime);
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
					+ "<tr class=\"pdRow\"><td class=\"LSide\">"
					+ "<div>&emsp;&nbsp;<input type=\"checkbox\" name=\"pdCheckL\" id=\""+ product.getPdId() 
					+ "\" value=\"" + product.getPdId() + "\"/><label for=\"" + product.getPdId() + "\"></label></div><br>"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/pulPD?pdidckL=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/down-arrow.png\"></div>"
					+ "</td><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\"><p>" + product.getPdId() + "</p></div><br>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" 
					+ "<h4 class=\"bT3\" onclick=\"location.href='/Bartenders/Product.View?pdId="
					+ product.getPdId() + "';\">"
					+ product.getProductName() + "</h4>" + "</div></td><td class=\"MidS2\">"
					+ "<div name=\"pdPri1\"><img src=\"/Bartenders/images/coin.png\"></div><br><div>" + product.getPdPrice() + "</div></td><td class=\"MidS3\">"
					+ "<div name=\"pdStk1\"><img src=\"/Bartenders/images/stock.png\"></div><br><div>" + product.getPdStock() + "</div></td>"
					+ "<td class=\"RSide\">"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/Product.EditPDL?pdidckL=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/document.png\"></div><br>"
					+ "<div><a class=\"bT4\" href=\"/Bartenders/Product.Del?pdId=" + product.getPdId() + "\">"
					+ "<img src=\"/Bartenders/images/delete.png\"></a></div></td></tr>";
		}
		return Launched;
	}

	public String selectPulled(int companyId) {
		List<ProductData> products = pdao.selectPdsPulled(companyId);

		String Pulled = "";
		for (ProductData product : products) {
			Pulled = Pulled
					+ "<tr class=\"pdRow\"><td class=\"LSide\">"
					+ "<div>&emsp;&nbsp;<input type=\"checkbox\" name=\"pdCheckP\" id=\"" + product.getPdId() 
					+ "\" value=\"" + product.getPdId() + "\"/><label for=\"" + product.getPdId() + "\"></label></div><br>"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/lauPD?pdidckP=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/up-arrow.png\"></div>"
					+ "</td><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\"><p>" + product.getPdId() + "</p></div><br>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" 
					+ "<h4 class=\"bT3\" onclick=\"location.href='/Bartenders/Product.View?pdId="
					+ product.getPdId() + "';\">"
					+ product.getProductName() + "</h4>" + "</div></td><td class=\"MidS2\">"
					+ "<div name=\"pdPri1\"><img src=\"/Bartenders/images/coin.png\"></div><br><div>" + product.getPdPrice() + "</div></td><td class=\"MidS3\">"
					+ "<div name=\"pdStk1\"><img src=\"/Bartenders/images/stock.png\"></div><br><div>" + product.getPdStock() + "</div></td>"
					+ "<td class=\"RSide\">"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/Product.EditPDP?pdidckP=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/document.png\"></div><br>"
					+ "<div><a class=\"bT4\" href=\"/Bartenders/Product.Del?pdId=" + product.getPdId() + "\">"
					+ "<img src=\"/Bartenders/images/delete.png\"></a></div></td></tr>";
		}
		return Pulled;
	}

	public String selectTkLaunched(int companyId) {
		List<ProductData> products = pdao.selectTKPdsLaunched(companyId);

		String Launched = "";
		for (ProductData product : products) {
			Launched = Launched
					+ "<tr class=\"pdRow\"><td class=\"LSide\">"
					+ "<div>&emsp;&nbsp;<input type=\"checkbox\" name=\"pdCheckL\" id=\"" + product.getPdId() 
					+ "\" value=\"" + product.getPdId() + "\"/><label for=\"" + product.getPdId() + "\"></label></div><br>"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/pulTkPD?pdidckL=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/down-arrow.png\"></div>"
					+ "</td><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\"><p>" + product.getPdId() + "</p></div><br>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" 
					+ "<h4 class=\"bT3\" onclick=\"location.href='/Bartenders/ProductTicket.View?pdId="
					+ product.getPdId() + "';\">"
					+ product.getProductName() + "</h4>" + "</div></td><td class=\"MidS2\">"
					+ "<div name=\"pdPri1\"><img src=\"/Bartenders/images/coin.png\"></div><br><div>" + product.getPdPrice() + "</div></td><td class=\"MidS3\">"
					+ "<div name=\"pdStk1\"><img src=\"/Bartenders/images/stock.png\"></div><br><div>" + product.getPdStock() + "</div></td>"
					+ "<td class=\"RSide\">"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/Product.EditTkPDL?pdidckL=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/document.png\"></div><br>"
					+ "<div><a class=\"bT4\" href=\"/Bartenders/TicketProduct.Del?pdId=" + product.getPdId() + "\">"
					+ "<img src=\"/Bartenders/images/delete.png\"></a></div></td></tr>";
		}
		return Launched;
	}

	public String selectTkPulled(int companyId) {
		List<ProductData> products = pdao.selectTKPdsPulled(companyId);

		String Pulled = "";
		for (ProductData product : products) {
			Pulled = Pulled
					+ "<tr class=\"pdRow\"><td class=\"LSide\">"
					+ "<div>&emsp;&nbsp;<input type=\"checkbox\" name=\"pdCheckP\" id=\"" + product.getPdId()
					+ "\" value=\""  + product.getPdId()+ "\"/><label for=\"" + product.getPdId() + "\"></label></div><br>"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/lauTkPD?pdidckP=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/up-arrow.png\"></div>"
					+ "</td><td class=\"MidS1\">"
					+ "<div class=\"pdId\" name=\"pdId1\"><p>" + product.getPdId() + "</p></div><br>"
					+ "<div class=\"pdNm\" name=\"pdNm1\">" 
					+ "<h4 class=\"bT3\" onclick=\"location.href='/Bartenders/ProductTicket.View?pdId="
					+ product.getPdId() + "';\">"
					+ product.getProductName() + "</h4>" + "</div></td><td class=\"MidS2\">"
					+ "<div name=\"pdPri1\"><img src=\"/Bartenders/images/coin.png\"></div><br><div>" + product.getPdPrice() + "</div></td><td class=\"MidS3\">"
					+ "<div name=\"pdStk1\"><img src=\"/Bartenders/images/stock.png\"></div><br><div>" + product.getPdStock() + "</div></td>"
					+ "<td class=\"RSide\">"
					+ "<div><img class=\"bT3\" onclick=\"location.href='/Bartenders/Product.EditTkPDP?pdidckP=" + product.getPdId()
					+ "';\" src=\"/Bartenders/images/document.png\"></div><br>"
					+ "<div><a class=\"bT4\" href=\"/Bartenders/TicketProduct.Del?pdId=" + product.getPdId() + "\">"
					+ "<img src=\"/Bartenders/images/delete.png\"></a></div></td></tr>";
		}
		return Pulled;
	}

	public String searchResult(String keyword) {
		String res = "";
		int x = 0;
		List<ProductData> products = pdao.searchPds(keyword);
		if (products.size() == 0) {
			res = "<div class=\"col-6\"><span class=\"image fit\"><img width=\"500px\" src=\"/Bartenders/images/No_Result_Icon2.png\"></span></div>";
			return res;
		}
		for (ProductData product : products) {
			res = res + "<div class=\"col-4\"><span class=\"image fit\"><a href=\"/Bartenders/Product.show?PdId=" + product.getPdId()
					+ "\"><img class=\"pdImg\" src=\"" + product.getProductImageUrl() + "\"></a><br><a href=\"/Bartenders/Product.show?PdId=" + product.getPdId()
					+ "\"><h4 class=\"ellipsis\">&nbsp;&nbsp;" + product.getProductName() + "</h4></a></span></div>";
			if (x % 3 == 2) {
				res = res + "</br>";
			}
			x++;
		}
		return res;
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

	public boolean pdPull(String pdId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String pullT = sdf.format(date);
		return pdao.pullP(pullT, pdId);
	}

	public boolean pdLaunch(String pdId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String launchT = sdf.format(date);
		return pdao.launchP(launchT, pdId);
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
			String pdTag3, String pdDetail, String Url, String Url2, String Url3, String autoLaunchTime,
			String autoPullTime) {
		try {
			String productImageUrl = "";
			if (Url.length() != 0) {
				productImageUrl = Url;
			}
			String productImageUrl2 = "";
			if (Url2.length() != 0) {
				productImageUrl2 = Url2;
			}
			String productImageUrl3 = "";
			if (Url3.length() != 0) {
				productImageUrl3 = Url3;
			}

			pdao.edit(pdId, productName, pdTag1, pdTag2, pdTag3, pdStock, pdPrice, pdDetail, productImageUrl,
					productImageUrl2, productImageUrl3);

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
			String pdTag3, String pdDetail, String Url, String Url2, String Url3, String validDate, String expiryDate,
			String autoLaunchTime, String autoPullTime) {
		try {
			String productImageUrl = "";
			if (Url.length() != 0) {
				productImageUrl = Url;
			}
			String productImageUrl2 = "";
			if (Url2.length() != 0) {
				productImageUrl2 = Url2;
			}
			String productImageUrl3 = "";
			if (Url3.length() != 0) {
				productImageUrl3 = Url3;
			}

			pdao.edit(pdId, productName, pdTag1, pdTag2, pdTag3, pdStock, pdPrice, pdDetail, productImageUrl,
					productImageUrl2, productImageUrl3);

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

	public void removeProduct(String pdId) {
		pdao.removePd(pdId);
	}
	
	
	
////////////////////////////////////////////////////////	
	
	public ProductData select(String pdId) {// 豪
		return pdao.selectP(pdId);
	}

}
