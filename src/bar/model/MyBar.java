package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "mybar")
@Component
public class MyBar {
	private int companyId;
	private String logoUrl;
	private String coverUrl1;
	private String coverUrl2;
	private String coverUrl3;
	private String coverUrl4;
	private String coverUrl5;
	private String aboutBar;
	private String barMenu;
	private String barFb;
	private String barLine;
	private String barIg;
	
	public MyBar() {
	}
	
	public MyBar(int companyId, String logoUrl, String coverUrl1, String coverUrl2, String coverUrl3, String coverUrl4, String coverUrl5, String aboutBar, String barMenu, String barFb,String barLine,String barIg) {
		this.companyId=companyId;
		this.logoUrl=logoUrl;
		this.coverUrl1=coverUrl1;
		this.coverUrl2=coverUrl2;
		this.coverUrl3=coverUrl3;
		this.coverUrl4=coverUrl4;
		this.coverUrl5=coverUrl5;
		this.aboutBar=aboutBar;
		this.barMenu=barMenu;
		this.barFb=barFb;
		this.barLine=barLine;
		this.barIg=barIg;
	}

	@Id
	@Column(name = "COMPANYID")
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	@Column(name = "LOGOURL")
	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	
	@Column(name = "COVERURL1")
	public String getCoverUrl1() {
		return coverUrl1;
	}

	public void setCoverUrl1(String coverUrl1) {
		this.coverUrl1 = coverUrl1;
	}
	
	@Column(name = "COVERURL2")
	public String getCoverUrl2() {
		return coverUrl2;
	}

	public void setCoverUrl2(String coverUrl2) {
		this.coverUrl2 = coverUrl2;
	}
	
	@Column(name = "COVERURL3")
	public String getCoverUrl3() {
		return coverUrl3;
	}

	public void setCoverUrl3(String coverUrl3) {
		this.coverUrl3 = coverUrl3;
	}
	
	@Column(name = "COVERURL4")
	public String getCoverUrl4() {
		return coverUrl4;
	}

	public void setCoverUrl4(String coverUrl4) {
		this.coverUrl4 = coverUrl4;
	}
	
	@Column(name = "COVERURL5")
	public String getCoverUrl5() {
		return coverUrl5;
	}

	public void setCoverUrl5(String coverUrl5) {
		this.coverUrl5 = coverUrl5;
	}

	@Column(name = "ABOUTBAR")
	public String getAboutBar() {
		return aboutBar;
	}

	public void setAboutBar(String aboutBar) {
		this.aboutBar = aboutBar;
	}
	
	@Column(name = "BARMENU")
	public String getBarMenu() {
		return barMenu;
	}

	public void setBarMenu(String barMenu) {
		this.barMenu = barMenu;
	}

	@Column(name = "BARFB")
	public String getBarFb() {
		return barFb;
	}
	
	public void setBarFb(String barFb) {
		this.barFb = barFb;
	}

	@Column(name = "BARLINE")
	public String getBarLine() {
		return barLine;
	}

	public void setBarLine(String barLine) {
		this.barLine = barLine;
	}

	@Column(name = "BARIG")
	public String getBarIg() {
		return barIg;
	}

	public void setBarIg(String barIg) {
		this.barIg = barIg;
	}
}
