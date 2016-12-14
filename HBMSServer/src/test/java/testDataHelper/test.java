package testDataHelper;

import java.rmi.RemoteException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import dao.HotelDao;
import dao.OrderDao;
import dao.RoomDao;
import daoImpl.HotelDaoImpl;
import daoImpl.OrderDaoImpl;
import daoImpl.RoomDaoImpl;
import dataHelperImpl.HotelDataMysqlHelper;
import message.OrderStateMessage;
import message.RoomStateMessage;
import po.AppealPO;
import po.HotelPO;
import po.OrderPO;
import po.RoomInfoPO;

public class test {

	public static void main(String[] args) throws ParseException, InterruptedException {
		HotelDataMysqlHelper hotelDataMysqlHelper = new HotelDataMysqlHelper();
		HotelDao hotelDao = new HotelDaoImpl();
		RoomDao roomDao = new RoomDaoImpl();
		OrderDao orderDao = new OrderDaoImpl();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 日期格式
		Date date = dateFormat.parse("2015-07-31"); // 指定日期
	
	
		try {
			Map<String, RoomInfoPO> roomList = roomDao.getRoomList(119, dateFormat.parse("2016-12-15"));
		
			for (RoomInfoPO roomInfoPO : roomList.values()) {
				System.out.println(roomInfoPO);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
}
