package vn.iotstar.dao;

import vn.iotstar.entity.User;

public interface UserDao {
	  User login(String username, String password);
	    User findById(int id);
}