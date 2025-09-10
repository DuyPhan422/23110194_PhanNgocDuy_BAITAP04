package service.impl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.UUID;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import models.User;
import service.UserService;

public class UserServiceImpl implements UserService {
    private final UserDao userDao = new UserDaoImpl();

    public UserServiceImpl() {}

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password != null && password.equals(user.getPassWord())) {
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
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (userDao.checkExistUsername(username) || userDao.checkExistEmail(email)) {
            return false;
        }

        
        User u = new User();
        u.setEmail(email);
        u.setUserName(username);
        u.setFullName(fullname);
        u.setPassWord(password);
        u.setAvatar(null);
        u.setRoleid(3);
        u.setPhone(phone);
        u.setCreatedDate(LocalDateTime.now()); 

        userDao.insert(u);
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
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }

    @Override
    public String startReset(String emailOrUsername) {
        String username = userDao.findUsernameByEmailOrUsername(emailOrUsername);
        if (username == null) return null;

        String token = UUID.randomUUID().toString().replace("-", "");
        Timestamp expiresAt = new Timestamp(System.currentTimeMillis() + 15 * 60 * 1000);
        userDao.saveResetToken(username, token, expiresAt);
        return token;
    }

    @Override
    public String buildResetLink(String token, String contextPath) {
        return contextPath + "/reset?token=" + token;
    }

    @Override
    public boolean verifyAndReset(String token, String newPassword) {
        String username = userDao.findUsernameByToken(token);
        if (username == null) return false;
        userDao.updatePassword(username, newPassword);
        userDao.deleteToken(token);
        return true;
    }
}
