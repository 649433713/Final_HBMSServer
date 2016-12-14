package dao;

import java.util.List;

import message.ResultMessage;
import po.PromotionPO;

public interface PromotionDao {
	 public PromotionPO showPromotion();
	 
	 public List<PromotionPO> showPromotionList();

	 
	 public ResultMessage addPromotion(PromotionPO po);
	 
	 public ResultMessage modifyPromotion(PromotionPO po);
	 
	 public ResultMessage deletePromotion(String id);
	 

}
