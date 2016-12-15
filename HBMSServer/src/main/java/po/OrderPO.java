package po;

import java.io.Serializable;
import java.util.Date;

import message.OrderStateMessage;
/**
 * 
 * @author 凡
 *	生成po时，除executeDDL外都为null，executeDDL的值为预定房间日期的当天18:00
 */


public class OrderPO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5375281150006214703L;
	int orderID;
	int userID;
	int hotelID;
	int roomInfoID;
	OrderStateMessage orderState;
	
	//最近一次操作事件，生成po时该项为null
	Date generateTime;
	Date cancelTime;
	Date executeDDl;
	Date checkinTime;
	Date checkoutTime;
	int number;
	int hasChild;
	int price;
	
	public OrderPO(){
		
	}

	public OrderPO(int orderID, int userID, int hotelID, int roomInfoID, OrderStateMessage orderState,
			Date generateTime, Date cancelTime, Date executeDDl, Date checkinTime, Date checkoutTime, int number,
			int hasChild, int price) {
		super();
		this.orderID = orderID;
		this.userID = userID;
		this.hotelID = hotelID;
		this.roomInfoID = roomInfoID;
		this.orderState = orderState;
		this.generateTime = generateTime;
		this.cancelTime = cancelTime;
		this.executeDDl = executeDDl;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
		this.number = number;
		this.hasChild = hasChild;
		this.price = price;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getHotelID() {
		return hotelID;
	}

	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}

	public int getRoomInfoID() {
		return roomInfoID;
	}

	public void setRoomInfoID(int roomInfoID) {
		this.roomInfoID = roomInfoID;
	}

	public OrderStateMessage getOrderState() {
		return orderState;
	}

	public void setOrderState(OrderStateMessage orderState) {
		this.orderState = orderState;
	}

	public Date getGenerateTime() {
		return generateTime;
	}

	public void setGenerateTime(Date generateTime) {
		this.generateTime = generateTime;
	}

	public Date getCancelTime() {
		return cancelTime;
	}

	public void setCancelTime(Date cancelTime) {
		this.cancelTime = cancelTime;
	}

	public Date getExecuteDDl() {
		return executeDDl;
	}

	public void setExecuteDDl(Date executeDDl) {
		this.executeDDl = executeDDl;
	}

	public Date getCheckinTime() {
		return checkinTime;
	}

	public void setCheckinTime(Date checkinTime) {
		this.checkinTime = checkinTime;
	}

	public Date getCheckoutTime() {
		return checkoutTime;
	}

	public void setCheckoutTime(Date checkoutTime) {
		this.checkoutTime = checkoutTime;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getHasChild() {
		return hasChild;
	}

	public void setHasChild(int hasChild) {
		this.hasChild = hasChild;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderPO [orderID=" + orderID + ", userID=" + userID + ", hotelID=" + hotelID + ", roomInfoID="
				+ roomInfoID + ", orderState=" + orderState + ", generateTime=" + generateTime + ", cancelTime="
				+ cancelTime + ", executeDDl=" + executeDDl + ", checkinTime=" + checkinTime + ", checkoutTime="
				+ checkoutTime + ", number=" + number + ", hasChild=" + hasChild + ", price=" + price + "]";
	}
	
	
}
