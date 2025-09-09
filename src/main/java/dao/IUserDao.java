package dao;

import entity.User;

public interface IUserDao {
    User get(String username);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean updatePass(String email, String newPass);
    void insert(User user);
    User getByEmail(String email);
}
