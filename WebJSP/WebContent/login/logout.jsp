<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//session 지우기 
	session.invalidate(); // invalidate : 무효화하다
	
	response.sendRedirect("/WebJSP"); // 지정한 페이지로 이동
	
%>