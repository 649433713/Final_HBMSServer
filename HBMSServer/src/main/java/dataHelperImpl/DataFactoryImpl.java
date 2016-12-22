package dataHelperImpl;

import dataHelper.*;

/**
 * @author 凡
 *
 */
public class DataFactoryImpl implements DataFactory{

	HotelDataHelper hotelDataHelper;
	UserDataHelper userDataHelper;
	RoomDataHelper roomDataHelper;
	OrderDataHelper orderDataHelper;
	CreditDataHelper creditDataHelper;
	PromotionDataHelper promotionDataHelper;
	static DataFactoryImpl dataFactoryImpl;
	
	public DataFactoryImpl() {
		hotelDataHelper = new HotelDataMysqlHelper();
		userDataHelper=new UserDataMysqlHelper();
		roomDataHelper = new RoomDataMysqlHelper();
		orderDataHelper = new OrderDataMysqlHelper();
		creditDataHelper=new CreditDataMysqlHelper();
		promotionDataHelper=new PromotionDataMysqlHelper();
		
	}
	
	public HotelDataHelper getHotelDataHelper() {
		
		return hotelDataHelper;
	}

	public UserDataHelper getUserDataHelper(){

		return userDataHelper;
	}

	@Override
	public RoomDataHelper getRoomDataHelper() {
		
		return roomDataHelper;
	}


	@Override
	public OrderDataHelper getOrderDataHelper() {

		return orderDataHelper;
	}

	@Override
	public CreditDataHelper getCreditDataHelper() {

		return creditDataHelper;
	}

	@Override
	public PromotionDataHelper getPromotionDataHelper() {

		return promotionDataHelper;
	}

	public static DataFactory getDataFactory() {
		
		if (dataFactoryImpl==null) {
			dataFactoryImpl = new DataFactoryImpl();
		}
		 
		return dataFactoryImpl;
	}


}
