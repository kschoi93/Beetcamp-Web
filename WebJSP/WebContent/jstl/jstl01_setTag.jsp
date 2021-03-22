<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl를 사용하기 위해서 지시부 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<h1>set Tag : 변수선언 및 삭제</h1>
<%
	int a = 200;
	int b = 300;
%>
<!-- jstl 변수를 선언하는 라이브러리 -->
<!-- 		변수			 값 -->
<c:set var ="num" value="${300}"/>
<c:set var="num2" value="${a+300 }"/> <!-- a+300 = 500 -->
<c:set var="username">세종대왕</c:set>
<c:set var="today" value="<%=new Date() %>"></c:set>

<h1>변수 사용하기</h1>
a = ${a}<br/>
b = $(b}<br/>
num = ${num}<br/>
num2 = ${num2}<br/>
username = ${username}<br/>
today = ${today}<br/>
<!-- 
	1. jsp에서 별도로 선언된 값은 나타내지 않는다
	2. 값이 없으면 error가 발생해야 하는데 문제가 없는 이유는 
	   null로 처리하지 않고 "" 공백으로 처리한다 -->

<h1>변수 삭제</h1>
<c:remove var="num2" scope="page"/>
num2 = ${num2}

</body>
</html>