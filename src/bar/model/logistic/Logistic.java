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
	
	private Integer oNo;
	private String oID;
	private String lID;
	private String cID;
	private String sID;
	private Integer oType;
	private String oAddr;
	private String oName;
	private String oPhone;
	private Integer oAmount;
	private Integer oStatus;
	private String oTimeA;//訂單成立時間
	private String oTimeB;//訂單收貨時間
	private String oTimeC;//訂單送達時間
	private Integer oComplete;
	private Integer charge;
	private Integer cost;
	
	public Logistic() {
		
	}
	
	public Logistic(int oNo, String oID) {
		this.oNo = oNo;
		this.oID = oID;
	}
	@Id
	@Column(name="oNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getoNo() {
		return oNo;
	}

	public void setoNo(Integer oNo) {
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
	
	@Column(name="cID")
	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}
	@Column(name="sID")
	public String getsID() {
		return sID;
	}

	public void setsID(String sID) {
		this.sID = sID;
	}
	
	
	@Column(name="oType")
	public Integer getoType() {
		return oType;
	}

	public void setoType(Integer oType) {
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
	public Integer getoAmount() {
		return oAmount;
	}

	public void setoAmount(Integer oAmount) {
		this.oAmount = oAmount;
	}
	@Column(name="oStatus")
	public Integer getoStatus() {
		return oStatus;
	}

	public void setoStatus(Integer oStatus) {
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
	@Column(name="charge")
	public Integer getCharge() {
		return charge;
	}

	public void setCharge(Integer charge) {
		this.charge = charge;
	}
	@Column(name="cost")
	public Integer getCost() {
		return cost;
	}
	
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	
	
	
}
