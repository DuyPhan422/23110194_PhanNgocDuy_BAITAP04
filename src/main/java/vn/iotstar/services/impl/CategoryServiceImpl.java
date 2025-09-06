package vn.iotstar.services.impl;

import java.util.List;

import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryImpl;
import vn.iotstar.entities.Category;
import vn.iotstar.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	CategoryDao cateDao = new CategoryImpl();
	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		
		return cateDao.findAll();
	}

	@Override
	public void create(Category category) {
		cateDao.create(category);
		
	}

	@Override
	public void update(Category category) {
		// TODO Auto-generated method stub
		cateDao.update(category);
	}

	@Override
	public void delete(int id) {
		cateDao.delete(id);
		
	}

	@Override
	public Category findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}

