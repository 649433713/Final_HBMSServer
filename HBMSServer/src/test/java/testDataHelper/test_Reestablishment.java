package testDataHelper;

import dataHelperImpl.DBUtil;

import java.sql.Connection;
import java.sql.Statement;

/**
 * Created by alex on 12/16/16.
 */
public class test_Reestablishment {
    static void reestablish_User()throws Exception{
        Connection connection= DBUtil.getConnection();
        Statement statement=connection.createStatement();
        statement.execute("ALTER TABLE hbmsdatabase.user AUTO_INCREMENT = 1");
    }

    static void reestablish_Credit()throws Exception{
        Connection connection= DBUtil.getConnection();
        Statement statement=connection.createStatement();
        statement.execute("ALTER TABLE hbmsdatabase.creditrecord AUTO_INCREMENT = 8");
    }

    static void reestablish_Promotion()throws Exception{
        Connection connection= DBUtil.getConnection();
        Statement statement=connection.createStatement();
        ///*
        statement.execute("DELETE FROM hbmsdatabase.promotion");
        //*/
        statement.execute("ALTER TABLE hbmsdatabase.promotion AUTO_INCREMENT = 1");
        //*/
    }

    public static void main(String args[]){
        try {
            reestablish_User();
            reestablish_Credit();
            reestablish_Promotion();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
