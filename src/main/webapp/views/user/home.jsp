<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Trang chủ User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #6e8efb, #a777e3);
      margin: 0;
      padding: 0;
      min-height: 100vh;
    }
    .container {
      max-width: 500px;
      margin: 80px auto;
      background: #fff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      text-align: center;
      transition: transform 0.3s ease;
    }
    .container:hover {
      transform: translateY(-5px);
    }
    h2 {
      color: #333;
      margin-bottom: 20px;
    }
    p {
      margin: 8px 0;
      font-size: 15px;
      color: #555;
    }
    strong {
      color: #007bff;
    }
    a.btn {
      display: inline-block;
      margin: 10px 5px;
      padding: 10px 18px;
      border-radius: 6px;
      font-size: 14px;
      font-weight: bold;
      text-decoration: none;
      transition: background 0.3s ease, transform 0.3s ease;
    }
    .btn-primary {
      background: #007bff;
      color: white;
    }
    .btn-primary:hover {
      background: #0056b3;
      transform: translateY(-2px);
    }
    .btn-danger {
      background: #dc3545;
      color: white;
    }
    .btn-danger:hover {
      background: #a71d2a;
      transform: translateY(-2px);
    }
    @media (max-width: 768px) {
        .container {
            padding: 20px;
            margin: 40px auto;
        }
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Chào mừng, <c:out value="${sessionScope.account.fullName}"/>!</h2>
    <p><strong>Tài khoản:</strong> <c:out value="${sessionScope.account.userName}"/></p>
    <p><strong>Email:</strong> <c:out value="${sessionScope.account.email}"/></p>
    <p><strong>Vai trò:</strong> User</p>

    <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/category?action=list">Xem Category</a>
    <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>