package daoImpl;

import java.util.List;

import dao.PromotionDao;
import message.ResultMessage;
import po.PromotionPO;

public class PromotionDaoImpl implements PromotionDao{
	
	private static PromotionDaoImpl promotionDaoImpl;
	
	public static PromotionDaoImpl getInstance(){
		if(promotionDaoImpl==null){
			promotionDaoImpl=new PromotionDaoImpl();
		}
		return promotionDaoImpl;
	}
	


	@Override
	public ResultMessage addPromotion(PromotionPO po) {
		
		return null;
	}

	@Override
	public ResultMessage modifyPromotion(PromotionPO po) {
		
		return null;
	}

	@Override
	public ResultMessage deletePromotion(String id) {
		
		return null;
	}



	@Override
	public PromotionPO showPromotion() {
		
		return null;
	}



	@Override
	public List<PromotionPO> showPromotionList() {
		
		return null;
	}

}
