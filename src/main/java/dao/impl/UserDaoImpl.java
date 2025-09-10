package dao.impl;


import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import config.JPAConfig;
import dao.UserDao;
import models.User;

import java.sql.Timestamp;
import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public User get(String username) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<User> q = em.createQuery("SELECT u FROM User u WHERE u.userName = :username", User.class);
            q.setParameter("username", username);
            List<User> result = q.getResultList();
            return result.isEmpty() ? null : result.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(User user) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(user);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Long> q = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class);
            q.setParameter("email", email);
            return q.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistUsername(String username) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Long> q = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.userName = :username", Long.class);
            q.setParameter("username", username);
            return q.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistPhone(String phone) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Long> q = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.phone = :phone", Long.class);
            q.setParameter("phone", phone);
            return q.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean existsByEmailOrUsername(String emailOrUsername) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Long> q = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :val OR u.userName = :val", Long.class);
            q.setParameter("val", emailOrUsername);
            return q.getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public String findUsernameByEmailOrUsername(String emailOrUsername) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<String> q = em.createQuery("SELECT u.userName FROM User u WHERE u.email = :val OR u.userName = :val", String.class);
            q.setParameter("val", emailOrUsername);
            List<String> result = q.setMaxResults(1).getResultList();
            return result.isEmpty() ? null : result.get(0);
        } finally {
            em.close();
        }
    }

    

    @Override
    public void saveResetToken(String username, String token, Timestamp expiresAt) {
        
    }

    @Override
    public String findUsernameByToken(String token) {
        
        return null;
    }

    @Override
    public void deleteToken(String token) {
       
    }

    @Override
    public void updatePassword(String username, String newPlainPassword) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            TypedQuery<User> q = em.createQuery("SELECT u FROM User u WHERE u.userName = :username", User.class);
            q.setParameter("username", username);
            List<User> result = q.getResultList();
            if (!result.isEmpty()) {
                User u = result.get(0);
                u.setPassWord(newPlainPassword);
                em.merge(u);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}
