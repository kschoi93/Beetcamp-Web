<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<%
		//클라이언트 컴퓨터에 있는 쿠키객체를 가져오기
		Cookie[] cookie = request.getCookies();
		for(int i=0; i<cookie.length; i++){
			out.write("<li>이름="+ cookie[i].getName()+", 쿠키값="+cookie[i].getValue());
		}
	%>
</ul>
</body>
</html>