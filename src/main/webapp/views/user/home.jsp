<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-4">

<h3>Xin chào User: ${sessionScope.user.username}</h3>
<a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Logout</a>

<h4 class="mt-4">Danh sách Category</h4>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Icon</th>
        <th>Người tạo</th>
    </tr>
    <c:forEach var="c" items="${listcate}">
        <tr>
            <td>${c.id}</td>
            <td>${c.categoryname}</td>
            <td><img src="${pageContext.request.contextPath}/${c.icon}" width="50"/></td>
            <td>${c.user.username}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>