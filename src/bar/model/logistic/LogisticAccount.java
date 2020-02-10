package bar.model.logistic;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "logisticAccount")
public class LogisticAccount {

	private int userId;
	private String logisticName;
	private String logisticPwd;

	public LogisticAccount() {
	}
	
	public LogisticAccount(String logisticName, String logisticPwd) {
		this.logisticName = logisticName;
		this.logisticPwd = logisticPwd;
	}
	@Id
	@Column(name="USERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Column(name="LOGISTICNAME")
	public String getLogisticName() {
		return logisticName;
	}

	public void setLogisticName(String logisticName) {
		this.logisticName = logisticName;
	}
	@Column(name="LOGISTICPWD")
	public String getLogisticPwd() {
		return logisticPwd;
	}

	public void setLogisticPwd(String logisticPwd) {
		this.logisticPwd = logisticPwd;
	}
	
	
	
	

}
