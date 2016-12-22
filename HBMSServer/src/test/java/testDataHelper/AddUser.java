package testDataHelper;

import java.io.File;
import java.rmi.RemoteException;

import dao.HotelDao;
import dao.OrderDao;
import dao.UserDao;
import daoImpl.HotelDaoImpl;
import daoImpl.OrderDaoImpl;
import daoImpl.UserDaoImpl;
import model.MemberType;
import model.UserType;
import po.HotelPO;
import po.UserPO;

public class AddUser {

	public static void main(String[] args) {
		UserDao userDao = new UserDaoImpl();
		try {
			for (int i = 3; i < 10; i++) {
				userDao.addUser(new UserPO(0, UserType.Staff, "大凡哥"+i, "666", "王凡", "15996262016",null, 0,MemberType.Tourist, null,0, null, i+3));
				
			}
				} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*HotelDao hotelDao = new HotelDaoImpl();
		try {
			HotelPO hotelPO ;
			for (int i = 3; i < 10; i++) {
				hotelPO = new HotelPO("王凡的别墅"+i, 0, 5, "包围狗舍茅草屋平房（没有对比就没有伤害", 36,"只有软工二满分的人才能住，或者请主人吃饭" ,"啥都有啊，想入非非，浮想联翩，遐想无限", null, 5, 0, "大凡哥"+i);
				hotelDao.addHotel(hotelPO);
			}
			
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
}
