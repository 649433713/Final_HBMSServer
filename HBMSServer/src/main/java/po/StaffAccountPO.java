package po;

import java.io.Serializable;
import java.util.List;

public class StaffAccountPO implements Serializable{
	String name;
	String password;
	List<UserPO> staffList;
	
	public StaffAccountPO(String n,String p,List<UserPO> sL){
		name=n;
		password=p;
		staffList=sL;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<UserPO> getStaffList() {
		return staffList;
	}

	public void setStaffList(List<UserPO> staffList) {
		this.staffList = staffList;
	}
	
}
