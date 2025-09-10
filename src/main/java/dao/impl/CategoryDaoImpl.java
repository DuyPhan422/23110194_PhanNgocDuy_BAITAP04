package dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import config.JPAConfig;
import dao.CategoryDao;
import models.Category;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public void insert(Category c) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(c); // them
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void edit(Category c) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(c); // updata
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(int id) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Category c = em.find(Category.class, id);
            if (c != null) em.remove(c);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public Category get(int id) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Category> getAll() {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Category> q = em.createQuery("SELECT c FROM Category c ORDER BY c.id DESC", Category.class);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Category> search(String keyword) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Category> q = em.createQuery(
                    "SELECT c FROM Category c WHERE c.name LIKE :kw", Category.class);
            q.setParameter("kw", "%" + keyword + "%");
            return q.getResultList();
        } finally {
            em.close();
        }
    }
    @Override
    public List<Category> getByUserId(int userId) {
        EntityManager em = JPAConfig.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Category> q = em.createQuery(
                "SELECT c FROM Category c WHERE c.createdBy = :uid ORDER BY c.id DESC", Category.class);
            q.setParameter("uid", userId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

}
