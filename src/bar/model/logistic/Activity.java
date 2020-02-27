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
@Table(name = "Activity")
@XmlRootElement(name = "Activity")
public class Activity {

	private Integer activityId;
	private Integer userId;
	private String name;
	private String address;
	private float lat;
	private float lng;
	private String type;
	private String img;
	private String brief;
	private String content;
	private String beginTime;
	private String endTime;
	private String status;
	private Integer limitNum;
	private Integer targetNum;
	private Integer actualNum;
	
	private Integer orderNum;
	
	@Id
	@Column(name="ACTIVITYID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getActivityId() {
		return activityId;
	}

	@XmlElement
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	@Column(name="USERID")
	public Integer getUserId() {
		return userId;
	}

	@XmlElement
	public void setUserId(Integer userId) {
		this.userId = userId;
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
	
	@Column(name="CONTENT")
	public String getContent() {
		return content;
	}
	@XmlElement
	public void setContent(String content) {
		this.content = content;
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
	@Column(name="STATUS")
	public String getStatus() {
		return status;
	}
	@XmlElement
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name="TARGETNUM")
	public Integer getTargetNum() {
//		System.out.println("targetNum is: "+targetNum);
		return targetNum;
	}
	@XmlElement
	public void setTargetNum(Integer targetNum) {
		this.targetNum = targetNum;
	}
	@Column(name="ACTUALNUM")
	public Integer getActualNum() {
		return actualNum;
	}
	@XmlElement
	public void setActualNum(Integer actualNum) {
		this.actualNum = actualNum;
	}
	@Column(name="ORDERNUM")
	public Integer getOrderNum() {
		return orderNum;
	}
	@XmlElement
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	@Column(name="LIMITNUM")
	public Integer getLimitNum() {
		return limitNum;
	}
	@XmlElement
	public void setLimitNum(Integer limitNum) {
		this.limitNum = limitNum;
	}

	

	


}
