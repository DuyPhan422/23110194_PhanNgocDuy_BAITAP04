package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import models.User;
import utils.Constant;

@WebFilter("/*") // lọc tất cả request
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        User current = (session != null) ? (User) session.getAttribute(Constant.SESSION_ACCOUNT) : null;

      
        if (current == null && requiresAuth(uri)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (current != null && current.getRoleid() == 3 &&
                (uri.contains("/admin/") || uri.contains("/manager/"))) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập!");
            return;
        }

        if (current != null && current.getRoleid() == 2 && uri.contains("/admin/")) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền quản trị!");
            return;
        }

        chain.doFilter(request, response);
    }

    private boolean requiresAuth(String uri) {
       
        return uri.contains("/admin/") || uri.contains("/manager/") || uri.contains("/home");
    }
}
