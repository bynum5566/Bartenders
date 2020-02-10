package bar.model.logistic;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "logistic")
public class Logistic {
	
	private int oNo;
	private String oID;
	private String lID;
	private int oType;
	private String oAddr;
	private String oName;
	private String oPhone;
	private int oAmount;
	private int oStatus;
	private String oTimeA;//訂單成立時間
	private String oTimeB;//訂單收貨時間
	private String oTimeC;//訂單送達時間
	private Integer oComplete;
	
	public Logistic() {
		
	}
	
	public Logistic(int oNo, String oID) {
		this.oNo = oNo;
		this.oID = oID;
	}
	@Id
	@Column(name="oNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	
	
	@Column(name="oID")
	public String getoID() {
		return oID;
	}

	public void setoID(String oID) {
		this.oID = oID;
	}

	@Column(name="lID")
	public String getlID() {
		return lID;
	}

	public void setlID(String lID) {
		this.lID = lID;
	}
	@Column(name="oType")
	public int getoType() {
		return oType;
	}

	public void setoType(int oType) {
		this.oType = oType;
	}
	@Column(name="oAddr")
	public String getoAddr() {
		return oAddr;
	}

	public void setoAddr(String oAddr) {
		this.oAddr = oAddr;
	}
	@Column(name="oName")
	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}
	@Column(name="oPhone")
	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	@Column(name="oAmount")
	public int getoAmount() {
		return oAmount;
	}

	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}
	@Column(name="oStatus")
	public int getoStatus() {
		return oStatus;
	}

	public void setoStatus(int oStatus) {
		this.oStatus = oStatus;
	}

	@Column(name="oTimeA")
	public String getoTimeA() {
		return oTimeA;
	}

	public void setoTimeA(String oTimeA) {
		this.oTimeA = oTimeA;
	}

	@Column(name="oTimeB")
	public String getoTimeB() {
		return oTimeB;
	}

	public void setoTimeB(String oTimeB) {
		this.oTimeB = oTimeB;
	}

	@Column(name="oTimeC")
	public String getoTimeC() {
		return oTimeC;
	}

	public void setoTimeC(String oTimeC) {
		this.oTimeC = oTimeC;
	}

	@Column(name="oComplete")
	public Integer getoComplete() {
		return oComplete;
	}

	public void setoComplete(Integer oComplete) {
		this.oComplete = oComplete;
	}
	
	
	
}
