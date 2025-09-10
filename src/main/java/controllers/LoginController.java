package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import models.User;
import service.UserService;
import service.impl.UserServiceImpl;
import utils.Constant;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute(Constant.SESSION_ACCOUNT) != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

      
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (Constant.COOKIE_REMEMBER.equals(c.getName())) {
                    session = req.getSession(true);
                    session.setAttribute(Constant.SESSION_USERNAME, c.getValue());
                    resp.sendRedirect(req.getContextPath() + "/waiting");
                    return;
                }
            }
        }

        req.getRequestDispatcher(Constant.PATH_LOGIN).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        boolean isRememberMe = "on".equals(req.getParameter("remember"));

        if (username == null || username.isBlank() ||
            password == null || password.isBlank()) {
            req.setAttribute("alert", "Tài khoản hoặc mật khẩu không được rỗng");
            req.getRequestDispatcher(Constant.PATH_LOGIN).forward(req, resp);
            return;
        }

        UserService service = new UserServiceImpl();
        User user = service.login(username, password);
        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute(Constant.SESSION_ACCOUNT, user);

            if (isRememberMe) {
                Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
                cookie.setMaxAge(30 * 60); 
                cookie.setHttpOnly(true);
                cookie.setPath(req.getContextPath());
                resp.addCookie(cookie);
            }
            resp.sendRedirect(req.getContextPath() + "/waiting");
        } else {
            req.setAttribute("alert", "Tài khoản hoặc mật khẩu không đúng");
            req.getRequestDispatcher(Constant.PATH_LOGIN).forward(req, resp);
        }
    }
}
