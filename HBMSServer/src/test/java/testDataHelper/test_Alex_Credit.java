package testDataHelper;

import dao.CreditDao;
import daoImpl.CreditDaoImpl;
import dataHelperImpl.DBUtil_Alex;
import model.CreditRecordReasonTypeHelper;
import po.CreditRecordPO;

import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by alex on 12/11/16.
 */
public class test_Alex_Credit {
    static Map<Integer, CreditRecordPO> map;
    static void getCreditRecordList(int id)throws Exception{
        CreditRecordPO creditRecordPO;
        CreditDao creditDao=new CreditDaoImpl();
        map=creditDao.getCreditRecordList(id);
        System.out.println("the map size is: "+map.size());
        if(map.size()==0){
            System.out.println("the map is null");
        }else{
            Set set=map.keySet();
            for(Object obj:set){
                Integer k=(Integer) obj;
                creditRecordPO=(CreditRecordPO)map.get(k);
                System.out.println("checking creditRecord number: "+k);
                System.out.println(creditRecordPO.getAmount());
                System.out.println(creditRecordPO.getReasonType());
            }
        }
        System.out.println();
    }

    static void addCreditRecord()throws Exception{
        CreditDao creditDao=new CreditDaoImpl();
        CreditRecordReasonTypeHelper reasonTypeHelper=new CreditRecordReasonTypeHelper();
        long number=400;
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        format.format(date);
        CreditRecordPO creditRecordPOTest=new CreditRecordPO(0,date,1,reasonTypeHelper.getCreditRecordReasonType(0),number,10);
        creditDao.addCreditRecord(creditRecordPOTest);
    }

    static long getCreditValue()throws Exception{
        CreditDao creditDao=new CreditDaoImpl();
        long number=creditDao.getCreditValue(2);
        System.out.println("the credit value is: "+number);
        return number;
    }

    static void setCreditValue()throws Exception{
        CreditDao creditDao=new CreditDaoImpl();
        long number2=300;
        long number1=getCreditValue();
        System.out.println(creditDao.setCreditValue(2,number2));
    }

    public static void main(String args[])throws Exception{
        Connection connection= DBUtil_Alex.getConnection();
        Statement statement=connection.createStatement();
        statement.execute("ALTER TABLE hbmsdatabase.creditrecord AUTO_INCREMENT = 8");
        getCreditRecordList(1);
        getCreditRecordList(2);
        //addCreditRecord();
        //getCreditValue();
        //setCreditValue();
    }
}
