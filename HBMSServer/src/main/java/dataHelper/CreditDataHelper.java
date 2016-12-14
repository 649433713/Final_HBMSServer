package dataHelper;

import message.ResultMessage;
import po.CreditRecordPO;

import java.util.Map;

public interface CreditDataHelper {
	
	public Map<Integer,CreditRecordPO> getCreditRecordList(int userID);
	
	public ResultMessage addCreditRecord(CreditRecordPO po);
}
