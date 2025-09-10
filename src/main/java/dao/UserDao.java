package dao;

import models.User;

public interface UserDao {
    User get(String username);
    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    boolean existsByEmailOrUsername(String emailOrUsername);
    String  findUsernameByEmailOrUsername(String emailOrUsername);

    void    saveResetToken(String username, String token, java.sql.Timestamp expiresAt);
    String  findUsernameByToken(String token); 
    void    deleteToken(String token);

    void    updatePassword(String username, String newPlainPassword);
}
