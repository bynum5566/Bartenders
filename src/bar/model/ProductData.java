package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "ProductData")
@Component
public class ProductData {
	private int companyId;
	private String pdId;
	private String productName;
	private String pdTag1;
	private String pdTag2;
	private String pdTag3;
	private int pdStock;
	private int pdPrice;
	private String pdDetail;
//	private String picName1;
//	private byte[] pdPic1;
	private String productImageUrl;
//	private String picName2;
//	private byte[] pdPic2;
	private String productImageUrl2;
//	private String picName3;
//	private byte[] pdPic3;
	private String productImageUrl3;
	private String autoLaunchTime;
	private String autoPullTime;
//	private String pdAvailable;
	private int pdSoldQuantity;
	private String pdSoldOut;
	private String validDate;
	private String expiryDate;
	private String deleteTag;

	public ProductData() {
	}

	public ProductData(int companyId, String pdId, String productName, String pdTag1, String pdTag2, String pdTag3,
			int pdStock, int pdPrice, String pdDetail, String productImageUrl, String productImageUrl2, String productImageUrl3, 
			String autoLaunchTime, String autoPullTime, String pdAvailable, int pdSoldQuantity, String pdSoldOut, 
			String validDate, String expiryDate, String deleteTag) {
		this.companyId = companyId;
		this.pdId=pdId;
		this.productName=productName;
		this.pdTag1=pdTag1;
		this.pdTag2=pdTag2;
		this.pdTag3=pdTag3;
		this.pdStock=pdStock;
		this.pdPrice=pdPrice;
		this.pdDetail=pdDetail;
//		this.picName1=picName1;
//		this.pdPic1=pdPic1;
		this.productImageUrl=productImageUrl;
//		this.picName2=picName2;
//		this.pdPic2=pdPic2;
		this.productImageUrl2=productImageUrl2;
//		this.picName3=picName3;
//		this.pdPic3=pdPic3;
		this.productImageUrl3=productImageUrl3;
		this.autoLaunchTime=autoLaunchTime;
		this.autoPullTime=autoPullTime;
//		this.pdAvailable = pdAvailable;
		this.pdSoldQuantity=pdSoldQuantity;
		this.pdSoldOut=pdSoldOut;
		this.validDate=validDate;
		this.expiryDate=expiryDate;
	}

	@Column(name = "COMPANYID")
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	@Id
	@Column(name = "PDID")
	public String getPdId() {
		return pdId;
	}

	public void setPdId(String pdId) {
		this.pdId = pdId;
	}

	@Column(name = "PRODUCTNAME")
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "PDTAG1")
	public String getPdTag1() {
		return pdTag1;
	}

	public void setPdTag1(String pdTag1) {
		this.pdTag1 = pdTag1;
	}

	@Column(name = "PDTAG2")
	public String getPdTag2() {
		return pdTag2;
	}

	public void setPdTag2(String pdTag2) {
		this.pdTag2 = pdTag2;
	}

	@Column(name = "PDTAG3")
	public String getPdTag3() {
		return pdTag3;
	}

	public void setPdTag3(String pdTag3) {
		this.pdTag3 = pdTag3;
	}

	@Column(name = "PDSTOCK")
	public int getPdStock() {
		return pdStock;
	}

	public void setPdStock(int pdStock) {
		this.pdStock = pdStock;
	}

	@Column(name = "PDPRICE")
	public int getPdPrice() {
		return pdPrice;
	}

	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}

	@Column(name = "PDDETAIL")
	public String getPdDetail() {
		return pdDetail;
	}

	public void setPdDetail(String pdDetail) {
		this.pdDetail = pdDetail;
	}

//	@Column(name = "PICNAME1")
//	public String getPicName1() {
//		return picName1;
//	}
//
//	public void setPicName1(String picName1) {
//		this.picName1 = picName1;
//	}
//
//	@Column(name = "PDPIC1")
//	public byte[] getPdPic1() {
//		return pdPic1;
//	}
//
//	public void setPdPic1(byte[] pdPic1) {
//		this.pdPic1 = pdPic1;
//	}

	@Column(name = "PRODUCTIMAGEURL")
	public String getProductImageUrl() {
		return productImageUrl;
	}

	public void setProductImageUrl(String productImageUrl) {
		this.productImageUrl = productImageUrl;
	}

//	@Column(name = "PICNAME2")
//	public String getPicName2() {
//		return picName2;
//	}
//
//	public void setPicName2(String picName2) {
//		this.picName2 = picName2;
//	}
//
//	@Column(name = "PDPIC2")
//	public byte[] getPdPic2() {
//		return pdPic2;
//	}
//
//	public void setPdPic2(byte[] pdPic2) {
//		this.pdPic2 = pdPic2;
//	}

	@Column(name = "PRODUCTIMAGEURL2")
	public String getProductImageUrl2() {
		return productImageUrl2;
	}

	public void setProductImageUrl2(String productImageUrl2) {
		this.productImageUrl2 = productImageUrl2;
	}

//	@Column(name = "PICNAME3")
//	public String getPicName3() {
//		return picName3;
//	}
//
//	public void setPicName3(String picName3) {
//		this.picName3 = picName3;
//	}
//
//	@Column(name = "PDPIC3")
//	public byte[] getPdPic3() {
//		return pdPic3;
//	}
//
//	public void setPdPic3(byte[] pdPic3) {
//		this.pdPic3 = pdPic3;
//	}

	@Column(name = "PRODUCTIMAGEURL3")
	public String getProductImageUrl3() {
		return productImageUrl3;
	}

	public void setProductImageUrl3(String productImageUrl3) {
		this.productImageUrl3 = productImageUrl3;
	}

	@Column(name = "AUTOLAUNCHTIME")
	public String getAutoLaunchTime() {
		return autoLaunchTime;
	}

	public void setAutoLaunchTime(String autoLaunchTime) {
		this.autoLaunchTime = autoLaunchTime;
	}

	@Column(name = "AUTOPULLTIME")
	public String getAutoPullTime() {
		return autoPullTime;
	}

	public void setAutoPullTime(String autoPullTime) {
		this.autoPullTime = autoPullTime;
	}

//	@Column(name = "PDAVAILABLE")
//	public String getPdAvailable() {
//		return pdAvailable;
//	}
//
//	public void setPdAvailable(String pdAvailable) {
//		this.pdAvailable = pdAvailable;
//	}

	@Column(name = "PDSOLDQUANTITY")
	public int getPdSoldQuantity() {
		return pdSoldQuantity;
	}

	public void setPdSoldQuantity(int pdSoldQuantity) {
		this.pdSoldQuantity = pdSoldQuantity;
	}

	@Column(name = "PDSOLDOUT")
	public String getPdSoldOut() {
		return pdSoldOut;
	}

	public void setPdSoldOut(String pdSoldOut) {
		this.pdSoldOut = pdSoldOut;
	}
	
	@Column(name = "VALIDDATE")
	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	@Column(name = "EXPIRYDATE")
	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	@Column(name = "DELETETAG")
	public String getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(String deleteTag) {
		this.deleteTag = deleteTag;
	}
	
}
