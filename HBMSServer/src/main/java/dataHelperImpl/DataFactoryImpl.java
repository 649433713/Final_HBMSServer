package dataHelperImpl;

import dataHelper.*;

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

	@Override
	public CreditDataHelper getCreditDataHelper() {
		CreditDataHelper creditDataHelper=new CreditDataMysqlHelper();
		return creditDataHelper;
	}

	@Override
	public PromotionDataHelper getPromotionDataHelper() {
		PromotionDataHelper promotionDataHelper=new PromotionDataMysqlHelper();
		return promotionDataHelper;
	}


}
