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
<%@ include file="jsp04_include/jspf_header.jspf" %>
<h2>session.Id : <%=session.getId() %></h2>




<h1>JSP Start..........</h1>
<%
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONDAY) + 1;
	int day = now.get(Calendar.DAY_OF_MONTH);
	
%>


<!-- 오늘날짜 구하기 -->
<h1>오늘은 <%=year %>년 <%=month %>월 <%=day %>일 입니다.</h1> 
<hr/>
<h1>jstl태그</h1>
<!-- 
	https://tomcat.apache.org/taglibs/standard/
	jakarta-taglibs-standard-1.1.2.zip을 다운로드 후
	
	현재 프로젝트의 WEB-INF/lib에
		jstl.jar, standard.jar를 복사한다.
 -->
 <ol>
 	<li><a href="jstl/jstl01_setTag.jsp">set Tag : 변수의 선언 및 삭제</a>
 	<li><a href="jstl/jstl02_ifTag.jsp?name=이순신&age=28">if Tag : 조건문</a>
 	<li><a href="jstl/jstl03_forEachTag.jsp">forEach Tag : 반복문</a>
 	<li><a href="jstl/jstl04_forTokensTag.jsp">forTokens Tag : 문자열 조각내기</a>
	<li><a href="jstl/jstl05_urlTag.jsp">url Tag</a>
	<li><a href="jstl/jstl06_chooseTag.jsp?username=홍길동&age=25">chooose Tag : if~else, switch</a>
	<li><a href="jstl/jstl07_redirectTag.jsp">redirect Tag</a>
	
 </ol>
 <hr/>
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