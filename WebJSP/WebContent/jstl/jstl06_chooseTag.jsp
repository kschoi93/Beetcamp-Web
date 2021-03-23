<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %> <!-- jsp코드 빈자리 제거 역할 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=dvice-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</head>
<body>
<h1>choose 태그 : if~else문, switch문</h1>
<c:choose>
	<c:when test="${param.username=='홍길동'}">
		당신의 이름은 ${param.username }입니다.<br/>
		c:when = if<br/>
		c:when = if else<br/>
		c:otherwise = else
	</c:when>
	<c:when test="${param.age>=20 }">
		당신의 나이는 20세 이상 입니다.
	</c:when>
	<c:otherwise>
		당신의 이름은 홍길동이 아니고, 20세 이상도 아닙니다.
	</c:otherwise>
</c:choose>
</body>
</html>