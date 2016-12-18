package testDataHelper;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import po.UserPO;

public class AddUser {

	public static void main(String[] args) {
		UserDao userDao = new UserDaoImpl();
		userDao.addUser();
	}
}
