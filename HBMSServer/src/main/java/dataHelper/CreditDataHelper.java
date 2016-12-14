package dataHelper;

import java.util.Map;

public interface CreditDataHelper {
	
	public Map<Integer, Object> getCreditData();
	
	public void updateCreditData(Map<Integer, Object> map);
}
