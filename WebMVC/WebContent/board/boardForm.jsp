<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<style>
	#subject{width:80%; margin-bottom:20px;}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		$("#frm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("내용을 입력하세요");
				return false;
			}
			return true;
		});
	});
</script>
<div class="container">
	<h1>게시판 글쓰기</h1>
	<form method="post" id="frm" action="<%=request.getContextPath()%>/board/writeOk.do">
		<div>제목 : <input type="text" name="subject" id="subject"/></div>
		<textarea name="content" id="content"></textarea>
		<input type="submit" value="글등록"/>
		<input type="reset" value="다시쓰기"/>
	</form>
</div>