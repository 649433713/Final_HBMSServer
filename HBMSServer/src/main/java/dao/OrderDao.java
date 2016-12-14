package dao;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Map;

import message.OrderStateMessage;
import message.ResultMessage;
import model.UserType;
import po.AppealPO;
import po.OrderPO;

/**
 * @author 凡
 *
 */
public interface OrderDao extends Remote{
	
		//以下是用户    对订单模块数据层的需求操作
	
		//获得全部订单
		/**
		 * @param ID  如果userType是customer ID为userID， 是Staff， ID为hotelID
		 * @param userType customer 或 Staff
		 * @return
		 * @throws RemoteException
		 */
		public Map<Integer, OrderPO> getOrderList(int ID,UserType userType,OrderStateMessage orderState) throws RemoteException;
	
		//获取未执行订单（即订单已生成，但是订单的用户还未入住，订单未执行状态）
		public Map<Integer, OrderPO> getUnexecutedOrderList(int ID,UserType userType) throws RemoteException;
		
		//获取已执行订单（即订单用户已入住，订单处于在执行状态，直到用户退房或撤销订单）
		public Map<Integer, OrderPO> getExecutedOrderList(int ID,UserType userType) throws RemoteException;
		
		//获取已撤销订单（即订单用户对该订单执行撤销操作之后，订单处于的状态）
		public Map<Integer, OrderPO> getCancelledOrderList(int ID,UserType userType) throws RemoteException;
		
		//获取异常订单（即用户未按照规定时间入住，订单处于的状态）
		public Map<Integer, OrderPO> getAbnormalOrderList(int ID,UserType userType) throws RemoteException;
		
		//获得具体订单信息(非申诉订单)
		public OrderPO getOrderInfo(int orderID) throws RemoteException;
		//用户点击“撤销订单”，订单状态  “未执行”---->"已撤销"
		//执行订单 “未执行、异常”---->"已执行"
		public ResultMessage changeOrderState(int orderID,OrderStateMessage orderState) throws RemoteException;

		//用户点击“生成订单”，添加订单
		public ResultMessage addOrder(OrderPO po) throws RemoteException;
		
		//用户在异常订单界面可发起申诉
		public ResultMessage addAppealOrder(AppealPO appealPO)throws RemoteException;
		
		//网站营销人员处理异常订单
		public AppealPO getAppealOrder(int orderID)throws RemoteException;
		
		public ResultMessage modifyAppealOrder(AppealPO appealPO)throws RemoteException;
}
