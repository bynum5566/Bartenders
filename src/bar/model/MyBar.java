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
	private String coverUrl;
	private String aboutBar;
	private String barFb;
	private String barLine;
	private String barIg;
	
	public MyBar() {
	}
	
	public MyBar(int companyId,String coverUrl,String aboutBar,String barFb,String barLine,String barIg) {
		this.companyId=companyId;
		this.coverUrl=coverUrl;
		this.aboutBar=aboutBar;
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

	@Column(name = "COVERURL")
	public String getCoverUrl() {
		return coverUrl;
	}

	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}

	@Column(name = "ABOUTBAR")
	public String getAboutBar() {
		return aboutBar;
	}

	public void setAboutBar(String aboutBar) {
		this.aboutBar = aboutBar;
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
