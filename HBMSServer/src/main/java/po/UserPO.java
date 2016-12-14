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
	private static final long serialVersionUID = 8843459876398714280L;
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
}
