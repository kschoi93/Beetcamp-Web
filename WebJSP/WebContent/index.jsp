<!-- 지시부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Scanner" %>
<%@ page import="java.util.Random" %>
<%@ page trimDirectiveWhitespaces="true" %> <!-- jsp코드 빈자리 제거 역할 -->
<%!
	//선언부
	//메소드 또는 변수 선언 : 메소드는 선언부에 작성해야 한다.
		
	public int sum(int a,int b){
		int hap = a+b;
		return hap;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{ background:pink;
	}
</style>
<script>
	//document.write('자바스크립트');
</script>
</head>
<body>

<h2>session.Id : <%=session.getId() %></h2>
<% 
	// session 로그인 여부 확인후 선택하여 표시한다.
	if(session.getAttribute("logStatus")==null){ // 로그인 됨 : Y, 로그인 안됨 : null
%>
	<a href="<%=request.getContextPath()%>/login/login_form.html">로그인</a>
<% } else if(session.getAttribute("logStatus").equals("Y")){ %>
	<%= session.getAttribute("logName") %>
	<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
<% } %>



<h1>JSP Start..........</h1>
<%
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONDAY) + 1;
	int day = now.get(Calendar.DAY_OF_MONTH);
	
%>


<!-- 오늘날짜 구하기 -->
<h1>오늘은 <%=year %>년 <%=month %>월 <%=day %>일 입니다.</h1> 
<%	// 스크립트릿, JSP를 HTML에 추가해서 작성한다
	/*
		1. JSP -> suvlet -> client
	*/
	int a = 1234;
	int b = 5678;
	String name = "홍길동";
	//out내장객체 : client에게 정보를 보냄(response)
	out.write(name);
	int result= sum(10,100);
	out.write("<br/>result="+result);
	out.write("<br/>"+a+"+"+b+"="+sum(a,b));

%>
<br/> 
<%= a+4 %>-
<%=b %>=
<%=sum(a,b) %> <!--  간편하게 값만 출력할때는      =   : out.write(); -->
<hr/>
<%
	out.write("<h1>aaaaaaaaaaaaaaaaaa</h1>");
	out.write("<img src='img/1.jpg' width='500px'/>");
%>
</body>
</html> 