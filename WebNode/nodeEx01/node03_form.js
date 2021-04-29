//1. 객체생성
var http = require('http');

var server = http.createServer((request,response) => {
	response.writeHead(200,{"Content-Type":"text/html; charset=utf-8"});
	response.write("<h1>폼을 이용한 Post 데이터 전송");
	response.write("<form method='post' action='http://localhost:10004'>");
	response.write("이름 : <input type='text' name='username' /><br/>");
	response.write("연락처 : <input type='text' name='tel' /><br/>");
	response.write("<input type='submit' value='서버에 접속하기' />");
	response.end("</form>");
});

server.listen(10003,() => {
	console.log('server start...... http://127.0.0.1:10003');
});