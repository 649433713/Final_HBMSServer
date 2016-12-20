package testDataHelper;

import java.rmi.RemoteException;

import dao.HotelDao;
import daoImpl.HotelDaoImpl;

public class testHotel {

	public static void main(String[] args) {
		HotelDao hotelDao = new HotelDaoImpl();
		try {
			System.out.println(hotelDao.getHotelInfo(119).getEnvironment().size());
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
