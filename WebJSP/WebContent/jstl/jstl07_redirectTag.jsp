<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- redirect 값을 넘겨주는....?  -->
<c:redirect url="../board/boardList.jsp">
	<c:param name="nowNum" value="2"/>
	<c:param name="searchKey" value="content"/>
	<c:param name="searchWord" value="다"/>
</c:redirect>