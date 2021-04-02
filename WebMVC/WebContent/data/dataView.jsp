<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#dataView{padding:20px 10px; border-bottom:1px solid #ddd;}
	#dataView>li{padding:10px}
	#dataView>li:nth-of-type(6){height:150px;overflow:auto;}
</style>
<script>
	$(function(){
		$("#dataView a").click(function(){
			var params = "no="+${vo.no};
			
			$.ajax({
				url : '/WebMVC/data/downcount.do'
				, data : params
				, success: function(result){
					var arr = result.split("<hr class='down'/>");
					$("span").text(arr[1].trim());
				}
				, error : function(){
					console.log("downcount error..............");
				}
			
			});
		});
	});
	function delCheck(){
		if(confirm("글을 삭제하시겠습니까?")){
			location.href="<%=request.getContextPath()%>/data/dataDel.do?no=${vo.no}";
		}
	}
</script>
<div class="container">
	<h1>자료실 글내용보기</h1>
	<ul id="dataView">
		<li>번호 : ${vo.no }</li>
		<li>작성자 : ${vo.userid }, 조회수 : ${vo.hit }, 다운로드 횟수 : <span>${vo.downCount }</span> </li>
		<li>작성일 : ${vo.writedate }</li>
		<li>제목 : ${vo.title }</li>
		<li>글내용</li>
		<li>${vo.content }</li>
		<li>첨부파일 : <a href="<%=request.getContextPath() %>/upload/${vo.filename1}" download>${vo.filename1 }</a>
			<c:if test="${ vo.filename2!=null && vo.filename2!=''}">
			, <a href="<%=request.getContextPath() %>/upload/${vo.filename2}" download>${vo.filename2 }</a>
			</c:if>
		</li>	
	</ul>
	<div>
		<c:if test="${userid==vo.userid}">
			<a href="<%=request.getContextPath()%>/data/dataEdit.do?no=${vo.no}">수정</a>
			<a href="javascript:delCheck()">삭제</a>
		</c:if>
	</div>
</div>