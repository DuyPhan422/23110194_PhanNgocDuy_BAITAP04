<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sửa Danh Mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f7fc;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
        }
        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .form-container:hover {
            transform: translateY(-5px);
        }
        .btn-success, .btn-secondary {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            background: #218838;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
        }
        .form-control:focus {
            border-color: #6e8efb;
            box-shadow: 0 0 8px rgba(110, 142, 251, 0.3);
        }
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-weight: 500;
            color: #6e8efb;
            text-decoration: none;
        }
        .logout-btn:hover {
            color: #5a78e0;
            text-decoration: underline;
        }
        .category-image {
            border-radius: 10px;
            max-width: 200px;
        }
    </style>
</head>
<body>
<a href="<%=request.getContextPath()%>/logout" class="logout-btn">🚪 Đăng Xuất</a>
<div class="container">
    <div class="form-container">
        <h2 class="mb-4">Sửa Danh Mục</h2>
        <form action="<c:url value='/category/edit'/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${category.id}"/>
            <div class="mb-3">
                <label for="categoryname" class="form-label">Tên Danh Mục</label>
                <input type="text" class="form-control" id="categoryname" name="categoryname" value="${category.categoryname}" required>
            </div>
            <div class="mb-3">
                <label for="images" class="form-label">Hình Ảnh</label>
                <img src="${pageContext.request.contextPath}/image?fname=${category.images}" alt="Category Image" class="category-image mb-3"/>
                <input type="file" class="form-control" id="images" name="images" accept="image/*">
            </div>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success">Lưu</button>
                <a href="javascript:history.back()" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>