<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 로그인 성공시 -->
<c:if test="${ userid != null && username!=null}">
	<script>
		location.href = "<%=request.getContextPath()%>/index.do";
	</script>
</c:if>
<!--  로그인 실패시 -->
<c:if test="${ userid==null || username==null }">
	<script>
		history.back();
	</script>
</c:if>