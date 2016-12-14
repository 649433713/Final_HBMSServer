package dataHelper;

import message.ResultMessage;
import model.PromotionFilter;
import po.PromotionPO;

import java.util.Map;

public interface PromotionDataHelper {
	
	public Map<Integer, PromotionPO> getPromotionList(PromotionFilter promotionFilter)throws Exception;

	public ResultMessage addPromotion(PromotionPO po)throws Exception;

	public ResultMessage deletePromotion(int promotionID)throws Exception;
	
	public ResultMessage updatePromotion(PromotionPO po)throws Exception;

}
