package dataHelper;

import java.util.Map;

public interface PromotionDataHelper {
	
	public Map<Integer, Object> getPromotionData();
	
	public void updatePromotionData(Map<Integer, Object>map);
}
