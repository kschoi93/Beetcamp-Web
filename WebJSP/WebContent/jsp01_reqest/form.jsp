<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src= "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		$('frm').submit(function(){
			if($('username').val()==""){
				alert("이름을 입력하세요");
				return false;
			} 
			return true;
		});
	});
</script>
</head>
<body>
					<!--   post : 넘겨주는 값을 없애준다	action="?" : 물음표 뒤에는 고정출력해준다. -->
	<form id="frm" method="post" action="formOk.jsp?intro=jsp공부중">
		이름 : <input type="text" name="username" id="username"/><br/>
		연락처 : <input type="text" name="tel" id="tel"/><br/>
		주소 : <input type="text" name="addr" id="addr"/><br/>
		성별 : <input type="radio" name="gender" value="M" checked/>남
		      <input type="radio" name="gender" value="F"/>여<br/>
        관심분야 : <input type="checkbox" name="hobby" value="농구"/>농구
        	<input type="checkbox" name="hobby" value="배구"/>배구
        	<input type="checkbox" name="hobby" value="축구"/>축구
        	<input type="checkbox" name="hobby" value="탁구"/>탁구
        	<input type="checkbox" name="hobby" value="야구"/>야구
        	<input type="checkbox" name="hobby" value="족구"/>족구<br/>
        지역 : <select name="local" multiple size="5">
        	<option value="서울">서울</option>
        	<option value="경기">경기</option>
        	<option value="인천">인천</option>
        	<option value="대구">대구</option>
        	<option value="광주">광주</option>
        	</select>	<br/>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>