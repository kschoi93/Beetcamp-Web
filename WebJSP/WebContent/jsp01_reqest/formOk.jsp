<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays, java.util.Enumeration" %>
    <%
    
    String username = request.getParameter("username");
    String tel = request.getParameter("tel");
    String addr = request.getParameter("addr");
    String gender = request.getParameter("gender");
    
    String[] hobby = request.getParameterValues("hobby"); // 다중선택은 배열로 가져와야한다.
    String[] local = request.getParameterValues("local");
    
    String intro = request.getParameter("intro");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%=username %><br/>
연락처 : <%=tel %><br/>
주소 : <%=addr %><br/>
성별 : <%=gender %><br/>
관심분야 : <%=Arrays.toString(hobby) %><br>
지역 : 
<% 
for(int i=0; i<local.length; i++){
	out.write(local[i]+", ");
}

%><br/>
intro : <%=intro %>
<hr/>




<h1>이전 페이지의 parameter 이름을 얻을 수 있다.</h1>
<ol>
<%
	Enumeration<String> e = request.getParameterNames();
	while(e.hasMoreElements()){
		out.write("<li>"+e.nextElement()+"</li>");
	}
%>
</ol>
<ol>
<%
	Enumeration<String> e2 = request.getParameterNames();
	while(e2.hasMoreElements()){ %>
		<li><%=e2.nextElement() %></li>
	<% 
	}
%>
</ol>
</body>
</html>





















