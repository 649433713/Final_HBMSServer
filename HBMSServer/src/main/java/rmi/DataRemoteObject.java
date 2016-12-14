package rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import dao.CreditDao;
import dao.HotelDao;
import dao.OrderDao;
import dao.PromotionDao;
import dao.RoomDao;
import dao.UserDao;
import daoImpl.CreditDaoImpl;
import daoImpl.HotelDaoImpl;
import daoImpl.OrderDaoImpl;
import daoImpl.PromotionDaoImpl;
import daoImpl.RoomDaoImpl;
import daoImpl.UserDaoImpl;
import message.OrderStateMessage;
import message.ResultMessage;
import message.RoomStateMessage;
import model.HotelFilter;
import model.UserType;
import po.AppealPO;
import po.CommentInfoPO;
import po.HotelPO;
import po.OrderPO;
import po.PromotionPO;
import po.RegionPO;
import po.RoomInfoPO;
import po.UserPO;

/**
 * @author 凡
 *
 */
public class DataRemoteObject extends UnicastRemoteObject implements HotelDao, UserDao,  OrderDao, RoomDao,PromotionDao {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8161659370903805031L;
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
		promotionDao = new PromotionDaoImpl();
		
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
	public Map<Integer, RegionPO> getRegions() throws RemoteException {
		
		return hotelDao.getRegions();
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
	public UserPO getUserData(int id) throws RemoteException {
		
		
		return userDao.getUserData(id);
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
	public ResultMessage login(int id, String pwd) throws RemoteException {
		
		
		return userDao.login(id, pwd);
	}

	@Override
	public ResultMessage signup(UserPO po) throws RemoteException, Exception {
		
		
		return userDao.signup(po);
	}

	@Override
	public ResultMessage addAppealOrder(AppealPO appealPO) throws RemoteException {
		
		
		return orderDao.addAppealOrder(appealPO);
	}

	@Override
	public AppealPO getAppealOrder(int orderID) throws RemoteException {
		
		
		return orderDao.getAppealOrder(orderID);
	}

	@Override
	public ResultMessage modifyAppealOrder(AppealPO appealPO) throws RemoteException {
		
		
		return orderDao.modifyAppealOrder(appealPO);
	}

	@Override
	public PromotionPO showPromotion() {
		
		
		return promotionDao.showPromotion();
	}

	@Override
	public List<PromotionPO> showPromotionList() {
		
		
		return promotionDao.showPromotionList();
	}

	@Override
	public ResultMessage addPromotion(PromotionPO po) {
		
		
		return promotionDao.addPromotion(po);
	}

	@Override
	public ResultMessage modifyPromotion(PromotionPO po) {
		
		
		return promotionDao.modifyPromotion(po);
	}

	@Override
	public ResultMessage deletePromotion(String id) {
		
		
		return promotionDao.deletePromotion(id);
	}


	

}
