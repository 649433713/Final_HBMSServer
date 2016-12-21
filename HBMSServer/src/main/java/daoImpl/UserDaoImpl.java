package daoImpl;
import dataHelper.DataFactory;
import dataHelper.UserDataHelper;
import dataHelperImpl.DBUtil;
import dataHelperImpl.DataFactoryImpl;
import dao.UserDao;
import message.ResultMessage;
import po.UserPO;

import java.rmi.RemoteException;
import java.sql.Connection;
/**
 * Created by alex on 16-11-9.
 */
public class UserDaoImpl implements UserDao {
    Connection connection;
    private static UserPO userPO;
    private static UserDaoImpl userDaoImpl;
    private DataFactory dataFactory;
    private UserDataHelper userDataHelper;

    public UserDaoImpl() {
        if(userPO==null){
            dataFactory=new DataFactoryImpl();
            userDataHelper=dataFactory.getUserDataHelper();
            connection= DBUtil.getConnection();
        }
    }

    public static UserDaoImpl getInstance(){
        if(userDaoImpl==null){
            userDaoImpl=new UserDaoImpl();
        }
        return userDaoImpl;
    }

    @Override
    public UserPO getUserData(int id) throws RemoteException{
        return userDataHelper.getUserData(id);
    }

    public UserPO getUserData(String accountName) throws RemoteException{
        return userDataHelper.getUserData(accountName);
    }

    @Override
    public ResultMessage addUser(UserPO po) throws RemoteException{
        return userDataHelper.addUser(po);
    }

    @Override
    public ResultMessage deleteUser(int id) throws RemoteException{
        return userDataHelper.deleteUser(id);
    }

    @Override
    public ResultMessage modifyUser(UserPO po) throws RemoteException{
        return userDataHelper.modifyUser(po);
    }

    @Override
    public ResultMessage login(String accountName, String pwd) throws RemoteException{

        userPO=userDataHelper.getUserData(accountName);
        if(userPO!=null&&pwd.equals(userPO.getPassword())){

            if(userDataHelper.checkIsOn(userPO.getUserID())==1){
                return ResultMessage.failure;
            }else{
                userDataHelper.setIsOn(accountName,1);
                return ResultMessage.success;
            }
        }else{
            if(userPO!=null){
                return ResultMessage.wrongPassword;
            }else{
                return ResultMessage.notexist;
            }
        }
    }

    @Override
    public ResultMessage signup(UserPO po) throws RemoteException{

        return userDataHelper.addUser(po);
    }

    @Override
    public ResultMessage logout(String accountName) throws RemoteException{
        userPO=userDataHelper.getUserData(accountName);
        if(userPO==null) return ResultMessage.notexist;
        int isOn=userDataHelper.checkIsOn(userPO.getUserID());
        if(isOn==1){
            userDataHelper.setIsOn(accountName,0);
            return ResultMessage.success;
        }else if(isOn==0){
            return ResultMessage.failure;
        }else return ResultMessage.notexist;
    }
}
