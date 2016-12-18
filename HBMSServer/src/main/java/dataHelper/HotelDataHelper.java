package dataHelper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import message.ResultMessage;
import model.HotelFilter;
import po.CommentInfoPO;
import po.HotelPO;
import po.RegionPO;

/**
 * @author 凡
 *
 */
public interface HotelDataHelper {
	
	public Map<Integer,HotelPO> getHotelList(HotelFilter filter, String order, Date date);

	public int addHotel(HotelPO hotelPO) ;
	
	public ResultMessage updateHotel(HotelPO hotelPO);
	
	public ResultMessage delHotel(int hotelID) ;

	public List<CommentInfoPO> getComments(int hotelID);

	public ResultMessage addComment(CommentInfoPO commentInfoPO);

	public List<String> getProvinces();
	
	public List<String> getCities(String province);
	
	public Map<Integer, RegionPO> getRegions(String city);
	
	//��Ϊ��ѯ����Ƶ���Ϣ֮ǰ  ���в�ѯ�Ƶ��б�
}
