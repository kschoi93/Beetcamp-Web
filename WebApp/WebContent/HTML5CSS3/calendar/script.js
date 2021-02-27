var d = document;

/* 날짜 세팅 */
var dateTime = new Date();
var cal = "";
cal += dateTime.getFullYear()+"년 ";
cal += (dateTime.getMonth()+1)+"월 ";


/* 달력 레이아웃 */
d.write(
		"<div id='main'>"
			+"<div id='photo'>"
				+"<img src='img/calimg.jpg'/>"
			+"</div>"
			+"<div id='titleStr'></div>"
			+"<ul id='dayOfTheWeek'></ul>"
			+"<ul id='viewDate'></ul>"
	    +"</div>")

d.getElementById("titleStr").innerHTML = cal;


/* 달력 타이틀 */
var strArr = new Array('일','월','화','수','목','금','토');
var titleStr = '';
for(var i=0; i<strArr.length; i++){
	titleStr += "<li id='dotw'>"+strArr[i]+"</li>";
}
d.getElementById('dayOfTheWeek').innerHTML = titleStr;


/* 달력 날짜 */
var firstDate = new Date(dateTime.getFullYear(),dateTime.getMonth(),1);
var dateStr = '';
var dayNum = firstDate.getDay();
for(var i=0; i<dayNum; i++){
	dateStr += "<li id='dateNum'>"+""+"</li>";
}
d.getElementById('viewDate').innerHTML = dateStr;


/*                                          이번년도, 다음월의 0일을 세팅하면 전 월의 마지막 일자가 나온다 */
var lastDate = new Date(dateTime.getFullYear(), dateTime.getMonth()+1,0); 
var lastNum = lastDate.getDate();
var yearCheck = lastDate.getFullYear();
var monthCheck = lastDate.getMonth()+1;
for(var i=1; i<=lastNum; i++){
	/* 공휴일 표시 */
	if(yearCheck==2021 && monthCheck==2){/* 2월일 경우 공휴일 빨간색 */
		if(i==11||i==12||i==13){
			dateStr += "<li id='dateNum' style='color:red;'>"+ i +"</li>";
			continue;
		}
	} else if(yearCheck==2021 && monthCheck==3){/* 3월일 경우 공휴일 빨간색 */
		if(i==1){
			dateStr += "<li id='dateNum' style='color:red;'>"+ i +"</li>";
			continue;
		}
	}
	dateStr += "<li id='dateNum'>"+ i +"</li>";
}
d.getElementById('viewDate').innerHTML = dateStr;