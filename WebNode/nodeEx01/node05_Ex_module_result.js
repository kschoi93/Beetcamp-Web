/**
 * http://usejsdoc.org/
 */

var http = require('http');
var querystring = require('querystring');
var total = require("./node05_Ex_function");


var server = http.createServer((request,response) =>{
	//데이터가 전송되면 데이터를 누적시킬 변수선언
	var postData ="";
	//post 방식으로 데이터 전송되면 발생하는 이벤트 (자동으로 data 이벤트가 발생한다)
	request.on('data',(data)=>{
		postData += data;
	});
	//post 방식 데이터 전송이 완료되면 발생하는 이벤트(자동으로 end이벤트가 발생한다)
	request.on('end',()=>{
		var jsonData = querystring.parse(postData);
		console.log(jsonData);
		
		response.writeHead(200, {"Content-Type":"text/html; charset=utf-8;"});
		response.write("1. "+ total.oddSum(jsonData.num)+"<br/>");
		response.write("2. "+ total.evenSum(jsonData.num)+"<br/>");
		response.write("3. "+ total.sum(jsonData.num)+"<br/>");
		response.end();
	});
});

server.listen(12003,function(){
	console.log("계산한 값 가져오기");
});