package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import service.UserService;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/reset")
public class ResetPasswordController extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String token = req.getParameter("token");
        if (token == null || token.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("token", token);
        req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String token = req.getParameter("token");
        String newPass = req.getParameter("password");

        UserService svc = new UserServiceImpl();
        boolean ok = svc.verifyAndReset(token, newPass);
        if (ok) {
          
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("alert", "Token không hợp lệ hoặc đã hết hạn!");
            req.setAttribute("token", token);
            req.getRequestDispatcher("/views/reset.jsp").forward(req, resp);
        }
    }
}