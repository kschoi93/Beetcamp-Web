/**
 * http://127.0.0.1:14002/chatForm
 */

var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request,response){
	var mapping = request.url;
	//console.log(mapping);
	if(mapping=="/chatForm"){
		fs.readFile(__dirname+'/chattingForm1.html', 'utf-8', function(err, data) {
			//console.log('test');
			if(err){
				console.log('파일 불러오기 실패');
			} else {
				response.end(data);
			}
		});
	} else {
		response.end('<h1>404 Error Page.......</h1>');
	}
});

server.listen(14200, ()=>{
	console.log('http://127.0.0.1:14002/chatForm 실행 ......')
});


///////////////////////////////// socket.io ///////////////////////////////////
var socketio = require('socket.io');
//1) 서버를 이용하여 소켓서버를 생성 및 실행
var io = socketio.listen(server);

//2) 클라이언트가 서버에 접속하면 받을 이벤트를 생성한다.
//				이벤트 종류
io.sockets.on('connection', (socket) => {
	console.log('Client가 접속하였습니다........');
	
	//클라이언트와 통신할 에빈트를 생성
	socket.on('hello', function(data){
		console.log("Server가 받은 메세지 : ",data);
		
		//[1]클라이언트에게 서버가 문자 보내기 이벤트 발생....
		socket.emit('echo', data+' (Welcome...)');
	});
});