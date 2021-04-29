exports.oddSum = (num)=>{
	let result = 0;
	for(i = 1; i<=num; i+=2 ){
		result += i;
	}
	let txt = "1 ~ " + num + "까지의 홀수의 합 = " + result;
	return txt;
}

exports.evenSum = (num)=>{
	let result = 0;
	for(i = 0; i<=num; i+=2 ){
		result += i;
	}
	let txt = "1 ~ " + num + "까지의 짝수의 합 = " + result;
	return txt;
}

exports.sum = (num)=>{
	let result = 0;
	for(i = 0; i<=num; i++){
		result += i;
	}
	let txt = "1 ~ " + num + "까지의 합 = " + result;
	return txt;
}