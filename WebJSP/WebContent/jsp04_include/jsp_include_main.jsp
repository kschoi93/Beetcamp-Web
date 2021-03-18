<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=dvice-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
	img{width:100%; height:500px;}
	/* include 된 파일의 태그도 style 적용이 가능하다*/
	header{height:100px; background-color:pink;}
	footer{height:100px;background-color:gray;}
</style>
</head>
<body>
<div class="container">
	<!-- jsp: <-- 이렇게 시작하는 것을 action이라고 한다 -->
	<!-- header include -->
	
	<%@include file="jsp_header.jsp" %>
	<%
		out.write("이름="+username);
		out.write(", 번호="+num);
		out.write(", include 지시자는 변수 사용이 가능하다");
	%>
	<!-- 현재 페이지 컨텐츠 -->
	<div style="border:1px solid gray">

		<img src="../img/1.jpg"/>
	</div>
	<!-- footer include -->
	<jsp:include page="jsp_footer.jsp"/>
		<%
			//include page 변수 사용하기
			//변수, 데이터가 호환되지 않는다.
			//out.write("이름="+username2);
			//out.write("번호="+num2);
			
			// .jspf : jsp의 조각파일이다.
			// 데이터의 호환이 가능하다
		%>
</div>
</body>
</html>