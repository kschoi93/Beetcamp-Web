<%@page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 

	int nowNum = Integer.parseInt(request.getParameter("nowNum"));
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
%>
<jsp:useBean id="vo" class="com.bitcamp.board.BoardVO" scope="page"/>
<jsp:setProperty name="vo" property="*"/>

<%
	vo.setUserid((String)session.getAttribute("logId"));

	BoardDAO dao = new BoardDAO();
	int result = dao.boardEditOk(vo);
	
	if(result >0){//수정시
		String url = request.getContextPath()+"/board/boardView.jsp?no="+vo.getNo()+"&nowNum="+nowNum;
		if(searchWord!=null && !searchWord.equals("")){
			url += "&searchKey="+searchKey+"&searchWord="+searchWord;
			System.out.println("test");
		}
		%>
		<script>
			location.href="<%=url%>";
		</script>
		<%
	} else {//수정 실패시
		%>
		<script>
			alert("글수정 실패하였습니다.");
			history.back();
		</script>
		<%
	}

%>