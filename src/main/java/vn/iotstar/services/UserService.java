package vn.iotstar.services;

import vn.iotstar.entity.User;

public interface UserService {
	User login(String username, String password);

}