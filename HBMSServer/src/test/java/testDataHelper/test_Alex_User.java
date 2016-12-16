package testDataHelper;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import dataHelperImpl.DBUtil;
import message.ResultMessage;
import model.MemberType;
import model.UserType;
import po.UserPO;

import java.io.File;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by alex on 12/10/16.
 */
public class test_Alex_User {
    static void addUser()throws Exception{
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String time;
        Date date=simpleDateFormat.parse("1996-9-30");
        time=simpleDateFormat.format(date);
        File image=new File("/home/alex/Pictures/admin.png");
        UserPO userPOTest=new UserPO(0, UserType.Customer,"alex2097","123","Alex Yu","13818052097",image,100, MemberType.Person,time,0,null,1);
        UserDao userDao=new UserDaoImpl();
        ResultMessage message;
        message=userDao.addUser(userPOTest);
        if(message.equals(ResultMessage.failure))System.out.println("failed to add a user");
        else System.out.println("add a user successfully");
    }

    static void deleteUser(int i) throws Exception{
        UserDao userDao=new UserDaoImpl();
        ResultMessage message=userDao.deleteUser(i);
    }

    static void modifyUser() throws Exception{
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String time;
        Date date=simpleDateFormat.parse("1996-9-30");
        time=simpleDateFormat.format(date);
        File image=new File("/home/alex/Pictures/test.jpg");

        UserPO userPOTest=new UserPO(2, UserType.Customer,"alex2097","151250187","Alex Yu","15951923079",image,800, MemberType.Person,time,1,null,3);
        UserDao userDao=new UserDaoImpl();
        ResultMessage message=userDao.modifyUser(userPOTest);
    }

    static void getUser(int id)throws Exception{
        UserDao userDao=new UserDaoImpl();
        UserPO userPO=userDao.getUserData(id);
        if(userPO!=null){
            System.out.println(userPO.getAccountName());
            System.out.println(userPO.getUserType());
            System.out.println(userPO.getRank());
        }else System.out.println("no such user found!");

    }

    static void getUser(String accountName)throws Exception{
        UserDao userDao=new UserDaoImpl();
        UserPO userPO=userDao.getUserData(accountName);
        if(userPO!=null){
            System.out.println("the user id is :"+userPO.getUserID());
            System.out.println(userPO.getRank());
            System.out.println(userPO.getMemberInfo());
        }else System.out.println("no such user found!");
    }

    static void signup()throws Exception{
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
        String time;
        Date date=simpleDateFormat.parse("1996-8-24");
        time=simpleDateFormat.format(date);
        File image=new File("/home/alex/Pictures/test.jpg");
        UserPO userPOTest1=new UserPO(0, UserType.Customer,"betaforalex","818818","Alex Yu-beta",null,image,8000, MemberType.Enterprise,time,0,null,5);
        UserPO userPOTest2=new UserPO(0, UserType.Customer,"alex2097","818818","Alex Yu-beta",null,image,8000, MemberType.Enterprise,time,0,null,5);

        UserDao userDao=new UserDaoImpl();
        System.out.println("testing inserting a new user");
        System.out.println(userDao.signup(userPOTest1));
        System.out.println("testing inserting an already added user");
        System.out.println(userDao.signup(userPOTest2));
    }

    static void login() throws Exception{
        UserDao userDao=new UserDaoImpl();
        System.out.println("testing login successfully");
        System.out.println(userDao.login("alex2097","151250187"));
        System.out.println("testing login failed case");
        System.out.println(userDao.login("alex2097","asdf"));
        System.out.println(userDao.login("alex2098","asdf"));
    }

    public static void main(String args[]) throws Exception{
        Connection connection= DBUtil.getConnection();
        Statement statement=connection.createStatement();
        statement.execute("ALTER TABLE hbmsdatabase.user AUTO_INCREMENT = 1");
        deleteUser(2);
        addUser();
        //getUser(1);
        //getUser(3);
        //getUser("alex2097");
        //getUser("alex2098");
        //modifyUser();
        //signup();
        //deleteUser(3);
        //login();
    }
}
