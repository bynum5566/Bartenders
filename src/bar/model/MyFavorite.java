package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "myfavorite")
@Component
public class MyFavorite {
	private int fNum;
	private int userId;
	private String pdId;
	private String disliked;

	public MyFavorite() {
	}

	public MyFavorite(int fNum, int userId, String pdId, String disliked) {
		this.fNum=fNum;
		this.userId=userId;
		this.pdId=pdId;
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

	@Column(name = "PDID")
	public String getPdId() {
		return pdId;
	}

	public void setPdId(String pdId) {
		this.pdId = pdId;
	}
	
	@Column(name = "DISLIKED")
	public String getDisliked() {
		return disliked;
	}

	public void setDisliked(String disliked) {
		this.disliked = disliked;
	}
	
}
