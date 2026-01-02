<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home_style.css">
</head>

<body>
	<%@ include file="menu.jsp"%>
	<h1>WELCOME <br>TO E-TRAVEL<br> MANAGEMENT APPLICATION</h1>
	<button onclick="alert('HELLO WANDERER!')">
    HELLO!
  </button>
  <br>
  <button onclick="alert('<3')">WITH LOVE<3</button>
	
</body>
</html>