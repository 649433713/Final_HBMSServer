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
		/*UserDao userDao = new UserDaoImpl();
		try {

			userDao.addUser(new UserPO(0, UserType.WebMarketer, "小俊3", "66666666", "也是小俊", "110",null, 0,MemberType.Tourist, null,0, null,120));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		HotelDao hotelDao = new HotelDaoImpl();
		try {
			System.out.println(hotelDao.getHotelInfo(120));
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
