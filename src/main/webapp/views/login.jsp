<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background: linear-gradient(135deg, #6e8efb, #a777e3);
      font-family: 'Segoe UI', sans-serif;
    }
    .login-container {
      width: 100%;
      max-width: 350px;
      background: #fff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease;
    }
    .login-container:hover {
      transform: translateY(-5px);
    }
    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 25px;
    }
    label {
      display: block;
      margin-bottom: 6px;
      color: #444;
      font-size: 14px;
      font-weight: bold;
    }
    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 14px;
      transition: border-color 0.3s ease;
    }
    input[type="text"]:focus, input[type="password"]:focus {
      border-color: #6e8efb;
      box-shadow: 0 0 8px rgba(110, 142, 251, 0.3);
    }
    input[type="checkbox"] {
      margin-right: 6px;
    }
    .remember {
      margin-bottom: 15px;
      font-size: 13px;
      color: #555;
    }
    button {
      width: 100%;
      padding: 10px;
      background: #007bff;
      border: none;
      border-radius: 6px;
      color: white;
      font-size: 15px;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s ease;
    }
    button:hover {
      background: #0056b3;
    }
    .links {
      text-align: center;
      margin-top: 15px;
      font-size: 13px;
    }
    .links a {
      color: #007bff;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    .links a:hover {
      color: #0056b3;
      text-decoration: underline;
    }
    .alert {
      color: red;
      text-align: center;
      margin-bottom: 10px;
      font-size: 14px;
      border-radius: 6px;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Đăng nhập</h2>

    <c:if test="${alert != null}">
      <p class="alert"><c:out value="${alert}" /></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
      <label>Tài khoản:</label>
      <input type="text" name="username" required>

      <label>Mật khẩu:</label>
      <input type="password" name="password" required>

      <div class="remember">
        <label><input type="checkbox" name="remember"> Ghi nhớ tôi</label>
      </div>

      <button type="submit">Đăng nhập</button>

      <div class="links">
        <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></p>
        <p><a href="${pageContext.request.contextPath}/forgot">Quên mật khẩu?</a></p>
      </div>
    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>