package daoImpl;

import java.sql.Connection;
import java.util.Map;
import dao.PromotionDao;
import dataHelper.DataFactory;
import dataHelper.PromotionDataHelper;
import dataHelperImpl.DBUtil;
import dataHelperImpl.DataFactoryImpl;
import message.ResultMessage;
import model.PromotionFilter;
import model.PromotionType;
import po.PromotionPO;

public class PromotionDaoImpl implements PromotionDao{
	Connection connection;
	private static PromotionPO promotionPO;
	private static PromotionDaoImpl promotionDaoImpl;
	private static DataFactory dataFactory;
	private static PromotionDataHelper promotionDataHelper;

	public PromotionDaoImpl() {
		if(promotionPO==null){
			dataFactory=new DataFactoryImpl();
			promotionDataHelper=dataFactory.getPromotionDataHelper();
			connection= DBUtil.getConnection();
		}
	}

	public static PromotionDaoImpl getInstance(){
		if(promotionDaoImpl==null){
			promotionDaoImpl=new PromotionDaoImpl();
		}
		return promotionDaoImpl;
	}


	@Override
	public Map<Integer, PromotionPO> getHotelPromotionList(PromotionFilter promotionFilter) throws Exception {
		promotionFilter.add("promotionType","=", PromotionType.HotelPromotion.ordinal());
		return promotionDataHelper.getPromotionList(promotionFilter);
	}

	@Override
	public Map<Integer, PromotionPO> getWebPromotionList(PromotionFilter promotionFilter) throws Exception {
		promotionFilter.add("promotionType","=",PromotionType.WebPromotion.ordinal());
		return promotionDataHelper.getPromotionList(promotionFilter);
	}


	@Override
	public ResultMessage addPromotion(PromotionPO po) throws Exception {
		return promotionDataHelper.addPromotion(po);
	}

	@Override
	public ResultMessage deletePromotion(int id) throws Exception {
		return promotionDataHelper.deletePromotion(id);
	}

	@Override
	public ResultMessage updatePromotion(PromotionPO po) throws Exception {
		return promotionDataHelper.updatePromotion(po);
	}
}
