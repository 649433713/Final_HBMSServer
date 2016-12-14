package dataHelper;

import java.util.Date;
import java.util.Map;

import message.ResultMessage;
import message.RoomStateMessage;
import po.RoomInfoPO;

/**
 * @author 凡
 *
 */
public interface RoomDataHelper {
	
	public Map<String, RoomInfoPO> getRoomList(int hotel_ID, Date date);
		
	public ResultMessage addRoom(RoomInfoPO po);
	
	public ResultMessage modifyRoom(RoomInfoPO po);
	
	public ResultMessage deleteRoom(int roomInfoID);
	
	public ResultMessage modifyStateByDay(int roomInfoID,RoomStateMessage roomState,Date date);

	public ResultMessage modifyPriceByDay(int roomInfoID,int price,Date date);

	
}
