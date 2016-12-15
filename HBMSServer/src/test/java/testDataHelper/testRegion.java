package testDataHelper;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;

import dao.HotelDao;
import daoImpl.HotelDaoImpl;
import po.RegionPO;

public class testRegion {
	public static void main(String[] args) {
		
		HotelDao hotelDao = new HotelDaoImpl();
		try {
			List<String> list = hotelDao.getProvinces();
			for (String string : list) {
				System.out.println(string);
			}
			list = hotelDao.getCities("江苏");
			for (String string : list) {
				System.out.println(string);
			}
			Map<Integer, RegionPO> map = hotelDao.getRegions("南京");
			for (RegionPO regionPO : map.values()) {
				System.out.println(regionPO);
			}
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
