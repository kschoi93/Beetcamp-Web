/**
 * http://usejsdoc.org/
 */

var http = require('http');
var querystring = require('querystring');
var url = require('url');
var total = require("./node05_Ex_function");


var server = http.createServer((request,response) =>{
		var parsedUrl = url.parse(request.url);
		var parsedQuery = querystring.parse(parsedUrl.query,"&","=");
		console.log(parsedUrl);
		console.log(parsedQuery.num);
		response.writeHead(200, {"Content-Type":"text/html; charset=utf-8;"});
		response.write("1. "+ total.oddSum(parsedQuery.num)+"<br/>");
		response.write("2. "+ total.evenSum(parsedQuery.num)+"<br/>");
		response.write("3. "+ total.sum(parsedQuery.num)+"<br/>");
		response.end();
});

server.listen(12004,function(){
	console.log("계산한 값 가져오기");
});