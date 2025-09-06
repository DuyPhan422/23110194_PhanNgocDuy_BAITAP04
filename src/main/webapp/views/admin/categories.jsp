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
    <title>Quản lý Category</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional: Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 1200px;
            margin-top: 30px;
        }
        .card {
            border: none;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            background-color: #fff;
        }
        .btn-sm {
            padding: 5px 10px;
        }
        .form-control {
            max-width: 300px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Quản lý Category</h2>

        <!-- Hiển thị thông báo nếu có -->
        <c:if test="${not empty message}">
            <div class="alert alert-info alert-dismissible fade show" role="alert">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Form thêm mới -->
        <div class="card p-4 mb-4">
            <h4 class="card-title">Thêm Category mới</h4>
            <form action="${pageContext.request.contextPath}/admin/categories" method="post" class="d-flex align-items-center gap-3">
                <input type="hidden" name="action" value="insert">
                <div class="mb-3">
                    <label for="categoryname" class="form-label">Tên Category</label>
                    <input type="text" class="form-control" id="categoryname" name="categoryname" required>
                </div>
                <button type="submit" class="btn btn-primary mt-2"><i class="fas fa-plus"></i> Thêm mới</button>
            </form>
        </div>

        <!-- Bảng danh sách Category -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Danh sách Category</h4>
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Tên Category</th>
                            <th scope="col">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listcate}" var="cat">
                            <tr>
                                <td>${cat.id}</td>
                                <td>${cat.categoryname}</td>
                                <td>
                                    <!-- Form cập nhật -->
                                    <form action="${pageContext.request.contextPath}/admin/categories" method="post" class="d-inline-block">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="id" value="${cat.id}">
                                        <input type="text" class="form-control form-control-sm d-inline-block w-auto" name="categoryname" value="${cat.categoryname}" required>
                                        <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-save"></i> Cập nhật</button>
                                    </form>
                                    <!-- Form xóa -->
                                    <form action="${pageContext.request.contextPath}/admin/categories" method="post" class="d-inline-block" onsubmit="return confirm('Bạn chắc chắn muốn xóa category này?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${cat.id}">
                                        <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>