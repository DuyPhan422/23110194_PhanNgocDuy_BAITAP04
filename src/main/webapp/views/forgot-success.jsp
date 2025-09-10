<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Yêu cầu đã tạo</title>
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
    .success-card {
      width: 100%;
      max-width: 450px;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      background: #fff;
      transition: transform 0.3s ease;
      text-align: center;
    }
    .success-card:hover {
      transform: translateY(-5px);
    }
    h2 {
      color: #333;
      margin-bottom: 15px;
    }
    p {
      color: #555;
      font-size: 14px;
      margin-bottom: 15px;
    }
    a {
      color: #6e8efb;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }
    a:hover {
      color: #5a78e0;
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="success-card">
    <h2><c:out value="${message}"/></h2>
    <p>(Demo) Link đặt lại mật khẩu: 
       <a href="${resetLink}"><c:out value="${resetLink}"/></a></p>
    <p><em>Thực tế nên gửi link này qua email.</em></p>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>