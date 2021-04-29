/**
 * 파일입력 : fs(FileSystem)
 */
//1. 모듈객체 : file 입력
var fs = require('fs');

//1) 비동기식으로 파일 내용을 읽어오는 방법 : 읽기, 쓰기를 바로 실행하지 않고 쓰레드 처리
//   fs.resdFile(파일명, 한글 인코딩, 콜백함수);					에러정보, 파일에서 읽은 내용 저장된곳
fs.readFile(__dirname+"\\node01_server.js", 'utf-8', function(error, data){
	//파일을 모두 읽은 후 실행되는 곳
	console.log("비동기식 파일입력 결과 -->\n"+ data);
});

//2) 동기식으로 파일의 내용을 읽어 오는 방법 : 읽기, 쓰기가 명령어를 만나면 바로 처리된다.   
//   fs.readFileSync(파일명, 한글 인코딩)
var dataSync = fs.readFileSync(__dirname+"\\node02_request_get.js", 'utf-8');
	console.log("2) 동기식 파일 입력결과 -->\n"+dataSync);

	
//실행결과
// 비동기식보다 동기식이 먼저 실행된다.