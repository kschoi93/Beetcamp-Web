/**
 * http://127.0.0.1:15005/home
 */

var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');
var mime = require('Mime');

var express = require('express');

// express 객체 생성
var app = express();

var server = http.createServer( app);

//서버 접속시 get방식으로 접속하면 get(), post 방식으로 접속하면 post() 함수를 사용한다.
app.get('/home',function(request, response){
	fs.readFile(__dirname+"\\home.html","utf-8", (error, data)=>{
		if(error){
			response.end('데이터 불러오기 실패');
			console.log('파일 불러오기 실패');
		} else{
			response.end(data);
		}
			
	});
});
//게시판 목록
app.get('/list',function(request, response){
	fs.readFile(__dirname+'\\boardList.ejs', function(error, data){
		if(!error){
			response.writeHead(200,{'Content-Type':'text/html; charset=utf-8'})
			response.end(data);
		}else{
			
		}
	})
});

//글쓰기 폼
app.get('/boardWrite',(req,res) => {
	fs.readFile(__dirname+"\\boardWrite.html", (error, data)=>{
		if(!error){
			res.writeHead(200, {"Content-Type":"text/html; charset=utf-8"});
			res.end(data);
		}
	})
})


server.listen(15005, () => {
	console.log('server start ........ http://127.0.0.1:15005/home');
});

var io = socketio.listen(server);

io.sockets.on('connection', (socket) => {
	console.log('클라이언트 접속함.......');
});