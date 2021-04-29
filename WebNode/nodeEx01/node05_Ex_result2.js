/**
 * http://usejsdoc.org/
 */
var http = require('http');
var module = require('./node05_Ex_function');
var url = require('url');
var server = http.createServer(function(request,response){
	
	response.writeHead(200, {"Content-Type":"text/html; charset=utf-8;"});
	//response.write("<ol><li>"+ module.oddSum(50)+"</li>");
	//response.write("<li>"+module.evenSum(50)+"</li>");
	//response.write("<li>"+module.sum(50)+"</li></ol>");
	
	
	response.write("<h1>form을 이용한 모듈사용하기 </h1>");
	response.write("<form method='get' action='http://127.0.0.1:12004/'>");
	response.write("수입력 : <input type='text' name='num'/>");
	response.write("<input type='submit' value='합계산하기'/>");
	
	
	response.write("</form>");
	
});

server.listen(12002, function(){
	console.log("합을 구하라");
});