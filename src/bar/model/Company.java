package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "company")
public class Company {
	private int companyId;
	private String account;
	private String password;
	private String companyName;
	private String taxId;
	private String phone;
	private String email;
	private String address;
//	private byte[] photo;
	private String x_LINE_ChannelId;
	private String x_LINE_ChannelSecret;
	private String role;// ********

	public Company() {
	}

	public Company(String account, String password, String companyName, String taxId, String phone, String email,
			String address, String x_LINE_ChannelId, String x_LINE_ChannelSecret, String role) {
		this.account = account;
		this.password = password;
		this.companyName = companyName;
		this.taxId = taxId;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.x_LINE_ChannelId = x_LINE_ChannelId;
		this.x_LINE_ChannelSecret = x_LINE_ChannelSecret;
		this.role = role;
	}

	@Id
	@Column(name = "companyId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCompanyId() {	
		return companyId;	
	}	
	
	public void setCompanyId(int companyId) {	
		this.companyId = companyId;	
	}

	@Column(name = "account")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "companyName")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "taxId")
	public String getTaxId() {
		return taxId;
	}

	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}

	@Column(name = "phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

//	@Column(name = "photo")
//	public byte[] getPhoto() {
//		return photo;
//	}
//
//	public void setPhoto(byte[] photo) {
//		this.photo = photo;
//	}

	@Column(name = "x_LINE_ChannelId")
	public String getX_LINE_ChannelId() {
		return x_LINE_ChannelId;
	}

	public void setX_LINE_ChannelId(String x_LINE_ChannelId) {
		this.x_LINE_ChannelId = x_LINE_ChannelId;
	}

	@Column(name = "x_LINE_ChannelSecret")
	public String getX_LINE_ChannelSecret() {
		return x_LINE_ChannelSecret;
	}

	public void setX_LINE_ChannelSecret(String x_LINE_ChannelSecret) {
		this.x_LINE_ChannelSecret = x_LINE_ChannelSecret;
	}
	
	//------------------------
	@Column(name = "role")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
