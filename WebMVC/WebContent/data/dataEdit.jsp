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
			
			
			return true;
		});
		
		//첨부파일 삭제/////////////
		$(document).on('click','b.f',function(){
			$(this).parent().css("display","none");
			$(this).parent().next().prop("type","file");
			
			//삭제한 파일명이 있는 객체를 name설정
			$(this).parent().next().next().attr("name","delfile");
		});
		
	});
</script>
<div class="container">
	<h1>자료실 글 올리기</h1>																	<!-- 파일 업로드 일경우 반드시 enctype 속성이 있어야 한다 -->							
	<form method="post" action="<%=request.getContextPath()%>/data/dataEditOk.do" id="dataFrm" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${vo.no }"/>
		<ul>
			<li>제목 : <input type="text" name="title" id="title" size="50" value="${vo.title }"/></li>
			<li>
				<textarea name="content" id="content">${vo.content }</textarea>
			</li>
			<!-- 첫번째 첨부파일 : vo.filename -->
			<li>첨부파일 : <br/>
				<div>${vo.filename1} <b class="f">X</b></div>
				<input type="hidden" name="filename1" id="filename1"/>
				<input type="hidden" name="" id="delfile1" value="${vo.filename1}"/>
			</li>
			<!-- 두번째 첨부파일 : vo.filename2, vo.filename[1] -->
			<c:if test="${vo.filename2!=null && vo.filename2!=''}">
				<li>
					<div>${vo.filename2} <b class="f">X</b></div>
					<input type="hidden" name="filename2" id="filename2"/>
					<input type="hidden" name="" id="delfile2" value="${vo.filename2}"/>
				</li>
			</c:if>
			<c:if test="${vo.filename2==null || vo.filename2==''}">
				<input type="file" id="filename2" name="filename2"/>
			</c:if>
			
			<li>
				<input type="submit" value="자료수정"/>
				<input type="reset" value="취소"/>
			</li>
		</ul>
	</form>
</div>