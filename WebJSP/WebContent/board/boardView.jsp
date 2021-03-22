<%@ page import="com.bitcamp.board.BoardVO"%>
<%@ page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=dvice-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
	li{border-bottom:1px solid gray;}
</style>

</head>
<body>
<div class="container">
	<%@ include file="../jsp04_include/jspf_header.jspf"%>
	<%
		int no = Integer.parseInt(request.getParameter("no")); // 레코드번호
		int nowNum = Integer.parseInt(request.getParameter("nowNum"));//페이지 번호
		String searchKey = request.getParameter("searchKey");//검색키
		String searchWord = request.getParameter("searchWord");//검색어
		
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = dao.getOneSelect(no,1);
		
	%>
	<div>
		<h1>글내용보기</h1>
		<ul>
			<li> 번호 : <%=vo.getNo() %></li>
			<li> 작성자 : <%=vo.getUserid() %></li>
			<li> 등록일 : <%=vo.getWritedate() %></li>
			<li> 조회수 : <%=vo.getHit() %></li>
			<li> 글제목 : <%=vo.getSubject() %></li>
			<li> 글내용 <br/>
				<%=vo.getContent() %></li>
		</ul>
		<div>
			<a href="boardList.jsp?nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>">리스트</a>
			
			<% 
				// 글쓴이와 로그인 아이디가 같으면 수정, 삭제 가능
				if(vo.getUserid().equals((String)session.getAttribute("logId"))){ %>
					<a href="<%=request.getContextPath()%>/board/boardEditeForm.jsp?no=<%=vo.getNo()%>&nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);}%>">수정</a>
					<a href="javascript:delCheck()">삭제</a>
					
					<script>
						function delCheck(){
							if(confirm("삭제하시겠습니까?")){ // yes(true) or no(false)로 선택가능
								location.href="<%=request.getContextPath()%>/board/delOk.jsp?no=<%=vo.getNo()%>&nowNum=<%=nowNum%><%if(searchWord!=null&&!searchWord.equals("")){out.write("&searchWord="+searchWord+"&searchKey="+searchKey);}%>";
							}
						}
					</script>
				
				<% } %>
		</div>
	</div>
</div>
</body>
</html>