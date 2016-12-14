package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 凡
 *
 */
public class HotelFilter implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 4258843928411453500L;
	public List<Map<String, Object>> filter = new ArrayList<>();
	
	/**
	 * @param name （hotelID,name,address,region,star,facility,score，price)
	 * @param relation (=,>,<,like)
	 * @param value (like 需 value为 %+String+%
	 */
	public void add(String name ,String relation,Object value) {
		Map<String, Object> param = new HashMap<>();
		param.put("name", name);
		param.put("relation", relation);
		param.put("value", value);
		
		filter.add(param);
	}
	public void del(String name) {
		for (int i = 0; i < filter.size(); i++) {
			Map<String, Object> param = filter.get(i);
			if (param.get("name").equals(name)) {
				filter.remove(i);
			}
		}
	}
}
