/**
 * http://127.0.0.1:15001/chat
 */

var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');

var server = http.createServer( (request,response) => {
	if(request.url == "/chat"){
		fs.readFile(__dirname+'\\chattingForm1.html','utf-8',(error, data) => {
			if(error){
				response.writeHead(200, {"Content-Type":"text/html; charset=utf-8"});
				response.end('File Read Error');
			} else{
				response.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
				response.end(data);
			}
		});
	} else {
		response.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
		response.end('<h1>404 page error...</h1>');
	}
});

server.listen(15001, () => {
	console.log('server start http://127.0.0.1:15001/chat');
});

var io = socketio.listen(server);
// 접속을 기다리는 이벤트

io.sockets.on('connection',(socket) => {
	console.log('클라이언트가 접속함......');
	console.log('socketId--->', socket.id);
	
	var clientId = "";
	clientId = socket.id; // 통신할 접속자의 id를 전역변수에 보관한다.
	socket.on('hello', (data) =>{
		console.log(data);
		
		io.sockets.in(clientId).emit('echo', "server에서 반환된 클라이언트 아이디, 내용 id = ( " + clientId +" ) , 내용 : "+ data);
	})
	
});