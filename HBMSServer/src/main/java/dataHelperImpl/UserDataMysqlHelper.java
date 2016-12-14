package dataHelperImpl;

import dataHelper.UserDataHelper;
import message.ResultMessage;
import model.ImageHelper;
import model.MemberTypeHelper;
import model.UserType;
import model.UserTypeHelper;
import po.UserPO;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by alex on 12/4/16.
 */
public class UserDataMysqlHelper implements UserDataHelper {
    Connection connection;
    public UserDataMysqlHelper(){
        connection=DBUtil_Alex.getConnection();
    }

    @Override
    public UserPO getUserData(int id) {
        UserTypeHelper userTypeHelper=new UserTypeHelper();
        MemberTypeHelper memberTypeHelper=new MemberTypeHelper();

        String sentence="select * from user where userID='"+id+"'";
        PreparedStatement preparedStatement;
  //      Image image=null;
        File image = null;
        UserPO userPO=null;
        try{
            preparedStatement = connection.prepareStatement(sentence);
            ResultSet resultSet = preparedStatement.executeQuery();
  /*          ImageIcon icon;
            if (resultSet.getString("portrait") != null) {
                icon = new ImageIcon(resultSet.getString("portrait"));
                image=icon.getImage();
            }*/
            if (resultSet.next()) {
            	 if (resultSet.getString("portrait") != null) {
            		 image= new File(resultSet.getString("portrait"));
            	 }
                                  
			}
            userPO=new UserPO(resultSet.getInt("userID")
                    ,userTypeHelper.getUserType(resultSet.getInt("userType"))
                    ,resultSet.getString("accountName")
                    ,resultSet.getString("password")
                    ,resultSet.getString("name")
                    ,resultSet.getString("contact")
                    ,image
                    ,resultSet.getLong("creditValue")
                    ,memberTypeHelper.getMemberType(resultSet.getInt("memberType"))
                    ,resultSet.getString("memberInfo")
                    ,resultSet.getInt("rank")
                    ,resultSet.getString("workID")
                    ,resultSet.getInt("hotelID")
            );
        }catch(SQLException e){
            e.printStackTrace();
        }
        return userPO;
    }

    @Override
    public ResultMessage addUser(UserPO userPO) throws Exception{
        ImageHelper imageHelper=new ImageHelper();
        String portraitName="portrait"+userPO.getUserID();
        String portraitPath=imageHelper.getProjectPath()+"/res/"+portraitName;
        //maybe in windows it should be: String portraitPath=projectPathHelper.getProjectPath()+"\\res\\"+portraitName;
        //try to put string to
        String sql="INSERT into user(userType,accountName,password,name,contact,portrait,creditValue,memberType,memberInfo,rank,hotelID,workID)" +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,userPO.getUserType().ordinal());
            preparedStatement.setString(2,userPO.getAccountName());
            preparedStatement.setString(3,userPO.getPassword());
            preparedStatement.setString(4,userPO.getName());
            preparedStatement.setString(5,userPO.getContact());
            preparedStatement.setString(6,portraitPath);//to put the image path to the database
//            Image image=userPO.getPortrait();
            File image = userPO.getPortrait();
//       	 没有存File 
 //           imageHelper.saveImage(image,portraitPath);
            preparedStatement.setLong(7,userPO.getCreditValue());
            preparedStatement.setInt(8,userPO.getMemberType().ordinal());
            preparedStatement.setString(9,userPO.getMemberInfo());
            preparedStatement.setInt(10,userPO.getRank());
            preparedStatement.setInt(11,userPO.getHotelid());
            preparedStatement.setString(12,userPO.getWorkid());
            preparedStatement.execute();
        }catch(SQLException e){
            e.printStackTrace();
            return ResultMessage.failure;
        }
        return ResultMessage.success;
    }

    @Override
    public ResultMessage deleteUser(int id) throws Exception{
        ImageHelper imageHelper=new ImageHelper();
        //remind that when deleting a user, the portrait info(both image and its path) should be deleted
        String sql="" + " Select * from user" + " where userID =? ";
        String sql2 = "" + "delete from user where userID = ?";
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()) {
                return ResultMessage.notexist;
            }
            preparedStatement = connection.prepareStatement(sql2);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
            //delete the image
            String portraitName="portrait"+id;
            String portraitPath=imageHelper.getProjectPath()+"/res/"+portraitName;
            //maybe in windows it should be: String portraitPath=projectPathHelper.getProjectPath()+"\\res\\"+portraitName;

        }catch(SQLException e){
            e.printStackTrace();
            return ResultMessage.failure;
        }
        return ResultMessage.success;
    }

    @Override
    public ResultMessage modifyUser(UserPO userPO) throws Exception{
        ImageHelper imageHelper=new ImageHelper();
        String portraitName="portrait"+userPO.getUserID();
        String portraitPath=imageHelper.getProjectPath()+"/res/"+portraitName;
        String sql = ""+
                " update user"+
                " set userid=?,userType=?,accountName=?,password=?,name=?,"+
                " contact=?,portrait=?,creditValue=?,memberType=?," +
                "memberInfo=?,rank=?,hotelID=?,workID=?"+
                " where userID=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,userPO.getUserID());
            preparedStatement.setInt(2,userPO.getUserType().ordinal());
            preparedStatement.setString(3,userPO.getAccountName());
            preparedStatement.setString(4,userPO.getPassword());
            preparedStatement.setString(5,userPO.getName());
            preparedStatement.setString(6,userPO.getContact());
            imageHelper.deleteImage(portraitPath);
 //     Image image=userPO.getPortrait();
            File image=userPO.getPortrait();
//	 没有存File            
  //          imageHelper.saveImage(image,portraitPath);
            preparedStatement.setString(7,portraitPath);
            preparedStatement.setLong(8,userPO.getCreditValue());
            preparedStatement.setInt(9,userPO.getMemberType().ordinal());
            preparedStatement.setString(10,userPO.getMemberInfo());
            preparedStatement.setInt(11,userPO.getRank());
            preparedStatement.setInt(12,userPO.getHotelid());
            preparedStatement.setString(13,userPO.getWorkid());
            preparedStatement.execute();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return ResultMessage.failure;
        }
        return ResultMessage.success;
    }
}
