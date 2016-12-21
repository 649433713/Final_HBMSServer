package dataHelper;

import message.ResultMessage;
import model.PromotionFilter;
import po.PromotionPO;

import java.util.Map;

public interface PromotionDataHelper {
	
	public Map<Integer, PromotionPO> getPromotionList(PromotionFilter promotionFilter);

	public ResultMessage addPromotion(PromotionPO po);

	public ResultMessage deletePromotion(int promotionID);
	
	public ResultMessage updatePromotion(PromotionPO po);

}
