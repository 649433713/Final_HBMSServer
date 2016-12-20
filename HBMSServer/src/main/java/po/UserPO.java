package po;
import model.MemberType;
import model.UserType;
import java.io.File;
import java.io.Serializable;
/**
 * Created by alex on 16-11-17.
 */
public class UserPO implements Serializable{


   

	/**
	 * 
	 */
	private static final long serialVersionUID = 2912504804953590514L;
	int userID;
    UserType userType;
    String accountName;
    String password;
    String name;
    String contact;
    File portrait;
    long creditValue;
    MemberType memberType;
    String memberInfo;
    int rank;
    String workid;
    int hotelid;
    //constructors for allPO
    public UserPO(int userID){
        this.userID=userID;
    }

    public UserPO(int userID,UserType userType, String accountName, String password, String name
            , String contact, File portrait, long creditValue
            , MemberType memberType, String memberInfo, int rank
            , String workid, int hotelid) {
        this.userID = userID;
        this.userType=userType;
        this.accountName = accountName;
        this.password = password;
        this.name = name;
        this.contact = contact;
        this.portrait = portrait;
        this.creditValue = creditValue;
        this.memberType = memberType;
        this.memberInfo = memberInfo;
        this.rank = rank;
        this.workid = workid;
        this.hotelid = hotelid;
    }

    //constructors for customerPO
    public UserPO(int id,String pwd,String name,String contact,
                  File image,long creditValue,MemberType memberType,String memberInfo,int rank){
        this.userID=id;
        this.userType=UserType.Customer;
        this.password=pwd;
        this.accountName=name;
        this.contact=contact;
        this.portrait=image;
        this.creditValue=creditValue;
        this.memberInfo=memberInfo;
        this.memberType=memberType;
        this.rank=rank;
    }

    //constructors for StaffPO
    public UserPO(int id,String pwd,String name,String contact,File image,String workid,int hotelid){
        this.userID=id;
        this.userType=UserType.Staff;
        this.password=pwd;
        this.accountName=name;
        this.contact=contact;
        this.portrait=image;
        this.workid=workid;
        this.hotelid=hotelid;
    }

    //constructors for WebMarketerPO and WebManagerPO
    public UserPO(int id,UserType userType,String pwd,String name,String contact,File image){
        this.userID=id;
        this.userType=userType;
        this.password=pwd;
        this.accountName=name;
        this.contact=contact;
        this.portrait=image;
    }

    //getters
    public int getUserID() {
        return userID;
    }

    public UserType getUserType(){
        return userType;
    }

    public String getAccountName() {
        return accountName;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getContact() {
        return contact;
    }

    public File getPortrait() {
        return portrait;
    }

    public long getCreditValue() {
        return creditValue;
    }

    public MemberType getMemberType() {
        return memberType;
    }

    public String getMemberInfo() {
        return memberInfo;
    }

    public int getRank() {
        return rank;
    }

    public String getWorkid() {
        return workid;
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setCreditValue(long creditValue) {
        this.creditValue = creditValue;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setPortrait(File portrait) {
        this.portrait = portrait;
    }

    public void setMemberType(MemberType memberType) {
        this.memberType = memberType;
    }

    public void setMemberInfo(String memberInfo) {
        this.memberInfo = memberInfo;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public void setWorkid(String workid) {
        this.workid = workid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

	@Override
	public String toString() {
		return "UserPO [userID=" + userID + ", userType=" + userType + ", accountName=" + accountName + ", password="
				+ password + ", name=" + name + ", contact=" + contact + ", portrait=" + portrait + ", creditValue="
				+ creditValue + ", memberType=" + memberType + ", memberInfo=" + memberInfo + ", rank=" + rank
				+ ", workid=" + workid + ", hotelid=" + hotelid + "]";
	}
    
    
}
