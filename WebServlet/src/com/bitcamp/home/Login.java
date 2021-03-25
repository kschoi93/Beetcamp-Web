package com.bitcamp.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><head><title>로그인</title></head>"
				+ "<body>"
				+ "<h1>로그인폼</h1>"
				+ "<form method='post' action='Login.do'>"
				+ "아이디 : <input type ='text' name='userid'/><br/>"
				+ "비밀번호 : <input type ='password' name='userpwd'/><br/>"
				+ "<input type='submit' value='로그인'/>"
				+ "</form>"
				+ "</body></html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			//로그인 : DB검색
		 try {
			//1. 드라이브 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. 디비연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url,"c##scott","tiger");
			
			//아이디, 비밀번호 가져오기
			String userid = request.getParameter("userid");
			String userpwd = request.getParameter("userpwd");
			
			//3. PreparedStatement
			pstmt = conn.prepareStatement("select userid, username from register where userid=? and userpwd=?");
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			//4. 실행
			rs = pstmt.executeQuery();
			
			//결과 알려줌
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			if(rs.next()) {//로그인 성공시
				HttpSession session= request.getSession();
				session.setAttribute("logId", rs.getString(1));
				session.setAttribute("logName",rs.getString(2));
				
				pw.println("<script>"
						+ "alert('로그인 성공하였습니다.');"
						+ "location.href='test.do';"
						+ "</script>");
			}else {//로그인 실패시
				pw.println("<script>alert('로그인 실패하였습니다.다시 로그인하세요....');"
						+ "history.back();"
						+ "</script>");
			}
			
			//폼의 정보 가져오기
			//결과 알려줌(client에게)
		 }catch(Exception e) {
			 System.out.println("로그인 에러"+e.getMessage());
		 }finally {
			 //5. db닫기 
			 try {
				 if(rs!=null)rs.close();
				 if(pstmt!=null)pstmt.close();
				 if(conn!=null)conn.close();
			 } catch(Exception e) {
				 System.out.println("db닫기 에러--->"+e.getMessage());
			 }
		 }
	}
}
