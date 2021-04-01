<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 본인글이 아닐때 -->
<c:if test="${result==100 }">
	<script>
		location.href="<%=request.getContextPath()%>/board/list.do";
	</script>
</c:if>
<!-- 글 수정 완료 -->
<c:if test="${result==1 }">
	<script>
		location.href="<%=request.getContextPath()%>/board/boardView.do?${addrParam}";
	</script>
</c:if>
<!-- 글 수정 안됨 -->
<c:if test="${result==0 }">
	<script>
		history.back();
	</script>
</c:if>