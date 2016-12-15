package dao;

import java.rmi.Remote;
import java.rmi.RemoteException;
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
public interface HotelDao extends Remote{
	/*
	 * filter规则查看model里该类规则
	 * order为（lowestPrice,star,score）
	 */
	public Map<Integer, HotelPO> getHotelList(HotelFilter filter,String order,Date date)throws RemoteException;	
	
	public HotelPO getHotelInfo(int hotelID)throws RemoteException;
	
	public ResultMessage addHotel(HotelPO po)throws RemoteException;
	
	public ResultMessage modifyHotel(HotelPO po)throws RemoteException;
	
	public ResultMessage deleteHotel(int hotel_ID)throws RemoteException;
	
	public List<CommentInfoPO> getComments(int hotelID)throws RemoteException;

	public ResultMessage addComment(CommentInfoPO commentInfoPO)throws RemoteException;

	public List<String> getProvinces()throws RemoteException;
	
	public List<String> getCities(String province)throws RemoteException;
	
	public Map<Integer, RegionPO> getRegions(String city)throws RemoteException;
}
