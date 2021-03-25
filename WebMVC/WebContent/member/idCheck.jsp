<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		$('#setId').click(function(){
			//opener : 현재 윈도우를 열어준 객체 
			opener.document.getElementById("userid").value = $('#checkId').text();
			self.close(); // window.close();
			opener.document.getElementById("hiddenCheck").value = "Y";
		});
		$('#frm').submit(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력후 중복검사하세요..");
			}
		})
	})
</script>
<style>
	#menu, footer{display:none}
</style>
<div>
	<c:if test="${ !checkResult }"> <!--  // true일때 -->
		<span style="color:red" id="checkId">${userid }</span>은 사용 가능한 아이디입니다.
		<input type="button" value="아이디사용하기" id="setId"/>
	</c:if>
	<c:if test="${ checkResult }">
		<span>${userid }</span>은 사용 불가능한 아이디입니다.
	</c:if>
<hr/>
	<h3>아이디를 입력후 중복검사 버튼을 누르세요</h3>
	<form method="post" id="frm" action="<%=request.getContextPath() %>/member/idCheck.do">
		아이디 : <input type="text" name="userid" id="userid"/>
		<input type="submit" value="아이디중복검사"/>
	</form>

</div>