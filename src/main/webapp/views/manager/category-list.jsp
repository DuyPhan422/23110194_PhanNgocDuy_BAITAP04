<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List - Manager</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #6e8efb, #a777e3);
        margin: 0;
        padding: 20px;
        min-height: 100vh;
    }
    .container {
        max-width: 900px;
        margin: 30px auto;
        background: #fff;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease;
    }
    .container:hover {
        transform: translateY(-5px);
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }
    .add-btn {
        display: inline-block;
        margin-bottom: 15px;
        padding: 10px 18px;
        background: #28a745;
        color: #fff;
        font-weight: bold;
        border-radius: 6px;
        text-decoration: none;
        transition: background 0.3s ease;
    }
    .add-btn:hover {
        background: #1e7e34;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        transition: background 0.3s ease;
    }
    th {
        background: #007bff;
        color: #fff;
        font-weight: bold;
    }
    tr:nth-child(even) {
        background: #f9f9f9;
    }
    tr:hover {
        background: #f1f1f1;
    }
    img {
        max-height: 80px;
        border-radius: 6px;
        transition: transform 0.3s ease;
    }
    img:hover {
        transform: scale(1.05);
    }
    .action-links a {
        margin: 0 5px;
        padding: 6px 12px;
        border-radius: 6px;
        text-decoration: none;
        font-size: 13px;
        font-weight: bold;
        transition: background 0.3s ease;
    }
    .edit-btn {
        background: #ffc107;
        color: #000;
    }
    .edit-btn:hover {
        background: #e0a800;
    }
    .delete-btn {
        background: #dc3545;
        color: #fff;
    }
    .delete-btn:hover {
        background: #a71d2a;
    }
    .back-btn {
        display: inline-block;
        padding: 10px 18px;
        background: #6c757d;
        color: #fff;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        transition: background 0.3s ease;
    }
    .back-btn:hover {
        background: #5a6268;
    }
    @media (max-width: 768px) {
        .container {
            padding: 15px;
        }
        table {
            font-size: 14px;
        }
        .action-links a {
            padding: 4px 8px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Category</h2>

        <a href="${pageContext.request.contextPath}/manager/category?action=add" class="add-btn">
            + Thêm mới
        </a>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Icon</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${cateList}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                        <td>
                            <c:if test="${not empty c.icon}">
                                <img src="${pageContext.request.contextPath}${c.icon}" alt="icon">
                            </c:if>
                        </td>
                        <td class="action-links">
                            <a href="${pageContext.request.contextPath}/manager/category?action=edit&id=${c.id}" class="edit-btn">✏ Sửa</a>
                            <a href="${pageContext.request.contextPath}/manager/category?action=delete&id=${c.id}"
                               class="delete-btn"
                               onclick="return confirm('Xóa danh mục này?')">🗑 Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/manager/home" class="back-btn">⬅ Quay về Trang chủ</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>