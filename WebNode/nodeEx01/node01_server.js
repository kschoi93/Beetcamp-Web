/** === 준비사항 ===
 	1. nodejs.org에서 다운로드 후 설치
	2. 이클립스에서 help -> eclipse-marketplace
	   search : node 
	   Enide.p2f install
 */

//1. http모듈 --> http 모듈을 객체로 만든 후 서버를 생성한다.
//			  requir() 함수는 모듈을 객체로 만드는 함수다
var http = require('http');

//2. 서버생성하기 - http 객체를 이용하여 생성한다.
var server = http.createServer(( request, response )=>{
		//1. 클라이언트 서버에 접속하면 실행할 실행문을 기술하는 곳이다.
		
		//2. 서버에서 클라이언트에 데이터 정보를 보내는 것은 response 객체를 이용한다.
		// 노드의 구성 head, body, end
		//  1) Header 세팅 
		response.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
		//  2) 클라이언트에게 보낼 페이지 내용 
		response.write('<h1>노드js 서버에서 보낸 정보</h1>');
		response.write('<ul><li>첫번째 데이터</li>');
		response.write('<li>두번째 데이터</li></ul>');
		//  3) 마지막 전송 데이터 표시
		response.end('<h2>마지막으로 보낸 문자</h2>');
	});
	
//3. 접속대기 - 클라이언트가 서버에 접속하기를 기다린다.
			//현재서버의 접속 포트 -> 2^16 
server.listen(10001,()=>{
	console.log("server is running : http://127.0.0.1:10001");
	console.log("server is running : http://localhost:10001");
});