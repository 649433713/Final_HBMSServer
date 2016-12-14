package po;


import java.io.Serializable;
import java.util.Date;

import message.RoomStateMessage;

/**
 * @author 凡
 *
 */
public class RoomInfoPO implements Serializable{
	
	
	private static final long serialVersionUID = -4623214578961472411L;
	/**
	 * @param detailedInfo1
	 * 		  		对于Checkined状态，包含入住时间.
			 		对于Blank状态，null。
			 		对于Booked，包含预计入住时间（当天12点）
	 * @param detailedInfo2
	 * 			 	对于Checkined状态，包含预计离开时间（第二天12点）.
				 	对于Blank状态，包含实际离开时间。
				 	对于Booked，null
	 * 
	 * 
	 * 
	 */

	int roomInfoID;
	int hotelID;
	String roomID;
	String roomType;
	int defaultPrice;
	RoomStateMessage roomState;
	Date detailedInfo1;
	Date detailedInfo2;
	int tempPrice;
	int tempNum;
	
	public RoomInfoPO(){
		
	}
	
	
	public RoomInfoPO(int roomInfoID, int hotelID, String roomID, String roomType, int defaultPrice, RoomStateMessage roomState,
			Date detailedInfo1, Date detailedInfo2) {
		super();
		this.roomInfoID = roomInfoID;
		this.hotelID = hotelID;
		this.roomID = roomID;
		this.roomType = roomType;
		this.defaultPrice = defaultPrice;
		this.roomState = roomState;
		this.detailedInfo1 = detailedInfo1;
		this.detailedInfo2 = detailedInfo2;
		}
	
	

	@Override
	public String toString() {
		return "RoomInfoPO [roomInfoID=" + roomInfoID + ", hotelID=" + hotelID + ", roomID=" + roomID + ", roomType="
				+ roomType + ", defaultPrice=" + defaultPrice + ", roomState=" + roomState + ", detailedInfo1="
				+ detailedInfo1 + ", detailedInfo2=" + detailedInfo2 + ", tempPrice=" + tempPrice + ", tempNum="
				+ tempNum + "]";
	}


	public int getTempNum() {
		return tempNum;
	}


	public void setTempNum(int tempNum) {
		this.tempNum = tempNum;
	}


	public int getTempPrice() {
		return tempPrice;
	}


	public void setTempPrice(int tempPrice) {
		this.tempPrice = tempPrice;
	}


	public int getRoomInfoID() {
		return roomInfoID;
	}
	public void setRoomInfoID(int roomInfoID) {
		this.roomInfoID = roomInfoID;
	}
	public int getHotelID() {
		return hotelID;
	}
	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}
	public String getRoomID() {
		return roomID;
	}
	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getDefaultPrice() {
		return defaultPrice;
	}
	public void setDefaultPrice(int defaultPrice) {
		this.defaultPrice = defaultPrice;
	}
	public RoomStateMessage getRoomState() {
		return roomState;
	}
	public void setRoomState(RoomStateMessage roomState) {
		this.roomState = roomState;
	}
	public Date getDetailedInfo1() {
		return detailedInfo1;
	}
	public void setDetailedInfo1(Date detailedInfo1) {
		this.detailedInfo1 = detailedInfo1;
	}
	public Date getDetailedInfo2() {
		return detailedInfo2;
	}
	public void setDetailedInfo2(Date detailedInfo2) {
		this.detailedInfo2 = detailedInfo2;
	}
	
	
	
}
