package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by alex on 12/12/16.
 */
public class PromotionFilter implements Serializable{

    private static final long serialVersionUID = 5332058456060215535L;
    public List<Map<String, Object>> filter = new ArrayList<>();

    /**
     *
     * @param name(promotionType, region, startDate,endDate)
     * @param relation("=","<",">")
     * @param value(PromotionType,int,Date)
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
