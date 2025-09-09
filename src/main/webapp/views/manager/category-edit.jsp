<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-4">

<h3>Sửa Category</h3>

<form action="${pageContext.request.contextPath}/manager/edit" method="post">
    <input type="hidden" name="id" value="${cate.id}"/>

    <div class="mb-3">
        <label class="form-label">Tên Category</label>
        <input type="text" name="categoryname" class="form-control" value="${cate.categoryname}" required/>
    </div>

    <button class="btn btn-primary">Cập nhật</button>
    <a href="${pageContext.request.contextPath}/manager/home" class="btn btn-secondary">Hủy</a>
</form>

</body>
</html>