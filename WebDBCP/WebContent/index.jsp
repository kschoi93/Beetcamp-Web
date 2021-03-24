<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//1. DB연결, 현재 tomcat localhost2 server에서는 db연결이 되어 있다.
	// 수많은 연결선중 하나를 가져오는 작업을 한다.
	
	// context 객체생성
	Context ctx = new InitialContext();
	Context envCtx = (Context)ctx.lookup("java:comp/env");
	// datasourse 객체 -> 객체 이름은 META-INF context.xml에 임의로 만든 name을 사용한다
	DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
	
	Connection conn = ds.getConnection();
	
	String sql = "select no, subject, userid, hit, writedate from board order by no desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	
%>
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
	li{float:left; height:40px; line-height:40px;width:10%;}
	li:nth-child(5n+2){width:60%}
	
	.wordCut{white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;}
</style>
</head>
<body>
<div class="container">
	<h1>게시판 목록</h1>
	<ul>
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>등록일</li>
		<%while(rs.next()){ %>
		<li><%=rs.getInt(1) %></li>
		<li class="wordCut"><%=rs.getString(2) %></li>
		<li><%=rs.getString(3) %></li>
		<li><%=rs.getInt(4) %></li>
		<li class="wordCut"><%=rs.getString(5) %></li>
		<% }
		try{
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e){
			System.out.println("db 종료 실패"+e.getMessage());
		}
		%>
	</ul>
</div>
</body>
</html>


<!-- 
	DBCP(커넥션 풀:DataBase Connection Pooling services) : 여러개의 회선을 연결해 놓고 대기하다가 필요한 만큼 사용하는것
	
	1) 프레임 워크 준비하기
		http://commons.apache.org
		1. dbcp
		2. releases download로 이동
		3. binaries zip file download - commons-dbcp2-2.8.0-bin.zip
		
		4. collections
		5. releases download
		6. binaries zip file download - commons-collections4-4.4-bin.zip
		
		7. pool
		8. releases download
		9. releases download page
		10. binaries zip file download - commons-pool2-2.9.0-bin.zip
	
	2) oracle.com에서 ojdbc8.jar를 다운로드
	
	
	3) 이클립스의 WEB-INF/lib 폴더로 복사 붙여넣기, 톰캣의 lib에 복사 붙여넣기
		commons-dbcp2-2.8.0.jar
		commons-collections4-4.4.jar
		commons-pool2-2.9.0.jar
	
	4) 환경변수에 CLASSPATH설정
		ojdbc8.jar
		commons-dbcp2-2.8.0.jar
		commons-collections4-4.4.jar
		commons-pool2-2.9.0.jar
		
		.;%JAVA_HOME%\lib\tools.jar;%CATALINA_HOME%\lib\ojdbc8.jar;%CATALINA_HOME%\lib\commons-pool2-2.9.0.jar;%CATALINA_HOME%\lib\commons-dbcp2-2.8.0.jar;%CATALINA_HOME%\lib\commons-collections4-4.4.jar;
		
	5) 톰캣서버의 conf/server.xml의 <GlobalNamingResources>사이에 저장
    	name="jdbc/myoracle"
    	auth="container"
    	type="javax.sql.DataSource"
    	driverClassName="oracle.jdbc.driver.OracleDriver"
    	url="jdbc:oracle:thin"@localhost:1521:xe"
    	username="c##scott"
    	password="tiger"
    	maxActive="20"
    	maxIdle="10"
    	maxWait="-1"/>
    	
   	6) 톰캣서버의 conf/context.xml 파일에 추가하기
   	
   		<Context reloadable="true">
		<ResourceLink
			global="jdbc/myoracle"
			name="jdbc/myoracle"
			type="javax.sql.OracleDataSource"
		/>
		
	7) 이클립스의 WEB-INF/web.xml파일의 <web-app> 태그에 추가
		<resource-ref>
			<description>Oracle Datasource example</description>
			<res-ref-name>jdbc/myoracle</res-ref-name>
			<res-type>javax.sql.DataSource</res-type>
			<res-auth>Container</res-auth>
		</resource-ref>
	8) 톰캣서버에 conf/context.xml파일을 이클립스의 META-INF에 복사하고 추가한다.
		   
		<Resource
    	name="jdbc/myoracle"
    	auth="container"
    	type="javax.sql.DataSource"
    	driverClassName="oracle.jdbc.driver.OracleDriver"
    	url="jdbc:oracle:thin:@localhost:1521:xe"
    	username="c##scott"
    	password="tiger"
    	maxActive="20"
    	maxIdle="10"
    	maxWait="-1" /> 
		
		
		DBCP를 사용하는 이유?
		JDBC를 사용할 경우 DB 연결시마다 Driver를 로드하고 커넥션 객체를 얻는 반복작업을 한다.
		이러한 불필요한 반복을 효율적으로 처리하는 역할이 DBCP로서 WAS 웹 앱 서버 실행시 미리 일정량의 DB Connection객체를 생성하고 pool 이라는 공간에 저장하고
		DB 연결 요청시 가져다 쓰고 반환한다
		maxActive : 동시에 사용할 수 있는 최대 커넥션 갯수
		maxIdle : 커넥션풀을 반납시 최대로 유지될 수 있는 커넥션 갯수
		minIdle : 최손하으로 유지하는 커넥션 풀 갯수
		
 -->