package daoImpl;

import java.rmi.RemoteException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import dao.HotelDao;
import dataHelper.DataFactory;
import dataHelper.HotelDataHelper;
import dataHelperImpl.DataFactoryImpl;
import message.ResultMessage;
import model.HotelFilter;
import po.CommentInfoPO;
import po.HotelPO;
import po.RegionPO;

/**
 * @author 凡
 *
 */
public class HotelDaoImpl implements HotelDao{
	private Map<Integer, HotelPO> map;
	
	private static HotelDaoImpl hotelDaoImpl;
	
	private DataFactory dataFactory;
	
	private HotelDataHelper hotelDataHelper;
	
	public static HotelDaoImpl getInstance(){
		if(hotelDaoImpl == null){
			hotelDaoImpl = new HotelDaoImpl();
		}
		return hotelDaoImpl;
	}
	public HotelDaoImpl() {
		if (map==null) {
			dataFactory = new DataFactoryImpl();
			hotelDataHelper = dataFactory.getHotelDataHelper();
	
		}
	}

	@Override
	public Map<Integer, HotelPO> getHotelList(HotelFilter filter,String order,Date date) {
		map = hotelDataHelper.getHotelList(filter,order,date);
		return map;
	}

	@Override
	public HotelPO getHotelInfo(int hotelID) {
		getHotelList(null,null,null);
		HotelPO copy = map.get(hotelID);
		return copy;
	}



	@Override
	public int addHotel(HotelPO po) {
		
		return hotelDataHelper.addHotel(po);
	}

	@Override
	public ResultMessage modifyHotel(HotelPO po) {
		
		return hotelDataHelper.updateHotel(po);
	}

	@Override
	public ResultMessage deleteHotel(int hotel_ID) {
		
		return hotelDataHelper.delHotel(hotel_ID);
	}
	@Override
	public List<CommentInfoPO> getComments(int hotelID) throws RemoteException {
		
		return hotelDataHelper.getComments(hotelID);
	}
	@Override
	public ResultMessage addComment(CommentInfoPO commentInfoPO) throws RemoteException {
		
		return hotelDataHelper.addComment(commentInfoPO);
	}

	@Override
	public List<String> getProvinces() throws RemoteException {
		
		
		return hotelDataHelper.getProvinces();
	}
	@Override
	public List<String> getCities(String province) throws RemoteException {
		
		
		return hotelDataHelper.getCities(province);
	}
	@Override
	public Map<Integer, RegionPO> getRegions(String city) throws RemoteException {
		
		
		return hotelDataHelper.getRegions(city);
	}
	@Override
	public RegionPO getSpecificRegion(int regionID) throws RemoteException {
		
		
		 
		return hotelDataHelper.getSpecificRegion(regionID);
	}

}
