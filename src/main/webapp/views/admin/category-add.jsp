<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Thêm Category</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f4f7fc;
      margin: 0;
      padding: 20px;
    }
    .add-form {
      width: 100%;
      max-width: 450px;
      margin: 40px auto;
      background: #fff;
      padding: 25px;
      border-radius: 15px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }
    .add-form:hover {
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
    .preview {
      text-align: center;
      margin-top: 10px;
    }
    .preview img {
      max-height: 80px;
      border-radius: 6px;
      border: 1px solid #ddd;
      padding: 4px;
      background: #f9f9f9;
      transition: transform 0.3s ease;
    }
    .preview img:hover {
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
    .btn-save {
      background: #28a745;
      color: white;
      border: none;
    }
    .btn-save:hover {
      background: #1e7e34;
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
        action="${pageContext.request.contextPath}/admin/category?action=add"
        enctype="multipart/form-data" class="add-form">
    <h2>Thêm Category mới</h2>

    <label>Tên:</label>
    <input type="text" name="name" required>

    <label>Chọn icon:</label>
    <input type="file" name="iconFile" accept="image/*" onchange="previewImage(event)">

    <div class="preview">
      <img id="preview" src="#" alt="Preview Icon" style="display:none;">
    </div>

    <div class="form-actions">
      <button type="submit" class="btn btn-save">✔ Lưu</button>
      <a href="${pageContext.request.contextPath}/admin/category?action=list" class="btn btn-cancel">✖ Hủy</a>
    </div>
  </form>
  <script>
    function previewImage(event) {
      const [file] = event.target.files;
      if (file) {
        const preview = document.getElementById('preview');
        preview.src = URL.createObjectURL(file);
        preview.style.display = 'block';
      }
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>