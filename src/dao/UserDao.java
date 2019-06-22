package dao;

import entity.User;

public interface UserDao {
	void save(User user);
	boolean userCheck(User user);
	int getIdByName(String a);
}
