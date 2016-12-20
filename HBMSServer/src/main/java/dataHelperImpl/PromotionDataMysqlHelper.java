package dataHelperImpl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import dataHelper.PromotionDataHelper;
import message.ResultMessage;
import model.DiscountTypeHelper;
import model.PromotionFilter;
import model.PromotionTypeHelper;
import po.PromotionPO;

public class PromotionDataMysqlHelper implements PromotionDataHelper{
	Connection connection;

	public PromotionDataMysqlHelper(){
		connection=DBUtil.getConnection();
	}

	@Override
	public Map<Integer, PromotionPO> getPromotionList(PromotionFilter promotionFilter)throws Exception {
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer stringBuffer = new StringBuffer("select * from promotion where 1=1");
		//transfer filter to stringBuffer
		if(promotionFilter!=null&&promotionFilter.filter.size()>0){
			for(int i=0;i<promotionFilter.filter.size();i++){
				Map<String,Object> map=promotionFilter.filter.get(i);
				if(map.get("name").equals("startDate")){
					if(map.get("relation").equals("<")){
					    stringBuffer.append(" and DATEDIFF(startDate,'"+simpleDateFormat.format(map.get("value"))+"')<0");
                    }else{
                        stringBuffer.append(" and DATEDIFF(startDate,'"+simpleDateFormat.format(map.get("value"))+"')>0");
                    }
				}else if(map.get("name").equals("endDate")){
				    if(map.get("relation").equals("<")){
                        stringBuffer.append(" and DATEDIFF(endDate,'"+simpleDateFormat.format(map.get("value"))+"')<0");
                    }else{
                        stringBuffer.append(" and DATEDIFF(endDate,'"+simpleDateFormat.format(map.get("value"))+"')>0");
                    }

				}else{
					stringBuffer.append(" and "+map.get("name")+" "+map.get("relation")+" "+map.get("value"));
				}
			}
		}
		stringBuffer.append("  order by startDate");
		Map<Integer,PromotionPO> map=new LinkedHashMap<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(stringBuffer.toString());
            ResultSet resultSet = preparedStatement.executeQuery();
            PromotionTypeHelper promotionTypeHelper=new PromotionTypeHelper();
            DiscountTypeHelper discountTypeHelper=new DiscountTypeHelper();

            PromotionPO promotionPO;
            while (resultSet.next()){
                promotionPO=new PromotionPO(resultSet.getInt("promotionID")
                        ,promotionTypeHelper.getPromotionType(resultSet.getInt("promotionType"))
                        ,resultSet.getInt("region"),resultSet.getString("name")
                        ,resultSet.getString("content"),resultSet.getTimestamp("startDate")
                        ,resultSet.getTimestamp("endDate"),resultSet.getInt("minRankAvailable")
                        ,resultSet.getInt("maxRankAvailable")
                        ,discountTypeHelper.getDiscountType(resultSet.getInt("type"))
                        ,resultSet.getInt("requirement")
                        ,resultSet.getInt("discount"));
                map.put(promotionPO.getPromotionID(),promotionPO);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
		return map;
	}

	@Override
	public ResultMessage addPromotion(PromotionPO po) throws Exception{


        String sql = ""+
                " insert into promotion"+
                " (promotionType,region,name,content,"+
                " startDate,endDate,minRankAvailable,maxRankAvailable,type,requirement,discount)"+
                " values(?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1,po.getPromotionType().ordinal());
			preparedStatement.setInt(2,po.getRegion());
			preparedStatement.setString(3,po.getName());
			preparedStatement.setString(4,po.getContent());
			preparedStatement.setDate(5,new Date(po.getStartDate().getTime()));
			preparedStatement.setDate(6,new Date(po.getEndDate().getTime()));
			preparedStatement.setInt(7,po.getMinRankAvailable());
			preparedStatement.setInt(8,po.getMaxRankAvailable());
			preparedStatement.setInt(9,po.getType().ordinal());
			preparedStatement.setInt(10,po.getRequirement());
			preparedStatement.setInt(11,po.getDiscount());
			preparedStatement.execute();
		}catch(SQLException e){
			e.printStackTrace();
			return ResultMessage.failure;
		}
		return ResultMessage.success;
	}

	@Override
	public ResultMessage deletePromotion(int id) throws Exception {
		String sql="" + " Select * from promotion" + " where promotionID =? ";
		String sql2 = "" + "delete from promotion where promotionID = ?";
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

		}catch(SQLException e){
			e.printStackTrace();
			return ResultMessage.failure;
		}
		return ResultMessage.success;
	}

	@Override
	public ResultMessage updatePromotion(PromotionPO po) throws Exception{
		String sql;
		if(po.getRegion()!=0){
			sql=" "+
					"update promotion " +
					"set promotionType=?,region=?,name=?,content=?,startDate=?,endDate=?,minRankAvailable=?,maxRankAvailable=?,type=?,requirement=?,discount=? " +
					"where promotionID=?";
			try{
				PreparedStatement preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setInt(1,po.getPromotionType().ordinal());
				preparedStatement.setInt(2,po.getRegion());
				preparedStatement.setString(3,po.getName());
				preparedStatement.setString(4,po.getContent());
				preparedStatement.setDate(5,new Date(po.getStartDate().getTime()));
				preparedStatement.setDate(6,new Date(po.getEndDate().getTime()));
				preparedStatement.setInt(7,po.getMinRankAvailable());
				preparedStatement.setInt(8,po.getMaxRankAvailable());
				preparedStatement.setInt(9,po.getType().ordinal());
				preparedStatement.setInt(10,po.getRequirement());
				preparedStatement.setInt(11,po.getDiscount());
				preparedStatement.setInt(12,po.getPromotionID());
				preparedStatement.execute();
			}catch(SQLException e){
				e.printStackTrace();
				return ResultMessage.failure;
			}
		}else{
			sql=" "+
					"update promotion " +
					"set promotionType=?,name=?,content=?,startDate=?,endDate=?,minRankAvailable=?,maxRankAvailable=?,type=?,requirement=?,discount=? " +
					"where promotionID=?";
			try{
				PreparedStatement preparedStatement=connection.prepareStatement(sql);
				preparedStatement.setInt(1,po.getPromotionType().ordinal());
				preparedStatement.setString(2,po.getName());
				preparedStatement.setString(3,po.getContent());
				preparedStatement.setDate(4,new Date(po.getStartDate().getTime()));
				preparedStatement.setDate(5,new Date(po.getEndDate().getTime()));
				preparedStatement.setInt(6,po.getMinRankAvailable());
				preparedStatement.setInt(7,po.getMaxRankAvailable());
				preparedStatement.setInt(8,po.getType().ordinal());
				preparedStatement.setInt(9,po.getRequirement());
				preparedStatement.setInt(10,po.getDiscount());
				preparedStatement.setInt(11,po.getPromotionID());
				preparedStatement.execute();
			}catch(SQLException e){
				e.printStackTrace();
				return ResultMessage.failure;
			}
		}
		return ResultMessage.success;
	}
}
