package dataHelper;
import message.ResultMessage;
import po.UserPO;

import java.util.Map;

/**
 * Created by alex on 16-11-6.
 */
public interface UserDataHelper {
    public UserPO getUserData(int id) throws Exception;

    public UserPO getUserData(String accountName) throws Exception;
   
    public ResultMessage addUser(UserPO userPO) throws Exception;
   
    public ResultMessage deleteUser(int id) throws Exception;
   
    public ResultMessage modifyUser(UserPO userPO) throws Exception;

    public int checkIsOn(int userID) throws Exception;

    public void setIsOn(String accountName,int value) throws Exception;
}
