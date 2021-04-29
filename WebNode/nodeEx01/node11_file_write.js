/**
 * 파일쓰기 : fs 모듈 이용한다.
 */
var fs = require('fs');

//1. 저장할 데이터
var txt = "텍의 코로나19 자가진단키트가 \r\n미국 FDA의 긴급사용 승인을 받았습니다.\r\n";
	txt += "수젠텍은 손끝을 찔러 나온 피를 이용해 \r\n스스로 코로나19 검사를 할 수 있는 코로나19 신속항체 자가 진단키트가 미 FDA 긴급사용승인을 받았다고 밝혔습니다.\r\n";
	txt += "이번에 승인된 자가 진단키트는 \r\n미국 소형 병원과 약국 등에서 사용할 수 있습니다.\r\n";
	
//비동기식으로 파일 쓰기 : 스레드 구현
// writeFile(파일명, 작성할 내용, 인코딩, 콜백함수)
fs.writeFile(__dirname+"\\fileWrite_async.txt",txt,'utf-8', (error)=>{
	if(error){ // error메시지가 있으면 true
		console.log(error);
	}else { // null이면 false
		console.log('파일 쓰기 성공!');
	}
});

// 2. 동기식으로 파일 쓰기 : 명령어를 바로실행
//						콜백 함수가 없어서 예외처리를 한다.
//   writeFileSync(파일명, 내용, 인코딩)
try{
	fs.writeFileSync(__dirname+"\\filewriteSync.txt",txt,'utf-8');
	console.log("동기식 파일쓰기 완료...");
}catch(e){
	console.log("동기식 파일쓰기 에러!");
}