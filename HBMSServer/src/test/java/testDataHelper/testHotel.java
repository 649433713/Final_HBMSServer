package testDataHelper;

import java.io.File;
import java.rmi.RemoteException;

import dao.HotelDao;
import daoImpl.HotelDaoImpl;
import model.ImageHelper;

public class testHotel {

	public static void main(String[] args) {
		/*HotelDao hotelDao = new HotelDaoImpl();
		try {
			System.out.println(hotelDao.getHotelInfo(119).getEnvironment().size());
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
		ImageHelper imageHelper = new ImageHelper();
		try {
		//	System.out.println(new File("res/hotel/120").getAbsolutePath());
			System.out.println(imageHelper.getHotelDir(2).getPath());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
