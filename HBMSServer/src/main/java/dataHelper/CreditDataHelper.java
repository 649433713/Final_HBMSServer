package dataHelper;

import message.ResultMessage;
import po.CreditRecordPO;
import po.RankPO;

import java.util.Map;

public interface CreditDataHelper {
	
	public Map<Integer,CreditRecordPO> getCreditRecordList(int userID);
	
	public ResultMessage addCreditRecord(CreditRecordPO po);

	public Map<Integer, RankPO> getRankList();

	public ResultMessage modifyRankRule(Map<Integer, RankPO> newRule);
}
