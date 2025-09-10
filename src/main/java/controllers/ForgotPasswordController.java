package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import service.UserService;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/forgot")
public class ForgotPasswordController extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgot.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String identity = req.getParameter("identity"); 

        UserService svc = new UserServiceImpl();

        
        String token = svc.startReset(identity);
        if (token == null) {
            req.setAttribute("alert", "Không tìm thấy tài khoản phù hợp!");
            req.getRequestDispatcher("/views/forgot.jsp").forward(req, resp);
            return;
        }
        String link = req.getContextPath() + "/reset?token=" + token;
        req.setAttribute("resetLink", link);
        req.getRequestDispatcher("/views/forgot-success.jsp").forward(req, resp);

    }
}