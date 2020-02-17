package bar.model.logistic;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Bar")
@XmlRootElement(name = "Bar")
public class Bar {

	private int barId;
	private String name;
	private String address;
	private float lat;
	private float lng;
	private String type;
	private String img;
	private String brief;
	private String status;
	private String icon;
	private String beginTime;
	private String endTime;
	private int number;
	
	
	@Id
	@Column(name="BARID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	public int getBarId() {
		return barId;
	}

	@XmlElement
	public void setBarId(int barId) {
		this.barId = barId;
	}

	@Column(name="NAME")
	public String getName() {
		return name;
	}


	@XmlElement
	public void setName(String name) {
		this.name = name;
	}


	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}


	@XmlElement
	public void setAddress(String address) {
		this.address = address;
	}


	@Column(name="LAT")
	public float getLat() {
		return lat;
	}


	@XmlElement
	public void setLat(float lat) {
		this.lat = lat;
	}


	@Column(name="LNG")
	public float getLng() {
		return lng;
	}


	@XmlElement
	public void setLng(float lng) {
		this.lng = lng;
	}


	@Column(name="TYPE")
	public String getType() {
		return type;
	}


	@XmlElement
	public void setType(String type) {
		this.type = type;
	}
	
	
	@Column(name="IMG")
	public String getImg() {
		return img;
	}
	@XmlElement
	public void setImg(String img) {
		this.img = img;
	}
	@Column(name="BRIEF")
	public String getBrief() {
		return brief;
	}
	@XmlElement
	public void setBrief(String brief) {
		this.brief = brief;
	}
	@Column(name="STATUS")
	public String getStatus() {
		return status;
	}
	@XmlElement
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name="ICON")
	public String getIcon() {
		return icon;
	}
	@XmlElement
	public void setIcon(String icon) {
		this.icon = icon;
	}
	@Column(name="BEGINTIME")
	public String getBeginTime() {
		return beginTime;
	}
	@XmlElement
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	@Column(name="ENDTIME")
	public String getEndTime() {
		return endTime;
	}
	@XmlElement
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Column(name="NUMBER")
	public int getNumber() {
		return number;
	}
	@XmlElement
	public void setNumber(int number) {
		this.number = number;
	}






}
