<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sửa Category</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f4f7fc;
      margin: 0;
      padding: 20px;
    }
    .edit-form {
      width: 100%;
      max-width: 450px;
      margin: 40px auto;
      background: #fff;
      padding: 25px;
      border-radius: 15px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }
    .edit-form:hover {
      transform: translateY(-5px);
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }
    label {
      display: block;
      margin-top: 12px;
      margin-bottom: 6px;
      font-weight: bold;
      color: #444;
    }
    input[type="text"], input[type="file"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 14px;
      transition: border-color 0.3s ease;
    }
    input[type="text"]:focus, input[type="file"]:focus {
      border-color: #6e8efb;
      box-shadow: 0 0 8px rgba(110, 142, 251, 0.3);
    }
    .current-icon {
      text-align: center;
      margin-bottom: 10px;
    }
    .current-icon img {
      height: 60px;
      border-radius: 6px;
      border: 1px solid #ddd;
      padding: 4px;
      background: #f9f9f9;
      transition: transform 0.3s ease;
    }
    .current-icon img:hover {
      transform: scale(1.05);
    }
    .form-actions {
      text-align: center;
      margin-top: 20px;
    }
    .btn {
      display: inline-block;
      padding: 10px 16px;
      margin: 0 5px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
      transition: background 0.3s ease;
    }
    .btn-update {
      background: #007bff;
      color: white;
      border: none;
    }
    .btn-update:hover {
      background: #0056b3;
    }
    .btn-cancel {
      background: #6c757d;
      color: white;
    }
    .btn-cancel:hover {
      background: #5a6268;
    }
  </style>
</head>
<body>
  <form method="post"
        action="${pageContext.request.contextPath}/admin/category?action=edit"
        enctype="multipart/form-data" class="edit-form">
    <input type="hidden" name="id" value="${category.id}">
    <input type="hidden" name="oldIcon" value="${category.icon}">

    <h2>Cập nhật Category</h2>

    <label>Tên:</label>
    <input type="text" name="name" value="${category.name}" required>

    <label>Icon hiện tại:</label>
    <c:if test="${not empty category.icon}">
      <div class="current-icon">
        <img src="${pageContext.request.contextPath}${category.icon}" alt="icon">
      </div>
    </c:if>

    <label>Chọn icon mới (nếu muốn thay):</label>
    <input type="file" name="iconFile" accept="image/*">

    <div class="form-actions">
      <button type="submit" class="btn btn-update">✔ Cập nhật</button>
      <a href="${pageContext.request.contextPath}/admin/category?action=list" class="btn btn-cancel">✖ Hủy</a>
    </div>
  </form>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>