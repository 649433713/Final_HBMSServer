package daoImpl;

import java.rmi.RemoteException;
import java.util.Map;

import dao.OrderDao;
import dao.RoomDao;
import dataHelper.DataFactory;
import dataHelper.OrderDataHelper;
import dataHelperImpl.DataFactoryImpl;
import message.OrderStateMessage;
import message.ResultMessage;
import message.RoomStateMessage;
import model.UserType;
import po.AppealPO;
import po.OrderPO;

/**
 * @author 凡
 *
 */
public class OrderDaoImpl implements OrderDao
{
	
	private Map<Integer, OrderPO> map;
	
	private static OrderDaoImpl orderDaoImpl;
	
	private DataFactory dataFactory;
	
	private OrderDataHelper orderDataHelper;
	
	public static OrderDaoImpl getInstance(){
		if(orderDaoImpl == null){
			orderDaoImpl = new OrderDaoImpl();
		}
		return orderDaoImpl;
	}
	public OrderDaoImpl() {
		if (map==null) {
			dataFactory = new DataFactoryImpl();
			orderDataHelper = dataFactory.getOrderDataHelper();
			
		}
	}
	
	

	@Override
	public Map<Integer, OrderPO> getOrderList(int ID, UserType userType,OrderStateMessage orderState) throws RemoteException {
		// TODO Auto-generated method stub
		map = orderDataHelper.getOrderList(ID, userType,orderState);
		return map;
	}
	
	
	@Override
	public Map<Integer, OrderPO> getUnexecutedOrderList(int ID, UserType userType) throws RemoteException {
		// TODO Auto-generated method stub
		map = orderDataHelper.getOrderList(ID, userType, OrderStateMessage.Unexecuted);
		return map;
	}
	@Override
	public Map<Integer, OrderPO> getExecutedOrderList(int ID, UserType userType) throws RemoteException {
		// TODO Auto-generated method stub
		map = orderDataHelper.getOrderList(ID, userType, OrderStateMessage.Executed);
		return map;
	}
	@Override
	public Map<Integer, OrderPO> getCancelledOrderList(int ID, UserType userType) throws RemoteException {
		// TODO Auto-generated method stub
		map =orderDataHelper.getOrderList(ID, userType, OrderStateMessage.Cancelled);
		return map;
	}
	@Override
	public Map<Integer, OrderPO> getAbnormalOrderList(int ID, UserType userType) throws RemoteException {
		// TODO Auto-generated method stub
		map = orderDataHelper.getOrderList(ID, userType, OrderStateMessage.Abnormal);
		return map;
	}
	@Override
	public OrderPO getOrderInfo(int orderID) throws RemoteException {
		map = getOrderList(0, null,null);
		OrderPO copy = map.get(orderID);
		return copy;
	}
	@Override
	public ResultMessage changeOrderState(int orderID, OrderStateMessage orderState) throws RemoteException {
		// TODO Auto-generated method stub
		if (orderState==OrderStateMessage.Cancelled) {
			OrderPO orderPO = getOrderInfo(orderID);
			RoomDao roomDao = new RoomDaoImpl();
			roomDao.modifyRoomStateByDay(orderPO.getRoomInfoID(), RoomStateMessage.Blank, orderPO.getExecuteDDl());
		}
		
		return orderDataHelper.modifyOrderState(orderID, orderState);
	}
	@Override
	public ResultMessage addOrder(OrderPO orderPO) throws RemoteException {
		// TODO Auto-generated method stub
		RoomDao roomDao = new RoomDaoImpl();
		roomDao.modifyRoomStateByDay(orderPO.getRoomInfoID(), RoomStateMessage.Unavailable, orderPO.getExecuteDDl());

		return orderDataHelper.addOrder(orderPO);
	}
	@Override
	public ResultMessage addAppealOrder(AppealPO appealPO) throws RemoteException {
		
		
		return orderDataHelper.addAppealOrder(appealPO);
	}

	@Override
	public ResultMessage modifyAppealOrder(AppealPO appealPO) throws RemoteException {
		
		
		return orderDataHelper.modifyAppealOrder(appealPO);
	}
	@Override
	public Map<Integer, AppealPO> getAppealOrderList(int userID) throws RemoteException {
		
		
		return orderDataHelper.getAppealOrderList(userID);
	}


}
