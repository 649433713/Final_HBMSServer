package daoImpl;

import java.rmi.RemoteException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import dao.RoomDao;
import dataHelper.DataFactory;
import dataHelper.RoomDataHelper;
import dataHelperImpl.DataFactoryImpl;
import po.RoomInfoPO;
import message.RoomStateMessage;
import model.UserType;
import message.ResultMessage;

/**
 * @author 凡
 *
 */
public class RoomDaoImpl implements RoomDao {

	private Map<String, RoomInfoPO> map;

	private static RoomDaoImpl roomDaoImpl;

	private DataFactory dataFactory;

	private RoomDataHelper roomDataHelper;

	public static RoomDaoImpl getInstance() {
		if (roomDaoImpl == null) {
			roomDaoImpl = new RoomDaoImpl();
		}
		return roomDaoImpl;
	}

	public RoomDaoImpl() {
		if (map == null) {
			dataFactory = DataFactoryImpl.getDataFactory();
			roomDataHelper = dataFactory.getRoomDataHelper();
			map = null;
		}
	}
	
	

	@Override
	public Map<String, RoomInfoPO> getRoomList(int hotel_ID,Date date) throws RemoteException {
		map = roomDataHelper.getRoomList(hotel_ID,date);
		return map;
	}

	@Override
	public RoomInfoPO getRoomInfo(String roomID) throws RemoteException {
		RoomInfoPO copy = null;
		for (RoomInfoPO roomInfoPO : map.values()) {
			if (roomID.equals(roomInfoPO.getRoomID())) {
				copy = roomInfoPO;
				break;
			}
		}
		return copy;
	}


	@Override
	public ResultMessage addRoom(RoomInfoPO po) throws RemoteException {

		return roomDataHelper.addRoom(po);
	}

	@Override
	public ResultMessage modifyRoom(RoomInfoPO po) throws RemoteException {

		return roomDataHelper.modifyRoom(po);
	}

	@Override
	public ResultMessage deleteRoom(int roomInfoID) throws RemoteException {

		return roomDataHelper.deleteRoom(roomInfoID);
	}

	@Override
	public ResultMessage deleteRoom(int hotelID,String roomID) throws RemoteException {
		int roomInfoID = 0;
		for (RoomInfoPO roomInfoPO : map.values()) {
			if (roomInfoPO.getHotelID()==hotelID&&roomInfoPO.getRoomID().equals(roomID)) {
				roomInfoID = roomInfoPO.getRoomInfoID();
			}
		}

		return roomDataHelper.deleteRoom(roomInfoID);
	}

	@Override
	public ResultMessage modifyRoomState(int roomInfoID, RoomStateMessage room_state)
			throws RemoteException {
		
		RoomInfoPO copy = roomDataHelper.getRoomInfo(roomInfoID);
		
		copy.setRoomState(room_state);
		
	
		return roomDataHelper.modifyRoom(copy);
	}

	/*
	* Title: setPrice
	*Description: 
	* @param roomInfoID
	* @param date
	* @param price
	* @return 
	* @see dao.RoomDao#setPrice(int, java.util.Date, int) 
	*/
	@Override
	public ResultMessage setPrice(int roomInfoID, Date date, int price)throws RemoteException  {
		if (date!=null) {
			return roomDataHelper.modifyPriceByDay(roomInfoID,price,date);
		}
		else {
			RoomInfoPO roomInfoPO = map.get(roomInfoID);
			roomInfoPO.setDefaultPrice(price);
			return modifyRoom(roomInfoPO);
		}
	}

	/*
	* Title: modifyRoomStateByDay
	*Description: 
	* @param roomInfoID
	* @param roomState
	* @param date
	* @return
	* @throws RemoteException 
	* @see dao.RoomDao#modifyRoomStateByDay(int, message.RoomStateMessage, java.util.Date) 
	*/
	@Override
	public ResultMessage modifyRoomStateByDay(int roomInfoID, RoomStateMessage roomState, Date date)
			throws RemoteException {
		
		return  roomDataHelper.modifyStateByDay(roomInfoID,roomState,date);
	}

}
