package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import models.User;
import utils.Constant;

@WebServlet(urlPatterns = "/waiting")
public class WaitingController extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute(Constant.SESSION_ACCOUNT) != null) {
            User u = (User) session.getAttribute(Constant.SESSION_ACCOUNT);
            if (u.getRoleid() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            } else if (u.getRoleid() == 2) {
                resp.sendRedirect(req.getContextPath() + "/manager/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/user/home");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
