package testDataHelper;

import java.io.File;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import model.MemberType;
import model.UserType;
import po.UserPO;

public class AddUser {

	public static void main(String[] args) {
		UserDao userDao = new UserDaoImpl();
		try {

			userDao.addUser(new UserPO(0, UserType.WebManager, "小俊2", "66666666", "也是小俊", "110",null, 0,MemberType.Tourist, null,0, null,120));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
