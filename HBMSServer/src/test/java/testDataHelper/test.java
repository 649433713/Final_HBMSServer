package testDataHelper;

import java.io.File;
import java.rmi.RemoteException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sound.sampled.AudioFormat.Encoding;

import dao.HotelDao;
import dao.OrderDao;
import dao.RoomDao;
import dao.UserDao;
import daoImpl.HotelDaoImpl;
import daoImpl.OrderDaoImpl;
import daoImpl.RoomDaoImpl;
import daoImpl.UserDaoImpl;
import dataHelperImpl.HotelDataMysqlHelper;
import message.OrderStateMessage;
import message.RoomStateMessage;
import model.UserType;
import po.AppealPO;
import po.HotelPO;
import po.OrderPO;
import po.RoomInfoPO;
import po.UserPO;

public class test {

	public static void main(String[] args) throws ParseException, InterruptedException {
	/*	HotelDao hotelDao = new HotelDaoImpl();
		RoomDao roomDao = new RoomDaoImpl();
		OrderDao orderDao = new OrderDaoImpl();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 日期格式
		Date date = dateFormat.parse("2015-07-31"); // 指定日期
	
	
		try {
			Map<String, RoomInfoPO> roomList = roomDao.getRoomList(119, dateFormat.parse("2016-12-18"));
		
			for (RoomInfoPO roomInfoPO : roomList.values()) {
				System.out.println(roomInfoPO);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List<File> environment = new ArrayList<>();
		environment.add(new File("C:/Users/凡/Pictures/butterfly.jpg"));
		environment.add(new File("C:/Users/凡/Pictures/butterfly.jpg"));
		environment.add(new File("C:/Users/凡/Pictures/butterfly.jpg"));
		try {
	//		hotelDao.addHotel(new HotelPO("王凡的别墅", 0, 5, "不可知之地", 1, "贼好就是找不到", "啥都与", environment, 9.9, 0, "大凡哥"));
			HotelPO hotelPO = hotelDao.getHotelInfo(143);
			hotelPO.setEnvironment(environment);
			hotelDao.modifyHotel(hotelPO);
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	/*	
		OrderDao orderDao = new OrderDaoImpl();
		try {
			Map<Integer, OrderPO> map = orderDao.getAbnormalOrderList(1, UserType.Customer);
			for (OrderPO orderPO : map.values()) {
				System.out.println(orderPO);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
	/*	HotelDao hotelDao = new HotelDaoImpl();
		
		try {
			HotelPO hotelPO = hotelDao.getHotelInfo(143);
			System.out.println(hotelDao.addHotel(hotelPO));
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		UserDao userDao = new UserDaoImpl();
		try {
			UserPO userPO = userDao.getUserData(7);
			
			System.out.println(userPO.getAccountName());
			
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
