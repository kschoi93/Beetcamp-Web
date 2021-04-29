/**
 * html문서를 파일읽기를 하여 웹페이지 쓰기
 * html을 읽되, 이미지가 있을경우 html에서는 자동으로 불러와주지만
 * node에서는 자동으로 불러와 주지 않기 때문에 이미지 파일이 읽힐 때, 
 * 해당 파일의 이미지 경로와 마임을 통해 mime을 통해 타입을 알아내서 파일을 읽어와야 한다.
 */
var http = require('http');
var fs = require('fs');
var mime = require('Mime');

var server = http.createServer((request,response)=>{
	//console.log("request.url===>"+request.url);
	var pathname = request.url;
	if(pathname=='/hello'){
		//비동기식으로 node12_hello.html을 파일읽기 하여 response에 쓰기
		fs.readFile(__dirname+"\\node12_hello.html",'utf-8', function(err, data) {
			if(err){
				console.log(err);
			}else{
				response.writeHead(200, {"Content-Type":"text/html; charset=utf-8;"});
				response.write(data);
				response.end();
				//console.log('데이터 읽기 -> 쓰기 성공');
			}
		});
							// image/CAM00228.jpg
	}else if(pathname.indexOf("/image")==0){// /image/이미지 파일명으로 접속
		
		//Mime --> getType( 경로와 파일명 ), mime  --> lookup(경로와 파일명)
		var imgPath = pathname.substring(1); //     image/CAM00228.jpg
		var mimeType = mime.getType(imgPath); 
		console.log(imgPath + "====>"+ mimeType);
		fs.readFile("../"+imgPath, (err,imgData) =>{
			if(err){//못읽었을때
				console.log(imgPath + '읽기 실패');
			}else{//읽었을때
				response.writeHead(200, {"Content-Type":mimeType});
				response.end(imgData);
			}
		});
		
	} else if(pathname=="/move"){
		fs.readFile(__dirname+"\\node12_hello_move.html","utf-8", (err,data)=>{
			if(err){
				console.log(err);
			}else{
				response.writeHead(200, {"Content-Type":"text/html; charset=utf-8;"});
				response.write(data);
				response.end();
				console.log('데이터 써졌나?');
				
			}
			
		})
	}else {
	
		response.writeHead(200, {"Content-Type":"text/html;charset=utf-8"});
		response.end("<h1>404 Error Page....</h1>");
	}
});

server.listen(13003, () => {
	console.log("server start ....... http://127.0.0.1/13003");
});