package daoImpl;

import java.rmi.RemoteException;
import java.util.Map;

import dao.CreditDao;
import dao.UserDao;
import dataHelper.CreditDataHelper;
import dataHelper.DataFactory;
import dataHelperImpl.DataFactoryImpl;
import message.ResultMessage;
import po.CreditRecordPO;
import po.RankPO;
import po.UserPO;

public class CreditDaoImpl implements CreditDao{

	private Map<Integer,CreditRecordPO> map;

	private static CreditDaoImpl creditDaoImpl;

	private DataFactory dataFactory;

	private CreditDataHelper creditDataHelper;



	public CreditDaoImpl() {
		if(map==null){
			dataFactory=new DataFactoryImpl();
			creditDataHelper=dataFactory.getCreditDataHelper();
		}
	}

	public static CreditDaoImpl getInstance(){
		if(creditDaoImpl == null){
			creditDaoImpl = new CreditDaoImpl();
		}
		return creditDaoImpl;
	}

	@Override
	public long getCreditValue(int userID) throws RemoteException,Exception {
		long creditValue;
		UserDao userDao=new UserDaoImpl();
		UserPO userPO=userDao.getUserData(userID);
		creditValue=userPO.getCreditValue();
		return creditValue;
	}

	@Override
	public ResultMessage setCreditValue(int userID, long value) throws RemoteException,Exception{
		UserDao userDao=new UserDaoImpl();
		UserPO userPO=userDao.getUserData(userID);
		userPO.setCreditValue(value);
		ResultMessage message=userDao.modifyUser(userPO);
		return message;
	}

	@Override
	public Map<Integer, CreditRecordPO> getCreditRecordList(int userID) throws RemoteException {
		map=creditDataHelper.getCreditRecordList(userID);
		return map;
	}

	@Override
	public ResultMessage addCreditRecord(CreditRecordPO po) throws RemoteException {
		return creditDataHelper.addCreditRecord(po);
	}

	@Override
	public Map<Integer, RankPO> getRankList() throws RemoteException {
		
		return creditDataHelper.getRankList();
	}

	@Override
	public ResultMessage modifyRankRule(Map<Integer, RankPO> newRule) throws RemoteException {
		
		return creditDataHelper.modifyRankRule(newRule);
	}
}
