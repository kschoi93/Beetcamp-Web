<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bitcamp.board.BoardDAO"%>
<%@ page import="com.bitcamp.board.BoardVO"%>
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
	ul,li{margin:0;padding:0;list-style-type:none;}
	#boardList>li{
		float:left; width:10%; height:40px; line-height:40px; border-bottom:1px solid gray;
	}
	/* 제목 : 55% */
	#boardList>li:nth-child(5n+2){ /* 5의배수 + 2번째 */
		width:55%; white-space:nowrap;overflow:hidden; text-overflow:ellipsis;
	}
	/* 작성일 : 15% */
	#boardList>li:nth-child(5n+4){ /* 5의배수 + 4번째 */
		width:15%; 
	}
</style>
<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력후 검색하세요..");
				return false;
			}
			return true;
		})
	});
</script>
</head>
<body>
<%@ include file="../jsp04_include/jspf_header.jspf" %>
<%
	//총 레코드수
	BoardDAO dao = new BoardDAO();
	// 검색어 확인 
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
	
	System.out.println("searchKey -->"+ searchKey + ",  searchWord-->" + searchWord);

	int totalRecord = dao.totalRecord(searchKey,searchWord); // 총 레코드수
	int onePageRecord = 5; // 한페이지당 출력할 레코드 수
	int onePageSize = 5;// 한번에 표시할 페이지수 
	
	//현재 페이지 구하기
	String nowNumStr = request.getParameter("nowNum"); // null, page Number

	int nowNum = 1;
	if(nowNumStr !=null && !nowNumStr.equals("")){
		//전송받은 페이지 번호가 있다
		nowNum = Integer.parseInt(nowNumStr);
	}else {
		//전송받은 페이지 번호가 없다.
		nowNum = 1;
	}
	
	//총 페이지수 구하기
	int totalPage = (int)Math.ceil((int)totalRecord / (double)onePageRecord);
	
	//레코드 선택 (게시글 목록 구하기)			현재페이지, 한페이지당 출력할 레코드수, 총 레코드 수, 총 페이지 수 , <--검색어 선택해오기-->
	List<BoardVO> lst = dao.selectRecord(nowNum, onePageRecord, totalRecord, totalPage , searchKey, searchWord);
	  
%>
<div class="container">
	<h1>게시판목록</h1>
	<div>총 레코드 수 : <%=totalRecord %>, Pages : <%=nowNum %>/<%=totalPage %>Page</div>
	<ul id="boardList">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<% for(int i=0; i<lst.size();i++){
			BoardVO vo = lst.get(i);
		%>
			<li><%=vo.getNo() %></li>
			<li><a href="<%=request.getContextPath()%>/board/boardView.jsp?no=<%=vo.getNo()%>&nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>"><%=vo.getSubject() %></a></li>
			<li><%=vo.getUserid() %></li>
			<li><%=vo.getWritedate() %></li>
			<li><%=vo.getHit() %></li>
		<% }%>
	</ul>
	<div>
	<%
		//							object로 구해져서 타입캐스팅을 해줘야 한다
		String logStatus = (String)session.getAttribute("logStatus"); //Y, null,""	
		if(logStatus !=null && logStatus.equals("Y")){
		
	%>
		<a href="<%=request.getContextPath()%>/board/boardWriteForm.jsp">글쓰기</a>
	<%
		}
	%>
	</div>
	<div>
	<%
	// 페이지 정하기
	// ((현재 페이지-1) / 출력페이지수*출력페이지수)+1
		int startPage = ((nowNum-1) / onePageSize*onePageSize)+1;
		System.out.println("nowNum --> "+ (nowNum-1));
		System.out.println("onePageSize --> "+onePageSize);
		System.out.println("nowNum-1 / onpageSize*onepageSize -->"+ (nowNum-1) / onePageSize*onePageSize);
		
	%>
		<ul class="breadcrumb pagination-md">
			<!-- 페이지 이동에 따른 변화 jsp -->
			<% if(nowNum>1){ %>
				<li class="page-item"><a href="boardList.jsp?nowNum=<%=nowNum-1 %><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>" class="page-link">Prev</a></li>
			<% }else {%>
				<li class="page-item disabled"><a href="#" class="page-link">Prev</a></li>
			<% } 
			
			
				//페이지 번호
				for(int p=startPage; p<startPage+onePageSize; p++){
					if(p<=totalPage){
							if(nowNum==p){//현재 보고있는 페이지
					%>
						<li class="page-item active"><a href="boardList.jsp?nowNum=<%=p %><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>" class="page-link"><%=p %></a></li>			
					<% 		}else{
					%>
						<li class="page-item"><a href="boardList.jsp?nowNum=<%=p %><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>" class="page-link"><%=p %></a></li>	
						<%	}
					}/// totalPage
				}
				
				if(nowNum==totalPage){//마지막 페이지
				%>
					<li class="page-item disabled"><a href="#" class="page-link">next</a></li>
			<%} else { %>
					<li class="page-item"><a href="boardList.jsp?nowNum=<%=nowNum+1 %><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord="+searchWord);} %>" class="page-link">next</a></li>
			
			<%}  %>
		</ul>
	</div>
	<div>
		<form id="searchFrm" method="get" action="<%=request.getContextPath()%>/board/boardList.jsp" >
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="userid">작성자</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" name="Search...."/>
		</form>
	</div>
</div>
</body>
</html>