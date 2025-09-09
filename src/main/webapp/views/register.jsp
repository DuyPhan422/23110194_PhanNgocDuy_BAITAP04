<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký</title>
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
        .register-card {
            width: 100%;
            max-width: 450px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            background: #fff;
            transition: transform 0.3s ease;
        }
        .register-card:hover {
            transform: translateY(-5px);
        }
        .btn-primary {
            background: #6e8efb;
            border: none;
            padding: 12px;
            font-size: 1.1rem;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #5a78e0;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #6e8efb;
            box-shadow: 0 0 8px rgba(110, 142, 251, 0.3);
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
    </style>
</head>
<body>
<div class="register-card">
    <h2 class="text-center mb-4">Đăng Ký</h2>
    <c:if test="${alert != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${alert}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Nhập email" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Tài khoản</label>
            <input type="text" name="username" class="form-control" placeholder="Nhập tài khoản" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Xác Nhận Mật Khẩu</label>
            <input type="password" name="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng Ký</button>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">Quay lại Đăng Nhập</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>