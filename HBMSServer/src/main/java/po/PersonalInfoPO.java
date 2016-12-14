package po;

import java.awt.Image;
import java.io.Serializable;

public class PersonalInfoPO implements Serializable{
	String name;
	String contactInfo;
	Image portrait;
	
	
	
	@Override
	public String toString() {
		return "PersonalInfoPO [name=" + name + ", contactInfo=" + contactInfo + ", portrait=" + portrait + "]";
	}
	public PersonalInfoPO(String name, String contactInfo, Image portrait) {
		super();
		this.name = name;
		this.contactInfo = contactInfo;
		this.portrait = portrait;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContactInfo() {
		return contactInfo;
	}
	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}
	public Image getPortrait() {
		return portrait;
	}
	public void setPortrait(Image portrait) {
		this.portrait = portrait;
	}
	
}
