package dataHelperImpl;

import java.awt.Image;
import java.io.File;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.swing.ImageIcon;

import dataHelper.HotelDataHelper;
import message.ResultMessage;
import model.DateToDayOff;
import model.HotelFilter;
import model.ImageHelper;
import po.CommentInfoPO;
import po.HotelPO;
import po.RegionPO;

/**
 * @author 凡
 *
 */
public class HotelDataMysqlHelper implements HotelDataHelper {
	Connection connection;
	ImageHelper imageHelper;

	public HotelDataMysqlHelper() {
		connection = DBUtil.getConnection();
		imageHelper = new ImageHelper();
	}

	@Override
	public Map<Integer, HotelPO> getHotelList(HotelFilter filter,String order,java.util.Date date) {

		if (date!=null) {
			
	        String dayOff = DateToDayOff.dateToDatOff(date);
			
			String sql = "{call updateLowestPrice(?)}";
			try {
				CallableStatement callableStatement = connection.prepareCall(sql);
				callableStatement.setString(1, dayOff);
				callableStatement.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
		StringBuffer stringBuffer = new StringBuffer("select * from hotel where 1=1");

		if (filter != null && filter.filter.size() > 0) {
			for (int i = 0; i < filter.filter.size(); i++) {
				Map<String, Object> map = filter.filter.get(i);
				stringBuffer.append(" and " + map.get("name") + " " + map.get("relation") + " " + map.get("value"));
			}
		}
		if (order!=null) {
			if (order.equals("lowestPrice")) {
				stringBuffer.append(" order by "+order);
			}
			else {
				stringBuffer.append(" order by "+order+" desc");
			}
		
		}
		Map<Integer, HotelPO> map = new LinkedHashMap<>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(stringBuffer.toString());
			ResultSet resultSet = preparedStatement.executeQuery();

			HotelPO hotelPO = null;
			while (resultSet.next()) {
				/*List<Image> images = new ArrayList<>();
				ImageIcon icon;
				if (resultSet.getString("environment1") != null) {
					icon = new ImageIcon(resultSet.getString("environment1"));
					images.add(icon.getImage());
				}
				if (resultSet.getString("environment2") != null) {
					icon = new ImageIcon(resultSet.getString("environment2"));
					images.add(icon.getImage());
				}
				if (resultSet.getString("environment3") != null) {
					icon = new ImageIcon(resultSet.getString("environment3"));
					images.add(icon.getImage());
				}
*/
				List<File>images = new ArrayList<>();
				File file;
				if (resultSet.getString("environment1") != null) {
					file = new File(resultSet.getString("environment1"));
					images.add(file);
				}
				if (resultSet.getString("environment2") != null) {
					file = new File(resultSet.getString("environment2"));
					images.add(file);
				}
				if (resultSet.getString("environment3") != null) {
					file = new File(resultSet.getString("environment3"));
					images.add(file);
				}
				hotelPO = new HotelPO(resultSet.getString("name"), resultSet.getInt("hotelID"),
						resultSet.getInt("star"), resultSet.getString("address"), resultSet.getInt("region"),
						resultSet.getString("introduction"), resultSet.getString("facility"), images,
						resultSet.getDouble("score"),resultSet.getInt("lowestPrice"),resultSet.getString("accountName"));

	
				map.put(hotelPO.getId(), hotelPO);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return map;
	}

	@Override
	public int addHotel(HotelPO hotelPO) {
		int hotelID;
		/*
		 * 这个path我是不会存
		 * 
		 */
		String sql = ""+
					" insert into hotel"+
					" (name,address,region,introduction,"+
					" star,facility,score,accountName)"+
					" values(?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, hotelPO.getName());
			preparedStatement.setString(2, hotelPO.getAddress());
			preparedStatement.setInt(3, hotelPO.getRegion());
			preparedStatement.setString(4, hotelPO.getIntroduction());
			preparedStatement.setInt(5, hotelPO.getStar());
			preparedStatement.setString(6, hotelPO.getFacility());
			preparedStatement.setDouble(7, hotelPO.getScore());
			preparedStatement.setString(8, hotelPO.getAccountName());
			
			preparedStatement.execute();
			
			preparedStatement = connection.prepareStatement("select max(hotelID) from hotel");
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				hotelID =resultSet.getInt(1);
				imageHelper.makeHotelDir(hotelID);
				return hotelID;
		
			}
			else {
				return 0;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public ResultMessage updateHotel(HotelPO hotelPO) {

		String sql = ""+
					" update hotel"+
					" set name=?,address=?,region=?,introduction=?,"+
					" star=?,facility=?,score=?"+
					" where hotelID=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, hotelPO.getName());
			preparedStatement.setString(2, hotelPO.getAddress());
			preparedStatement.setInt(3, hotelPO.getRegion());
			preparedStatement.setString(4, hotelPO.getIntroduction());
			preparedStatement.setInt(5, hotelPO.getStar());
			preparedStatement.setString(6, hotelPO.getFacility());
			preparedStatement.setDouble(7, hotelPO.getScore());
			preparedStatement.setInt(8, hotelPO.getId());
			saveImage(hotelPO.getId(), hotelPO.getEnvironment());
			preparedStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResultMessage.failure;
		}
		return ResultMessage.success;
	}

	@Override
	public ResultMessage delHotel(int hotelID) {

		String sql = "" + " Select * from hotel" + " where hotelID =? ";

		String sql2 = "" + "delete from hotel where hotelID = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, hotelID);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (!resultSet.next()) {
				System.out.println("不存在此id");
				return ResultMessage.notexist;
			}

			preparedStatement = connection.prepareStatement(sql2);
			preparedStatement.setInt(1, hotelID);
			preparedStatement.execute();
				
			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResultMessage.failure;
		}

		return ResultMessage.success;
	}

	@Override
	public List<CommentInfoPO> getComments(int hotelID) {
			
		String sql = "select * from commentinfo where hotelID =? ";

		List<CommentInfoPO> list = new ArrayList<>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, hotelID);
			ResultSet resultSet = preparedStatement.executeQuery();

			CommentInfoPO commentInfoPO = null;
			while (resultSet.next()) {
	
				File image1 = null,image2 = null,image3 = null;
				if (resultSet.getString("picture1") != null) {
					image1 = new File(resultSet.getString("picture1"));
	
				}
				if (resultSet.getString("picture2") != null) {
					image2 = new File(resultSet.getString("picture2"));
					
				}
				if (resultSet.getString("picture3") != null) {
					image3 = new File(resultSet.getString("picture3"));
				}

				commentInfoPO = new CommentInfoPO(resultSet.getInt("commentID"), 
						resultSet.getDate("time"), resultSet.getInt("hotelID"), 
						resultSet.getInt("score"), resultSet.getString("comment"),
						image1,image2,image3);

				list.add(commentInfoPO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return list;
		
	
	}

	@Override
	public ResultMessage addComment(CommentInfoPO commentInfoPO) {
		String imagePath1 = null;
		String imagePath2 = null;
		String imagePath3 = null;
		try {
			String path = imageHelper.getHotelDir(commentInfoPO.getHotelID()).getPath();
			if (commentInfoPO.getPicture1()!=null) {
				imagePath1 = path+"/"+commentInfoPO.getCommentID()+"comment1";
				imageHelper.saveImage(commentInfoPO.getPicture1(), imagePath1);
			}
			if (commentInfoPO.getPicture2()!=null) {
				imagePath1 = path+"/"+commentInfoPO.getCommentID()+"comment2";
				imageHelper.saveImage(commentInfoPO.getPicture2(), imagePath2);
			}
			if (commentInfoPO.getPicture3()!=null) {
				imagePath1 = path+"/"+commentInfoPO.getCommentID()+"comment3";
				imageHelper.saveImage(commentInfoPO.getPicture2(), imagePath3);
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/*
		 * 这个path我是不会存
		 * 
		 */
		String sql = ""+
					" insert into commentinfo"+
					" (time,hotelID,score,comment,picture1,picture2,picture3)"+
					" values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setDate(1,new Date(commentInfoPO.getTime().getTime()));
			preparedStatement.setInt(2,commentInfoPO.getHotelID());
			preparedStatement.setInt(3,commentInfoPO.getScore());
			preparedStatement.setString(4,commentInfoPO.getComment());
			preparedStatement.setString(5, imagePath1);
			preparedStatement.setString(6, imagePath2);
			preparedStatement.setString(7, imagePath3);
			preparedStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResultMessage.failure;
		}
		return ResultMessage.success;
	
	}


	@Override
	public List<String> getProvinces() {
		
		String sql = "select province from region group by province";

		ArrayList<String> list = new ArrayList<>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(sql);
	
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				list.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return list;
	}

	@Override
	public List<String> getCities(String province) {
		String sql = "select city from region where province = '"+province+"' group by city";

		ArrayList<String> list = new ArrayList<>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(sql);
	
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				list.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return list;

	}

	@Override
	public Map<Integer, RegionPO> getRegions(String city) {
		
		String sql = "select * from region where city = '"+city+"'";

		Map<Integer, RegionPO> map = new LinkedHashMap<>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(sql);
	
			ResultSet resultSet = preparedStatement.executeQuery();

			RegionPO regionPO = null;
			while (resultSet.next()) {

				regionPO = new RegionPO(resultSet.getInt("regionID"),
						resultSet.getString("province") , resultSet.getString("city"), 
						resultSet.getString("regionName"));
				
				map.put(regionPO.getRegionID(), regionPO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return map;

	}

	private ResultMessage saveImage(int hotelID,List<File> images){
		ImageHelper imageHelper = new ImageHelper();
		String path1 = null;
		String path2 = null;
		String path3 = null;
		
		try {
			imageHelper.deldir(imageHelper.getHotelDir(hotelID));
			imageHelper.makeHotelDir(hotelID);
			if (images.get(0)!=null) {
				path1= imageHelper.getHotelDir(hotelID).getPath()+"/picture1.jpg";
				imageHelper.saveImage(images.get(0), path1);
			}
			if (images.get(1)!=null) {
				path2= imageHelper.getHotelDir(hotelID).getPath()+"/picture2.jpg";	
				imageHelper.saveImage(images.get(1), path2);
			}
			if (images.get(2)!=null) {
				path3= imageHelper.getHotelDir(hotelID).getPath()+"/picture3.jpg";	
				imageHelper.saveImage(images.get(2), path3);
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		
		
		String sql = ""+
				" update hotel"+
				" set environment1=?,environment2=?,environment3=?"+
				" where hotelID=?";
		try {
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1,path1);
		preparedStatement.setString(2,path2);
		preparedStatement.setString(3, path3);
		preparedStatement.setInt(4, hotelID);		
		preparedStatement.execute();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return ResultMessage.failure;
	}
	return ResultMessage.success;
		
	}
}
