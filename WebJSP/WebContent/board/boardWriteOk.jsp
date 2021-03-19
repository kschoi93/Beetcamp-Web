<%@page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시판 입력폼에 입력한 데이터를 DB에 넣는다 -->
<!-- 액션 useBean 폼데이타 request + vo에 담는다. 기준은 폼의 name속성의 값과 vo에 있는 멤버 변수명이 같은 데이터를 담는다-->

<!-- 

	BoardVO vo = new BoardVO();
													생명주기 : request page, session, application
-->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.bitcamp.board.BoardVO" scope="page"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>

<%
	//session의 글쓴이 아이디를 vo에 대입한다
	vo.setUserid((String)session.getAttribute("logId"));
	//글쓴이 컴 아이피
	vo.setIp(request.getRemoteAddr());
	
	BoardDAO dao = new BoardDAO();
	int result = dao.insertBoard(vo);
	
	if(result>0){// 글 등록
		response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
	} else {
		%>
		<script>
			alert("글등록이 실패하였습니다.");
			history.back(); // history.해(-1)
			
		</script>
		<%
	}
%>