
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager"%>
<%!
	public Connection getConnection() {
		Connection con = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "c##scott", "tiger");
			}catch(Exception e){
				System.out.println("데이터베이스 로딩, 연결에러...>"+e.getMessage());

			}
			return con;
	}

%>
<%
	// Model1으로 로그인 하기
	// 1. 사용자 화면에서 입력된 아이디, 비밀번호 서버로 가져온다

	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	// DB를 조회 : select
	
	// 2. 드라이브로딩
	// 3. DB연결
	Connection conn = getConnection();
	
	// 4. PreparedStatement
	String sql = "select username, userid from register where userid=? and userpwd=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, userpwd);	
	
	ResultSet rs = pstmt.executeQuery();
	/*
	if(rs.next()){	// 로그인
		// 필요한 정보를 세션영역에 저장한다.
		// 				세션이란? 현재 사이트의 모든 영역에서 접근할 수 있는 데이터
		session.setAttribute("logId", rs.getString(2));
		session.setAttribute("logName", rs.getString(1));
		session.setAttribute("logStatus","Y");
		
		response.sendRedirect(request.getContextPath());	// /WebJSP
		
	}else{	// 로그인 실패
		response.sendRedirect(request.getContextPath()+"/login/login_form.html");
	}
*/
	if(rs.next()){	// 로그인 성공
		session.setAttribute("logId", rs.getString(2));
		session.setAttribute("logName", rs.getString(1));
		session.setAttribute("logStatus","Y");
		%>
			<script>
				alert("로그인 성공하였습니다... 홈페이지로 이동합니다.");
				location.href="<%=request.getContextPath()%>"; 
			</script>
		<%
	}else {	//로그인 실패
		%>
			<script>
				alert("로그인 실패하였습니다... 홈페이지로 이동합니다.");
				history.go(-1);	// history.back();
			</script>
		<%	
	}
%>
