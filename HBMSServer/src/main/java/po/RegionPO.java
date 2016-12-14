package po;

import java.io.Serializable;

/**
 * @author 凡
 *
 */
public class RegionPO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7967208747639332844L;
	int regionID;
	String province;
	String city;
	String regionName;
	
	public RegionPO(int regionID, String province, String city, String regionName) {
		super();
		this.regionID = regionID;
		this.province = province;
		this.city = city;
		this.regionName = regionName;
	}

	@Override
	public String toString() {
		return "RegionPO [regionID=" + regionID + ", province=" + province + ", city=" + city + ", regionName="
				+ regionName + "]";
	}

	public int getRegionID() {
		return regionID;
	}

	public void setRegionID(int regionID) {
		this.regionID = regionID;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	
}
