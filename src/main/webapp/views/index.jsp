<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxy
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản lý Hệ thống</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .hero-section {
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: white;
            padding: 60px 0;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .card {
            border: none;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .container {
            max-width: 1200px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">Hệ thống Quản lý</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/categories">Quản lý Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">Đăng xuất</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container">
        <div class="hero-section">
            <h1>Chào mừng đến với Hệ thống Quản lý</h1>
            <p>Quản lý danh mục, sản phẩm và hơn thế nữa một cách dễ dàng!</p>
            <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-light btn-lg"><i class="fas fa-list"></i> Xem Danh sách Category</a>
        </div>

        <!-- Dashboard Cards -->
        <div class="row">
            <div class="col-md-4">
                <div class="card p-3 text-center">
                    <i class="fas fa-folder-open fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Quản lý Category</h5>
                    <p class="card-text">Thêm, sửa, xóa các danh mục trong hệ thống.</p>
                    <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
            <!-- Thêm các card khác nếu cần -->
            <div class="col-md-4">
                <div class="card p-3 text-center">
                    <i class="fas fa-cogs fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Cài đặt</h5>
                    <p class="card-text">Tùy chỉnh hệ thống theo nhu cầu.</p>
                    <a href="#" class="btn btn-secondary disabled">Sắp có</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 text-center">
                    <i class="fas fa-users fa-3x text-info mb-3"></i>
                    <h5 class="card-title">Quản lý Người dùng</h5>
                    <p class="card-text">Quản lý tài khoản admin và người dùng.</p>
                    <a href="#" class="btn btn-secondary disabled">Sắp có</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>