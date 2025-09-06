package vn.iotstar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.entities.Category;

public class CategoryImpl implements CategoryDao{

	@Override
	public List<Category> findAll() {
		EntityManager em = JPAConfig.getEntityManager();
	    try {
	        TypedQuery<Category> query = em.createNamedQuery("Category.findAll", Category.class);
	        return query.getResultList();
	    } finally {
	        em.close();
	    }
	}

	@Override
	public void create(Category category) {
		// TODO Auto-generated method stub
		EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(category);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
	}

	@Override
	public void update(Category category) {
		// TODO Auto-generated method stub
		EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(category);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Category c = em.find(Category.class, id);
            if (c != null) em.remove(c);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
	}

	@Override
	public Category findById(int id) {
		EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
	}

}

