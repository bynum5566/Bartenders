package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "messageBoard")
public class MessageBoard {

	private int id;
	private String title;
	private String account;
	private String time;
	private String blabla;
	private String picture;
	private String deletePassword;

	public MessageBoard() {

	}

	public MessageBoard(Integer id, String title, String account, String time, String blabla, String picture,
			String deletePassword) {
		this.id = id;
		this.title = title;
		this.account = account;
		this.time = time;
		this.blabla = blabla;
		this.picture = picture;
		this.deletePassword = deletePassword;

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
