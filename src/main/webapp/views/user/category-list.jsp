<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
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
        max-width: 800px;
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
    a.btn-back {
        display: inline-block;
        padding: 10px 16px;
        background: #28a745;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        transition: background 0.3s ease;
    }
    a.btn-back:hover {
        background: #1e7e34;
    }
    @media (max-width: 768px) {
        .container {
            padding: 15px;
        }
        table {
            font-size: 14px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Category</h2>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Icon</th>
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
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div style="text-align: center;">
            <a class="btn-back" href="${pageContext.request.contextPath}/user/home">⬅ Quay về Trang chủ</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>