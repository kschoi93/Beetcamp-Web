<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jsp04_include/logCheck.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=dvice-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<style>
	ul,li{maring:0;padding:0;list-style-type:none;}
	#subject{width:100%;}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#frm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요....");
				return false;
			}
			
			if(CKEDITOR.instances.content.getData()==""){
				alert("글내용을 입력하세요...");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
<%@ include file="../jsp04_include/jspf_header.jspf" %>
<div class="container">
	<h1>글쓰기폼</h1>
	<form method="post" id="frm" action="boardWriteOk.jsp">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject"/><br/></li>
			<li>글내용</li>
			<li><textarea name="content" id="content"></textarea></li>
			<li><input type="submit" value="등록"/></li>
		</ul>
	</form>
</div>
</body>
</html>