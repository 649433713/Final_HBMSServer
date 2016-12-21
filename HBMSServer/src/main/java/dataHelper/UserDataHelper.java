package dataHelper;
import message.ResultMessage;
import po.UserPO;

import java.util.Map;

/**
 * Created by alex on 16-11-6.
 */
public interface UserDataHelper {
    public UserPO getUserData(int id);

    public UserPO getUserData(String accountName);
   
    public ResultMessage addUser(UserPO userPO);
   
    public ResultMessage deleteUser(int id);
   
    public ResultMessage modifyUser(UserPO userPO);

    public int checkIsOn(int userID);

    public void setIsOn(String accountName,int value);
}
