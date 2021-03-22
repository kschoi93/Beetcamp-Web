<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>if Tag :  조건문</h1>
<!-- test:조건식 -->
<c:set var="n1" value="${12}"/>
<c:set var="n2" value="${5 }"/>
<c:if test="${n1>n2}">
	n1은 n2보다 크다
</c:if>
<c:if test="${n2>n1 }">
	n2가 n1보다 크다.
</c:if>
<!-- jstl에서 request 처리하기 -->
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"))+10;

%>
이름 = <%=name %><br/>
나이 = <%=age %><br/>

<hr/>
이름 = ${param.name }<br/>
나이 = ${param.age+10 }<br/>


</body>
</html>