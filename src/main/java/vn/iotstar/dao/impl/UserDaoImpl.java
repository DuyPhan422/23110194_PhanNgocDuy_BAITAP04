package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import vn.iotstar.dao.UserDao;
import vn.iotstar.entity.User;

public class UserDaoImpl implements UserDao {

    private EntityManager em;

    public UserDaoImpl() {
        em = Persistence.createEntityManagerFactory("dataSource").createEntityManager();
    }

    @Override
    public User login(String username, String password) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.username = :un AND u.password = :pw", User.class)
                     .setParameter("un", username)
                     .setParameter("pw", password)
                     .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public User findById(int id) {
        return em.find(User.class, id);
    }
}