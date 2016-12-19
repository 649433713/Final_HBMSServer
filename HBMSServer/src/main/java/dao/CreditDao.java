package dao;

import message.ResultMessage;
import po.CreditRecordPO;
import po.RankPO;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Map;


public interface CreditDao extends Remote{
	public long getCreditValue(int userID) throws RemoteException,Exception;

	public ResultMessage setCreditValue(int userID,long value) throws RemoteException,Exception;

	public Map<Integer, CreditRecordPO> getCreditRecordList(int userID) throws  RemoteException;

	public ResultMessage addCreditRecord(CreditRecordPO po) throws RemoteException;
	
	public Map<Integer, RankPO> getRankList() throws RemoteException;
	
	public ResultMessage modifyRankRule(Map<Integer, RankPO> newRule) throws RemoteException;

}	
