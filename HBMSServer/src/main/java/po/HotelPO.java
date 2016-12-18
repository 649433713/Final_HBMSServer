package po;

import java.io.File;
import java.io.Serializable;
import java.util.List;

/**
 * @author 凡
 *
 */
public class HotelPO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6985078492096193944L;
	String name;
	int id;
	int star;
	String address;
	int region;
	String introduction;
	String facility;
	List<File> environment;
	double score;
	int lowestPrice;
	String accountName;
	
	

	public HotelPO() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getRegion() {
		return region;
	}

	public void setRegion(int region) {
		this.region = region;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public List<File> getEnvironment() {
		return environment;
	}

	public void setEnvironment(List<File> environment) {
		this.environment = environment;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getLowestPrice() {
		return lowestPrice;
	}

	public void setLowestPrice(int lowestPrice) {
		this.lowestPrice = lowestPrice;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	@Override
	public String toString() {
		return "HotelPO [name=" + name + ", id=" + id + ", star=" + star + ", address=" + address + ", region=" + region
				+ ", introduction=" + introduction + ", facility=" + facility + ", environment=" + environment
				+ ", score=" + score + ", lowestPrice=" + lowestPrice + ", accountName=" + accountName + "]";
	}

	public HotelPO(String name, int id, int star, String address, int region, String introduction, String facility,
			List<File> environment, double score, int lowestPrice, String accountName) {
		super();
		this.name = name;
		this.id = id;
		this.star = star;
		this.address = address;
		this.region = region;
		this.introduction = introduction;
		this.facility = facility;
		this.environment = environment;
		this.score = score;
		this.lowestPrice = lowestPrice;
		this.accountName = accountName;
	}

	
	
	
	
}
