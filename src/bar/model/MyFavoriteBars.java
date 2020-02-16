package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "myfavoritebars")
@Component
public class MyFavoriteBars {
	private int fNum;
	private int userId;
	private int companyId;
	private String disliked;

	public MyFavoriteBars() {
	}

	public MyFavoriteBars(int fNum, int userId, int companyId, String disliked) {
		this.fNum=fNum;
		this.userId=userId;
		this.companyId=companyId;
		this.disliked=disliked;
	}
	
	@Id
	@Column(name = "FNUM")
	public int getfNum() {
		return fNum;
	}

	public void setfNum(int fNum) {
		this.fNum = fNum;
	}

	@Column(name = "USERID")
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "COMPANYID")
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	@Column(name = "DISLIKED")
	public String getDisliked() {
		return disliked;
	}

	public void setDisliked(String disliked) {
		this.disliked = disliked;
	}
	
}
