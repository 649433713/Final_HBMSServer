package rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import dao.*;
import daoImpl.*;
import message.OrderStateMessage;
import message.ResultMessage;
import message.RoomStateMessage;
import model.HotelFilter;
import model.PromotionFilter;
import model.UserType;
import po.*;

public class DataRemoteObject extends UnicastRemoteObject implements HotelDao, UserDao,  OrderDao, RoomDao ,CreditDao, PromotionDao {
	private static final long serialVersionUID = 7891609711151080282L;


	/**
	 * 
	 */

	/**
	 * 
	 */
	//鍒殑dao鐨勬帴鍙ｉ兘implements ,鐒跺悗鍐欏湪杩欙紝鐒跺悗鏋勯�犲嚱鏁伴噷鍒濆鍖�
	private HotelDao hotelDao;
	private UserDao userDao;
	private CreditDao creditDao;
	private OrderDao orderDao;
	private RoomDao roomDao;
	private PromotionDao promotionDao;

	protected DataRemoteObject() throws RemoteException {
		super();
		hotelDao = new HotelDaoImpl();
		userDao=new UserDaoImpl();
		creditDao = new CreditDaoImpl();
		orderDao = new OrderDaoImpl();
		roomDao = new RoomDaoImpl();
		promotionDao=new PromotionDaoImpl();
		
	}

	@Override
	public Map<Integer, HotelPO> getHotelList(HotelFilter filter,String order,java.util.Date date) throws RemoteException{

			return hotelDao.getHotelList(filter,order,date);
	}

	@Override
	public HotelPO getHotelInfo(int hotel_ID) throws RemoteException{
		
			return hotelDao.getHotelInfo(hotel_ID);
	
	}



	@Override
	public ResultMessage addHotel(HotelPO po) throws RemoteException{
	
			return hotelDao.addHotel(po);
	
	}

	@Override
	public ResultMessage modifyHotel(HotelPO po) throws RemoteException{
	
			return hotelDao.modifyHotel(po);
	
	}

	@Override
	public ResultMessage deleteHotel(int hotel_ID) throws RemoteException{
	
			return hotelDao.deleteHotel(hotel_ID) ;
	
	}

	
	@Override
	public Map<String, RoomInfoPO> getRoomList(int hotel_ID,Date date) throws RemoteException {
		return roomDao.getRoomList(hotel_ID,date);
	}

	@Override
	public RoomInfoPO getRoomInfo(String roomID) throws RemoteException {
		return roomDao.getRoomInfo(roomID);
	}

	@Override
	public ResultMessage addRoom(RoomInfoPO po) throws RemoteException {
		
		return roomDao.addRoom(po);
	}

	@Override
	public ResultMessage modifyRoom(RoomInfoPO po) throws RemoteException {
		
		return roomDao.modifyRoom(po);
	}

	@Override
	public ResultMessage deleteRoom(int room_ID) throws RemoteException {
		
		return roomDao.deleteRoom(room_ID);
	}



	@Override
	public List<CommentInfoPO> getComments(int hotelID) throws RemoteException {
		
		return hotelDao.getComments(hotelID);
	}

	@Override
	public ResultMessage addComment(CommentInfoPO commentInfoPO) throws RemoteException {
		
		return hotelDao.addComment(commentInfoPO);
	}


	@Override
	public ResultMessage modifyRoomState(int roomInfoID, RoomStateMessage room_state)
			throws RemoteException {
		
		return roomDao.modifyRoomState(roomInfoID, room_state);
	}


	@Override
	public ResultMessage deleteRoom(int hotelID, String roomID) throws RemoteException {
		
		return roomDao.deleteRoom(hotelID, roomID);
	}


	@Override
	public ResultMessage modifyRoomStateByDay(int roomInfoID, RoomStateMessage roomState, Date date)
			throws RemoteException {
		
		return roomDao.modifyRoomStateByDay(roomInfoID, roomState, date);
	}


	@Override
	public ResultMessage setPrice(int roomInfoID, Date date, int price) throws RemoteException {
		
		return roomDao.setPrice(roomInfoID, date, price);
	}

	@Override
	public Map<Integer, OrderPO> getOrderList(int ID, UserType userType,OrderStateMessage orderState) throws RemoteException {
		
		
		return orderDao.getOrderList(ID, userType,orderState);
	}

	@Override
	public Map<Integer, OrderPO> getUnexecutedOrderList(int ID, UserType userType) throws RemoteException {
		
		
		return orderDao.getUnexecutedOrderList(ID, userType);
	}

