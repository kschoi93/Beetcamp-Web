var http = require('http');
var querystring = require('querystring');
var server = http.createServer((request,response)=>{
	// 1. 포스트 방식의 데이터가 서버로 전송되면 data 이벤트가 발생한다.
	var postData = "";
	request.on('data',function(data){
		postData += data;
	});
	// 2. 데이터 이벤트가 전송이 종료되면(끝나면) 자동으로 end 이벤트가 발생한다.
	request.on('end', function(){
		// post로 전송된 postData의 값을 json으로 변환하여 사용한다.
		var parseQuery = querystring.parse(postData);
		response.writeHead(200, {"Content-Type":"text/html; charset=utf-8"});
		response.write('이름:' + parseQuery.username+"<br/>");
		response.end('연락처:' + parseQuery.tel+"<br/>");
	});
	
});

server.listen(10004,()=>{
	console.log('server start ......     http://127.0.0.1:10004')
});