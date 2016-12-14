package dataHelper;

/**
 * @author 凡
 *
 */
public interface DataFactory {
	
	public HotelDataHelper getHotelDataHelper();
	
	public UserDataHelper getUserDataHelper();
	
	public RoomDataHelper getRoomDataHelper() ;
	
	public OrderDataHelper getOrderDataHelper();
}
