package dataHelper;

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
public interface OrderDataHelper {
	public Map<Integer,OrderPO> getOrderList(int ID,UserType userType,OrderStateMessage orderState);

	public ResultMessage modifyOrderState(int orderID,OrderStateMessage orderState);
	
	public ResultMessage addOrder(OrderPO orderPO);

	public ResultMessage addAppealOrder(AppealPO appealPO);

	public ResultMessage modifyAppealOrder(AppealPO appealPO);

	public Map<Integer, AppealPO> getAppealOrderList(int userID);
}
