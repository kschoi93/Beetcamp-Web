<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<style>
	#dataFrm li{
		padding:10px 5px;
	}
	#title{width:90%;}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#dataFrm").submit(function(){
			if($("#title").val()==""){
				alert("제목을 입력하세요..");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글내용을 입력하세요...");
				return false;
			}
			
			var fileCnt = 0;
			if($("#filename1").val()!=""){
				fileCnt++;
			}
			if($("#filename2").val()!=""){
				fileCnt++;
			}
			if(fileCnt<1){
				alert("파일을 첨부하세요...")
				return false;
			}
			return true;
		});
		
	});
</script>
<div class="container">
	<h1>자료실 글 올리기</h1>																	<!-- 파일 업로드 일경우 반드시 enctype 속성이 있어야 한다 -->							
	<form method="post" action="<%=request.getContextPath()%>/data/dataFormOk.do" id="dataFrm" enctype="multipart/form-data">
		<ul>
			<li>제목 : <input type="text" name="title" id="title" size="50"/></li>
			<li>
				<textarea name="content" id="content"></textarea>
			</li>
			<li>첨부파일 : <input type="file" name="filename1" id="filename1"/>
						<input type="file" name="filename2" id="filename2"/></li>
			<li>
				<input type="submit" value="자료올리기"/>
				<input type="reset" value="취소"/>
			</li>
		</ul>
	</form>
</div>