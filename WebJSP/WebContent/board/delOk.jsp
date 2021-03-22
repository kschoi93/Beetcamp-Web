<%@page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int nowNum = Integer.parseInt( request.getParameter("nowNum"));
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
	
	
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteRecord(no,(String)session.getAttribute("logId"));
	
	if(result>0){//삭제완료
		//리스트로 보낸다
		%>
		<script>
			location.href="<%=request.getContextPath()%>/board/boardList.jsp?nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchWord="+searchWord+"&searchKey="+searchKey);}%>";
		</script>
		<%
	} else {//삭제실패시 글내용보기
		%>
		<script>
			history.back();
		</script>
		<%
	}
%>
