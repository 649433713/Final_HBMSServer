package daoImpl;

import java.rmi.RemoteException;

import dao.CreditDao;

public class CreditDaoImpl implements CreditDao{
	
	private static CreditDaoImpl creditDaoImpl;
	
	public static CreditDaoImpl getInstance() {
		// TODO 自动生成的构造函数存根
		if(creditDaoImpl==null){
			creditDaoImpl=new CreditDaoImpl();
		}
		return creditDaoImpl;
	}
	
	@Override
	public void showCredit() throws RemoteException {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public void showCreditRecord() throws RemoteException {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public boolean addCredit(int creditValue) throws RemoteException {
		// TODO 自动生成的方法存根
		return false;
	}

	@Override
	public boolean resumeCredit(int credit) throws RemoteException {
		// TODO 自动生成的方法存根
		return false;
	}

	@Override
	public int getCreditValue(String id) throws RemoteException {
		// TODO 自动生成的方法存根
		return 0;
	}

	@Override
	public int setCreditValue(String id, int value) throws RemoteException {
		// TODO 自动生成的方法存根
		return 0;
	}

	@Override
	public String getChangeType(String id) throws RemoteException {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public String getReasonType(String id) throws RemoteException {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public String getAccount(String id) throws RemoteException {
		// TODO 自动生成的方法存根
		return null;
	}

}
