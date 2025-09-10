package dao;

import java.util.List;
import models.Category;

public interface CategoryDao {
    void insert(Category c);
    void edit(Category c);
    void delete(int id);

    Category get(int id);
    List<Category> getAll();
    List<Category> search(String keyword);
    List<Category> getByUserId(int userId);

}
