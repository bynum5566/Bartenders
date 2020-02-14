package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "subMessageBoard")
public class SubMessageBoard {

	private Integer id;
	private Integer subId;
	private String account;
	private String time;
	private String blabla;
	private String picture;
	private String deletePassword;

	public SubMessageBoard() {

	}

	public SubMessageBoard(Integer id, Integer subId ,String account, String time, String blabla, String picture,
			String deletePassword) {
		this.id = id;
		this.subId=subId;
		this.account = account;
		this.time = time;
		this.blabla = blabla;
		this.picture = picture;
		this.deletePassword = deletePassword;

	}

	@Column(name = "id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "subid")
	public Integer getSubId() {
		return subId;
	}

	public void setSubId(Integer subId) {
		this.subId = subId;
	}

	@Column(name = "account")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "time")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Column(name = "blabla")
	public String getBlabla() {
		return blabla;
	}

	public void setBlabla(String blabla) {
		this.blabla = blabla;
	}

	@Column(name = "picture")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "deletePassword")
	public String getDeletePassword() {
		return deletePassword;
	}

	public void setDeletePassword(String deletePassword) {
		this.deletePassword = deletePassword;
	}

}
