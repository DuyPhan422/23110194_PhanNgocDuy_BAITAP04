package vn.iotstar.controllers.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.User;

@WebServlet(urlPatterns = {
    "/user/home", "/admin/home", "/manager/home",
    "/manager/insert", "/manager/edit", "/manager/delete"
})
@MultipartConfig
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryDao cateDao = new CategoryDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        User u = (User) req.getSession().getAttribute("user");

        if (uri.endsWith("/user/home")) {
            req.setAttribute("listcate", cateDao.findAll());
            req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
        } else if (uri.endsWith("/admin/home")) {
            req.setAttribute("listcate", cateDao.findAll());
            req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
        } else if (uri.endsWith("/manager/home")) {
            req.setAttribute("listcate", cateDao.findByUserId(u.getId()));
            req.getRequestDispatcher("/views/manager/home.jsp").forward(req, resp);
        } else if (uri.endsWith("/manager/insert")) {
            req.getRequestDispatcher("/views/manager/category-add.jsp").forward(req, resp);
        } else if (uri.endsWith("/manager/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            req.setAttribute("cate", cateDao.findById(id));
            req.getRequestDispatcher("/views/manager/category-edit.jsp").forward(req, resp);
        } else if (uri.endsWith("/manager/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            cateDao.delete(id);
            resp.sendRedirect(req.getContextPath() + "/manager/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        User u = (User) req.getSession().getAttribute("user");

        if (uri.endsWith("/manager/insert")) {
            String name = req.getParameter("categoryname");
            Part iconPart = req.getPart("icon");
            String fileName = Paths.get(iconPart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = req.getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            iconPart.write(uploadPath + File.separator + fileName);

            Category c = new Category();
            c.setCategoryname(name);
            c.setIcon("uploads/" + fileName);
            c.setUser(u);

            cateDao.create(c);
            resp.sendRedirect(req.getContextPath() + "/manager/home");
        } else if (uri.endsWith("/manager/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("categoryname");

            Category c = cateDao.findById(id);
            if (c != null) {
                c.setCategoryname(name);
                cateDao.update(c);
            }
            resp.sendRedirect(req.getContextPath() + "/manager/home");
        }
    }
}