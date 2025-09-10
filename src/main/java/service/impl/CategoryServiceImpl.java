package service.impl;

import java.util.List;
import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import models.Category;
import models.User;
import service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    private final CategoryDao dao = new CategoryDaoImpl();

    public void insert(Category c) { dao.insert(c); }
    public void edit(Category c)   { dao.edit(c); }
    public void delete(int id)     { dao.delete(id); }

    public Category get(int id)    { return dao.get(id); }
    public List<Category> getAll() { return dao.getAll(); }
    public List<Category> search(String k) { return dao.search(k); }
    public List<Category> getAll(User current) {
        if (current.getRoleid() == 1) {
            return dao.getAll();
        } else if (current.getRoleid() == 2) {
            return dao.getByUserId(current.getId()); 
        } else {
            return dao.getAll(); 
        }
    }

}