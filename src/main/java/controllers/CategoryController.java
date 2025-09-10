package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import models.Category;
import models.User;
import service.CategoryService;
import service.impl.CategoryServiceImpl;
import utils.Constant;

@WebServlet(urlPatterns = {
	    "/admin/category",
	    "/user/category",
	    "/manager/category"
	})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = Constant.MAX_FILE_SIZE,
    maxRequestSize = Constant.MAX_REQUEST_SIZE
)
public class CategoryController extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	private final CategoryService service = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User current = (User) req.getSession().getAttribute(Constant.SESSION_ACCOUNT);
        if (current == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
        case "add":
            if (current.getRoleid() == 1) {
                req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
            } else if (current.getRoleid() == 2) {
                req.getRequestDispatcher("/views/manager/category-add.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            }
            return;

        case "edit":
            int id = Integer.parseInt(req.getParameter("id"));
            Category cate = service.get(id);

            if (cate == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            if (current.getRoleid() == 1) {
                req.setAttribute("category", cate);
                req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
            } else if (current.getRoleid() == 2 && cate.getCreatedBy() == current.getId()) {
                req.setAttribute("category", cate);
                req.getRequestDispatcher("/views/manager/category-edit.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            }
            return;

        case "delete":
            int delId = Integer.parseInt(req.getParameter("id"));
            Category toDelete = service.get(delId);
            if (toDelete == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            
            if (current.getRoleid() == 1 || (current.getRoleid() == 2 && toDelete.getCreatedBy() == current.getId())) {
                service.delete(delId);
                resp.sendRedirect(req.getContextPath() + req.getServletPath() + "?action=list");
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            }
            return;

        default: // list
            req.setAttribute("cateList", service.getAll(current));
            if (current.getRoleid() == 1) {
                req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
            } else if (current.getRoleid() == 2) {
                req.getRequestDispatcher("/views/manager/category-list.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("/views/user/category-list.jsp").forward(req, resp);
            }
    }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User current = (User) req.getSession().getAttribute(Constant.SESSION_ACCOUNT);
        if (current == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        String servletPath = req.getServletPath(); 
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("add".equals(action) && (current.getRoleid() == 1 || current.getRoleid() == 2)) {
            String name = req.getParameter("name");
            String iconPath = saveIcon(req, "iconFile");

            Category cate = new Category();
            cate.setName(name);
            cate.setIcon(iconPath);
            cate.setCreatedBy(current.getId()); 

            service.insert(cate);

            resp.sendRedirect(req.getContextPath() + servletPath + "?action=list");
            return;
        }

        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Category cate = service.get(id);
            if (cate == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            if (current.getRoleid() == 1 || (current.getRoleid() == 2 && cate.getCreatedBy() == current.getId())) {
                String name = req.getParameter("name");
                String oldIcon = req.getParameter("oldIcon");
                String newIcon = saveIcon(req, "iconFile");
                String finalIcon = (newIcon != null) ? newIcon : oldIcon;

                cate.setName(name);
                cate.setIcon(finalIcon);

                service.edit(cate);
                resp.sendRedirect(req.getContextPath() + servletPath + "?action=list");
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            }
        }
    }

 
    private String saveIcon(HttpServletRequest req, String partName) throws IOException, ServletException {
        Part part = req.getPart(partName);
        if (part == null || part.getSize() == 0) return null;

        String ct = part.getContentType();
        if (ct == null || !ct.startsWith("image/")) return null;

        String realUploadPath = getServletContext().getRealPath(Constant.UPLOAD_DIR);
        if (realUploadPath == null) {
            realUploadPath = getServletContext().getResource(Constant.UPLOAD_DIR).getPath();
        }
        Files.createDirectories(Paths.get(realUploadPath));

        String submitted = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String ext = "";
        int dot = submitted.lastIndexOf('.');
        if (dot >= 0) ext = submitted.substring(dot);
        String savedName = UUID.randomUUID().toString().replace("-", "") + ext;

        File file = new File(realUploadPath, savedName);
        try (InputStream in = part.getInputStream(); OutputStream out = new FileOutputStream(file)) {
            in.transferTo(out);
        }

        return Constant.UPLOAD_DIR + "/" + savedName;
    }
}
