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

			userDao.addUser(new UserPO(0, UserType.Staff, "小俊", "66666666", "也是小俊", "110", new File("C:/Users/凡/Pictures/butterfly.jpg"), 0,MemberType.Tourist, null,0, null,120));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
