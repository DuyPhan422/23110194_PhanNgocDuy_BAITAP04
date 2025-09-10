<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Top Bar</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .right-topbar {
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .right-topbar li a {
      color: #007bff;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }
    .right-topbar li a:hover {
      color: #0056b3;
      text-decoration: underline;
    }
    .search-button {
      cursor: pointer;
      transition: color 0.3s ease;
    }
    .search-button:hover {
      color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="col-sm-6">
    <ul class="list-inline right-topbar pull-right">
      <c:choose>
        <c:when test="${sessionScope.account == null}">
          <li><a href="${pageContext.request.contextPath}/login">Đăng nhập</a> | <a href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
          <li><i class="search fa fa-search search-button"></i></li>
        </c:when>
        <c:otherwise>
          <li><a href="${pageContext.request.contextPath}/member/myaccount">${sessionScope.account.fullName}</a> | <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
          <li><i class="search fa fa-search search-button"></i></li>
        </c:otherwise>
      </c:choose>
    </ul>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>