	@Override
	public Map<Integer, OrderPO> getExecutedOrderList(int ID, UserType userType) throws RemoteException {
		
		
		return orderDao.getExecutedOrderList(ID, userType);
	}

	@Override
	public Map<Integer, OrderPO> getCancelledOrderList(int ID, UserType userType) throws RemoteException {
		
		
		return orderDao.getCancelledOrderList(ID, userType);
	}

	@Override
	public Map<Integer, OrderPO> getAbnormalOrderList(int ID, UserType userType) throws RemoteException {
		
		
		return orderDao.getAbnormalOrderList(ID, userType);
	}

	@Override
	public OrderPO getOrderInfo(int orderID) throws RemoteException {
		
		
		return orderDao.getOrderInfo(orderID);
	}

	@Override
	public ResultMessage changeOrderState(int orderID, OrderStateMessage orderState) throws RemoteException {
		
		
		return orderDao.changeOrderState(orderID, orderState);
	}

	@Override
	public ResultMessage addOrder(OrderPO po) throws RemoteException {
		
		
		return orderDao.addOrder(po);
	}

	@Override
	public ResultMessage addAppealOrder(AppealPO appealPO) throws RemoteException {

		return orderDao.addAppealOrder(appealPO);
	}

	@Override
	public Map<Integer, AppealPO> getAppealOrderList(int userID) throws RemoteException {

		return orderDao.getAppealOrderList(userID);
	}

	@Override
	public ResultMessage modifyAppealOrder(AppealPO appealPO) throws RemoteException {

		return orderDao.modifyAppealOrder(appealPO);
	}

	@Override
	public UserPO getUserData(int id) throws RemoteException,Exception {
		
		
		return userDao.getUserData(id);
	}

	@Override
	public UserPO getUserData(String accountName) throws RemoteException ,Exception{


		return userDao.getUserData(accountName);
	}

	@Override
	public ResultMessage addUser(UserPO po) throws RemoteException, Exception {
		
		
		return userDao.addUser(po);
	}

	@Override
	public ResultMessage deleteUser(int id) throws RemoteException, Exception {
		
		
		return userDao.deleteUser(id);
	}

	@Override
	public ResultMessage modifyUser(UserPO po) throws RemoteException, Exception {
		
		
		return userDao.modifyUser(po);
	}

	@Override
	public ResultMessage login(String accountName, String pwd) throws RemoteException,Exception {
		
		
		return userDao.login(accountName,pwd);
	}

	@Override
	public ResultMessage signup(UserPO po) throws RemoteException, Exception {
		
		
		return userDao.signup(po);
	}

	@Override
	public long getCreditValue(int userID) throws RemoteException, Exception {
		return creditDao.getCreditValue(userID);
	}

	@Override
	public ResultMessage setCreditValue(int userID, long value) throws RemoteException, Exception {
		return creditDao.setCreditValue(userID,value);
	}

	@Override
	public Map<Integer, CreditRecordPO> getCreditRecordList(int userID) throws RemoteException {
		return creditDao.getCreditRecordList(userID);
	}

	@Override
	public ResultMessage addCreditRecord(CreditRecordPO po) throws RemoteException {
		return creditDao.addCreditRecord(po);
	}

	@Override
	public Map<Integer, PromotionPO> getHotelPromotionList(PromotionFilter promotionFilter) throws RemoteException,Exception {
		return promotionDao.getHotelPromotionList(promotionFilter);
	}

	@Override
	public Map<Integer, PromotionPO> getWebPromotionList(PromotionFilter promotionFilter) throws RemoteException,Exception {
		return promotionDao.getWebPromotionList(promotionFilter);
	}

	@Override
	public ResultMessage addPromotion(PromotionPO po) throws RemoteException,Exception {
		return promotionDao.addPromotion(po);
	}

	@Override
	public ResultMessage deletePromotion(int id) throws RemoteException,Exception {
		return promotionDao.deletePromotion(id);
	}

	@Override
	public ResultMessage updatePromotion(PromotionPO po) throws RemoteException,Exception {
		return promotionDao.updatePromotion(po);
	}

	@Override
	public List<String> getProvinces() throws RemoteException {
		
		
		return hotelDao.getProvinces();
	}

	@Override
	public List<String> getCities(String province) throws RemoteException {
		
		
		return hotelDao.getCities(province);
	}

	@Override
	public Map<Integer, RegionPO> getRegions(String city) throws RemoteException {
		
		
		return hotelDao.getRegions(city);
	}
}
