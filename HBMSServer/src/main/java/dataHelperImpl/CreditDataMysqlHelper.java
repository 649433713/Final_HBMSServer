package dataHelperImpl;

import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

import dataHelper.CreditDataHelper;
import message.ResultMessage;
import model.CreditRecordReasonTypeHelper;
import po.CreditRecordPO;

public class CreditDataMysqlHelper implements CreditDataHelper{
	Connection connection;

	public CreditDataMysqlHelper() {
		connection=DBUtil.getConnection();
	}


	@Override
	public Map<Integer, CreditRecordPO> getCreditRecordList(int userID) {
		CreditRecordReasonTypeHelper reasonTypeHelper=new CreditRecordReasonTypeHelper();
		String sentence="select * from creditrecord where userID='"+userID+"'";
		Map<Integer,CreditRecordPO> map=new LinkedHashMap<>();
		PreparedStatement preparedStatement;
		try{
			preparedStatement=connection.prepareStatement(sentence);
			ResultSet resultSet = preparedStatement.executeQuery();
			CreditRecordPO creditRecordPO;
			while(resultSet.next()){
				creditRecordPO=new CreditRecordPO(resultSet.getInt("creditRecordID")
						,resultSet.getTime("time"),resultSet.getInt("userID")
						,reasonTypeHelper.getCreditRecordReasonType(resultSet.getInt("reasonType"))
						,resultSet.getLong("amount"),resultSet.getInt("orderID"));
				map.put(creditRecordPO.getCreditRecordID(),creditRecordPO);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public ResultMessage addCreditRecord(CreditRecordPO po) {
		boolean isPopup=false;
		if(po.getOrderID()==0) isPopup=true;
		String sql="INSERT into creditrecord(time,userID,reasonType,amount,orderID)" +
				"VALUES (?,?,?,?,?)";

		String sql1="INSERT into creditrecord(time,userID,reasonType,amount)" +
				"VALUES (?,?,?,?)";

		PreparedStatement preparedStatement;
		if(isPopup){
			try{
				preparedStatement=connection.prepareStatement(sql1);
				preparedStatement.setTimestamp(1,this.getTimestamp(new Date(po.getTime().getTime())));
				preparedStatement.setInt(2,po.getUserID());
				preparedStatement.setInt(3,po.getReasonType().ordinal());
				preparedStatement.setLong(4,po.getAmount());
				preparedStatement.execute();
			}catch(SQLException e){
				e.printStackTrace();
				return ResultMessage.failure;
			}
		}else{
			try{
				preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setTimestamp(1,this.getTimestamp(new Date(po.getTime().getTime())));
				preparedStatement.setInt(2,po.getUserID());
				preparedStatement.setInt(3,po.getReasonType().ordinal());
				preparedStatement.setLong(4,po.getAmount());
				preparedStatement.setInt(5,po.getOrderID());
				preparedStatement.execute();
			}catch(SQLException e){
				e.printStackTrace();
				return ResultMessage.failure;
			}
		}

		return ResultMessage.success;
	}

	public Timestamp getTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}
