package service;


import java.util.List;
import models.Category;
import models.User;

public interface CategoryService {
    void insert(Category c);
    void edit(Category c);
    void delete(int id);

    Category get(int id);
    List<Category> getAll();
    List<Category> search(String keyword);
    List<Category> getAll(User current);
}
