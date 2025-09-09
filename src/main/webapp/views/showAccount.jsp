<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông Tin Tài Khoản</title>
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
        .account-card {
            width: 100%;
            max-width: 450px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            background: #fff;
            transition: transform 0.3s ease;
        }
        .account-card:hover {
            transform: translateY(-5px);
        }
        .btn-primary, .btn-outline-primary {
            border-radius: 8px;
            padding: 12px;
            font-size: 1.1rem;
            transition: background 0.3s ease;
        }
        .btn-primary {
            background: #6e8efb;
            border: none;
        }
        .btn-primary:hover {
            background: #5a78e0;
        }
        .btn-outline-primary {
            border-color: #6e8efb;
            color: #6e8efb;
        }
        .btn-outline-primary:hover {
            background: #6e8efb;
            color: #fff;
        }
        .text-center a {
            color: #6e8efb;
            text-decoration: none;
            font-weight: 500;
        }
        .text-center a:hover {
            color: #5a78e0;
            text-decoration: underline;
        }
        .alert {
            border-radius: 8px;
        }
        .info-box {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="account-card">
    <h2 class="text-center mb-4">Thông Tin Tài Khoản</h2>
    <c:if test="${alert != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${alert}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${user != null}">
        <div class="info-box">
            <p><strong>Tài khoản:</strong> ${user.userName}</p>
            <p><strong>Mật khẩu:</strong> ${user.passWord}</p>
        </div>
    </c:if>
    <div class="text-center">
        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary w-100 mb-2">Quay lại Đăng Nhập</a>
        <a href="${pageContext.request.contextPath}/resetpass?email=${user.email}" class="btn btn-outline-primary w-100 mb-2">Tạo Mật Khẩu Mới</a>
        <a href="${pageContext.request.contextPath}/forgetpass" class="text-center">Thử email khác</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
