<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  에러가 발생하면 실행 페이지 -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<div class="container">
		<h2>홈페이지에 에러가 발생하였습니다.. 클릭하시면 홈페이지로 이동합니다..</h2>
		<a href="<%=request.getContextPath() %>"><img src="../img/comming.jpg"/></a>
		<hr/>
		<h2>
			에러메시지 : <%= exception.getMessage() %>
		</h2>
	</div>
</body>
</html>