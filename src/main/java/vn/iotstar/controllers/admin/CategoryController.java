package vn.iotstar.controllers.admin;


import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entities.Category;
import vn.iotstar.services.CategoryService;
import vn.iotstar.services.impl.CategoryServiceImpl;


@WebServlet(urlPatterns = {"/admin/categories"})
public class CategoryController extends HttpServlet{
	
	CategoryService cateService = new CategoryServiceImpl();
	
	private static long serialVersionID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> listCategory = cateService.findAll();
		req.setAttribute("listcate", listCategory);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/categories.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    req.setCharacterEncoding("UTF-8");
	    String action = req.getParameter("action");

	    try {
	        if ("insert".equals(action)) {
	            Category c = new Category();
	            c.setCategoryname(req.getParameter("categoryname"));
	            cateService.create(c);

	        } else if ("update".equals(action)) {
	            int id = Integer.parseInt(req.getParameter("id"));
	            Category c = cateService.findById(id);
	            if (c != null) {
	                c.setCategoryname(req.getParameter("categoryname"));
	                cateService.update(c);
	            }

	        } else if ("delete".equals(action)) {
	            int id = Integer.parseInt(req.getParameter("id"));
	            cateService.delete(id);
	        }
	    } catch (Exception e) {
	        throw new ServletException(e);
	    }

	    // Quay về danh sách -> GET mới
	    resp.sendRedirect(req.getContextPath() + "/admin/categories");
	}

}

