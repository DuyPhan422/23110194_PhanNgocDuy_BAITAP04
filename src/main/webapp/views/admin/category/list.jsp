<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Danh Mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f7fc;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            margin-top: 30px;
            max-width: 1200px;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .table thead {
            background: #6e8efb;
            color: #fff;
        }
        .table tbody tr {
            transition: background 0.2s ease;
        }
        .table tbody tr:hover {
            background: #f1f3ff;
        }
        .btn-primary, .btn-success, .btn-danger {
            border-radius: 8px;
            padding: 8px 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #5a78e0;
        }
        .btn-success:hover {
            background: #218838;
        }
        .btn-danger:hover {
            background: #c82333;
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
        .alert {
            border-radius: 8px;
        }
    </style>
</head>
<body>
<a href="<%=request.getContextPath()%>/logout" class="logout-btn">🚪 Đăng Xuất</a>
<div class="container">
    <h2 class="mb-4">Danh Sách Danh Mục</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>STT</th>
            <th>Tên Danh Mục</th>
            <th>Hình Ảnh</th>
            <th>ID Danh Mục</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${categories}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index + 1}</td>
                <td>${cate.categoryname}</td>
                <td><img width="150px" src="${pageContext.request.contextPath}/image?fname=${cate.images}" class="img-fluid rounded"/></td>
                <td>${cate.id}</td>
                <td>
                    <a href="<c:url value='/category/edit?id=${cate.id}'/>" class="btn btn-sm btn-primary">Sửa</a>
                    <a href="<c:url value='/category/delete?id=${cate.id}'/>" class="btn btn-sm btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="<%=request.getContextPath()%>/category/add" class="btn btn-success">Thêm Danh Mục Mới</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>