<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
	})
</script>
<!--
	다중업로드
	http://commons.apache.org/
	fileupload , io 다운로드
	WEB-INF/lib -> commons-io-2.8.0.jar 저장, commons-fileupload-1.4.jar 저장

-->

<div class="container">
	<br/>
	<h1>자료실 글 올리기(다중업로드)</h1>																	<!-- 파일 업로드 일경우 반드시 enctype 속성이 있어야 한다 -->							
	<form method="post" action="<%=request.getContextPath()%>/data/MultiUploadOk.do" id="dataFrm" enctype="multipart/form-data">
		<ul>
			<li>제목 : <input type="text" name="title" id="title" size="50" placeholder="글제목"/></li>
			<li>
				<textarea name="content" id="content"></textarea>
			</li>
			<li>첨부파일 : <input type="file" name="filename" id="filename" multiple/>
			<li>
				<input type="submit" value="자료올리기(다중업로드)"/>
				<input type="reset" value="취소"/>
			</li>
		</ul>
	</form>
</div>