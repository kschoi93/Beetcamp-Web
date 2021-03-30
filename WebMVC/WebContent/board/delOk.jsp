<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result>0 }">
	<script>
		location.href = "<%=request.getContextPath()%>/board/list.do?${pParam}";
	</script>
</c:if>
<c:if test="${result<=0}">
	<script>
		history.go(-1);
	</script>
</c:if>