package dataHelperImpl;

import dataHelper.DataFactory;
import dataHelper.HotelDataHelper;
import dataHelper.OrderDataHelper;
import dataHelper.RoomDataHelper;
import dataHelper.UserDataHelper;

/**
 * @author 凡
 *
 */
public class DataFactoryImpl implements DataFactory{

	public HotelDataHelper getHotelDataHelper() {
		HotelDataHelper hotelDataHelper = new HotelDataMysqlHelper();
		return hotelDataHelper;
	}

	public UserDataHelper getUserDataHelper(){
		UserDataHelper userDataHelper=new UserDataMysqlHelper();
		return userDataHelper;
	}

	@Override
	public RoomDataHelper getRoomDataHelper() {
		RoomDataHelper roomDataHelper = new RoomDataMysqlHelper();
		return roomDataHelper;
	}


	@Override
	public OrderDataHelper getOrderDataHelper() {
		OrderDataHelper orderDataHelper = new OrderDataMysqlHelper();
		return orderDataHelper;
	}
}
