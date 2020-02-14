package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="newsandevents")
public class EventsAndNews {
	private String neId;
	private int companyId;
	private String neTitle;
	private String neText;
	private String nePostDate;
	private String deleteTag;
	
	public EventsAndNews() {
	}
	
	public EventsAndNews(String neId, int companyId, String neTitle, String neText, String nePostDate) {
		this.neId=neId;
		this.companyId=companyId;
		this.neTitle=neTitle;
		this.neText=neText;
		this.nePostDate=nePostDate;
	}

	@Id
	@Column(name="NEID")
	public String getNeId() {
		return neId;
	}

	public void setNeId(String neId) {
		this.neId = neId;
	}

	@Column(name="COMPANYID")
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	@Column(name="NETITLE")
	public String getNeTitle() {
		return neTitle;
	}

	public void setNeTitle(String neTitle) {
		this.neTitle = neTitle;
	}

	@Column(name="NETEXT")
	public String getNeText() {
		return neText;
	}

	public void setNeText(String neText) {
		this.neText = neText;
	}

	@Column(name="NEPOSTDATE")
	public String getNePostDate() {
		return nePostDate;
	}

	public void setNePostDate(String nePostDate) {
		this.nePostDate = nePostDate;
	}

	@Column(name="DELETETAG")
	public String getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(String deleteTag) {
		this.deleteTag = deleteTag;
	}
	
}
