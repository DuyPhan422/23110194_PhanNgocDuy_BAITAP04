package controller;

import java.io.IOException;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.IUserService;
import service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(urlPatterns = {"/login", "/forgetpass", "/resetpass", "/register", "/showAccount"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.endsWith("/login")) {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("account") != null) {
                response.sendRedirect(request.getContextPath() + "/waiting");
                return;
            }
            try {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("account")) {
                            session = request.getSession();
                            session.setAttribute("account", cookie.getValue());
                            response.sendRedirect(request.getContextPath() + "/waiting");
                            return;
                        }
                    }
                }
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            } catch (Exception e) {
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                e.printStackTrace();
            }
        } else if (uri.endsWith("/forgetpass")) {
            request.getRequestDispatcher("/views/forgetpass.jsp").forward(request, response);
        } else if (uri.endsWith("/resetpass")) {
            String email = request.getParameter("email");
            if (email != null && !email.isEmpty()) {
                request.setAttribute("email", email);
                request.getRequestDispatcher("/views/resetpass.jsp").forward(request, response);
            } else {
                request.setAttribute("alert", "Email không hợp lệ. Vui lòng thử lại.");
                request.getRequestDispatcher("/views/forgetpass.jsp").forward(request, response);
            }
        } else if (uri.endsWith("/register")) {
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        } else if (uri.endsWith("/showAccount")) {
            String email = request.getParameter("email");
            IUserService service = new UserServiceImpl();
            if (email != null && !email.isEmpty()) {
                User user = service.getByEmail(email);
                if (user != null) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/views/showAccount.jsp").forward(request, response);
                } else {
                    request.setAttribute("alert", "Email không tồn tại.");
                    request.getRequestDispatcher("/views/forgetpass.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("alert", "Email không hợp lệ. Vui lòng thử lại.");
                request.getRequestDispatcher("/views/forgetpass.jsp").forward(request, response);
            }
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        IUserService service = new UserServiceImpl();

        if (uri.endsWith("/login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String alertMsg = "";
            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                alertMsg = "Tài khoản hoặc mật khẩu không được rỗng";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }
            User user = service.login(username, password);
            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("account", user);
                response.sendRedirect(request.getContextPath() + "/waiting");
            } else {
                alertMsg = "Tài khoản hoặc mật khẩu không đúng";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } else if (uri.endsWith("/forgetpass")) {
            String email = request.getParameter("email");
            String alertMsg = "";
            if (email == null || email.isEmpty()) {
                alertMsg = "Email không được rỗng";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/forgetpass.jsp").forward(request, response);
                return;
            }
            if (service.checkExistEmail(email)) {
                response.sendRedirect(request.getContextPath() + "/showAccount?email=" + email);
            } else {
                alertMsg = "Email không tồn tại";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/forgetpass.jsp").forward(request, response);
            }
        } else if (uri.endsWith("/resetpass")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String alertMsg = "";
            if (password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
                alertMsg = "Mật khẩu hoặc xác nhận mật khẩu không được rỗng";
                request.setAttribute("alert", alertMsg);
                request.setAttribute("email", email);
                request.getRequestDispatcher("/views/resetpass.jsp").forward(request, response);
                return;
            }
            if (!password.equals(confirmPassword)) {
                alertMsg = "Mật khẩu và xác nhận mật khẩu không khớp";
                request.setAttribute("alert", alertMsg);
                request.setAttribute("email", email);
                request.getRequestDispatcher("/views/resetpass.jsp").forward(request, response);
                return;
            }
            if (service.updatePass(email, password)) {
                request.setAttribute("alert", "Cập nhật mật khẩu thành công. Vui lòng đăng nhập lại.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            } else {
                alertMsg = "Cập nhật mật khẩu thất bại. Vui lòng thử lại.";
                request.setAttribute("alert", alertMsg);
                request.setAttribute("email", email);
                request.getRequestDispatcher("/views/resetpass.jsp").forward(request, response);
            }
        } else if (uri.endsWith("/register")) {
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String alertMsg = "";
            if (email == null || email.isEmpty() || username == null || username.isEmpty() || 
                password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
                alertMsg = "Vui lòng điền đầy đủ thông tin";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }
            if (!password.equals(confirmPassword)) {
                alertMsg = "Mật khẩu và xác nhận mật khẩu không khớp";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }
            if (service.checkExistEmail(email)) {
                alertMsg = "Email đã tồn tại";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }
            if (service.checkExistUsername(username)) {
                alertMsg = "Tên tài khoản đã tồn tại";
                request.setAttribute("alert", alertMsg);
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }
            User user = new User();
            user.setEmail(email);
            user.setUserName(username);
            user.setPassWord(password);
            user.setRoleid(1); // Mặc định là user thường
            service.insert(user);
            request.setAttribute("alert", "Đăng ký thành công. Vui lòng đăng nhập.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
