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
@Table(name = "Participant")
@XmlRootElement(name = "Participant")
public class Participant {
	
	private Integer	no;
	private Integer activityId;
	private Integer userId;
	private String name;
	private String phone;
	private Integer together;
	
	@Id
	@Column(name="no")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getNo() {
		return no;
	}
	@XmlElement
	public void setNo(Integer no) {
		this.no = no;
	}
	
	
	@Column(name="activityId")
	public int getActivityId() {
		return activityId;
	}

	@XmlElement
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}
	@Column(name="userId")
	public int getUserId() {
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
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}
	@XmlElement
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name="together")
	public Integer getTogether() {
		return together;
	}
	@XmlElement
	public void setTogether(Integer together) {
		this.together = together;
	}

	




}
