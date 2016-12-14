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
}
