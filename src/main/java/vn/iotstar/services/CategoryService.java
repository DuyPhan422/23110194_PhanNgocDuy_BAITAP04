package vn.iotstar.services;

import java.util.List;

import vn.iotstar.entities.Category;

public interface CategoryService {
	List<Category> findAll();
	void create(Category category);
	void update(Category category);
	void delete(int id);
	Category findById(int id);
	
}

