/**
 * http://127.0.0.1:15002/chatRoom
 */

var http = require('http');
var fs = require('fs');


var server = http.createServer( (request, response) => {
	if(request.url == "/chatRoom"){
		fs.readFile(__dirname+'\\chattingForm.html', function(err, data) {
			if(err){
				console.log('파일 불러오기 실패');
			} else {
				response.end(data);
			}
		});
		
	} else {
		response.end('<h1>404 Error Page</h1>');
	}
})

server.listen(15002, () => {
	console.log('server start http://127.0.0.1:15002/chatRoom');
})
/////////////////////////////////////////////////////////////////////////////
var socketio = require('socket.io');
var io = socketio.listen(server);

io.sockets.on('connection', (socket) =>{
	console.log('클라이언트 접속함 ..............');
	var userid = "";
	userid = socket.id;
	
	var roomName;
	socket.on('join', (data) =>{
		roomName = data;
		socket.join(roomName);
		console.log(roomName+"이 만들어졌습니다.");
	});
	
	socket.on('message',(msg) =>{
		//같은 방에 있는 접속자에게 받은 메시지 보내기
		io.sockets.in(roomName).emit('response',roomName+" 메시지 : "+msg);
	});
	
	
});