package dao;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.Map;

import message.ResultMessage;
import message.RoomStateMessage;
import po.RoomInfoPO;

/**
 * @author 凡
 *
 */
public interface RoomDao extends Remote {
	
	/**
	 * @Description: TODO customer使用date需指定日期，staff使用date为null
	 * 
	 */
	public Map<String, RoomInfoPO> getRoomList(int hotel_ID,Date date)throws RemoteException;
	
	public RoomInfoPO getRoomInfo(String roomID)throws RemoteException;
		
	public ResultMessage addRoom(RoomInfoPO po)throws RemoteException;
	
	public ResultMessage modifyRoom(RoomInfoPO po)throws RemoteException;
	
	public ResultMessage deleteRoom(int roomInfoID)throws RemoteException;
	
	public ResultMessage deleteRoom(int hotelID,String roomID)throws RemoteException;
	
	/**
	 * @Description: TODO 更改房间状态（针对房间，不针对具体某天）只针对房间当天属性
	 * 
	 * 若RoomState改为unavailable 表示房间不可预订，date1与date2为null
	 
	 */
	public ResultMessage modifyRoomState(int roomInfoID,RoomStateMessage room_state)throws RemoteException;
	
	/** 
	* @Title: modifyRoomStateByDay 
	* @Description: TODO 更改房间状态（用于预定房间时，生成订单时，对房间某一天的状态变更）
	* @param roomInfoID
	* @param roomState Blank 或 Booked
	* @param date  预定的日期
	* @return ResultMessage
	* @throws 
	*/
	
	public ResultMessage modifyRoomStateByDay(int roomInfoID,RoomStateMessage roomState,Date date)throws RemoteException;

	/** 
	* @Title: setPrice 
	* @Description: TODO
	* @param roomInfoID
	* @param date 预计修改价格的日期，为null则修改默认价格
	* @param price
	* @return ResultMessage
	* @throws 
	*/
	
	public ResultMessage setPrice(int roomInfoID,Date date,int price)throws RemoteException;
	

}
