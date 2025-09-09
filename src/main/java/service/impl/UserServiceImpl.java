package service.impl;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.IUserService;

public class UserServiceImpl implements IUserService {
    
    private IUserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        if (this.checkExistUsername(username) == false) {
            return null;
        }
        User user = userDao.get(username);
        if (user != null && user.getPassWord().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public boolean register(String email, String password, String username) {
        if (checkExistEmail(email) || checkExistUsername(username)) {
            return false;
        }
        User user = new User();
        user.setEmail(email);
        user.setUserName(username);
        user.setPassWord(password);
        user.setRoleid(1); // Mặc định là user thường
        insert(user);
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean updatePass(String email, String newPass) {
        return userDao.updatePass(email, newPass);
    }

    @Override
    public User getByEmail(String email) {
        return userDao.getByEmail(email);
    }
}
