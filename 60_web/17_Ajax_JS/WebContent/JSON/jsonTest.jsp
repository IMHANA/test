<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ajax JSON</title>
</head>
<body>
	<h1>JSON서버로부터 응답받은 결과</h1>
<script>
	/* XMLHttpRequest.readyState : 데이터를 전달했을때 결과 상태를 표시
	0 : 객체 생성되있고, open은 안한 상태
	1 : open은 되어있고, send는 안된 상태
	2 : send를 진행한 상태지만, 데이터가 발견되지 않은 상태
	3 : 일부 데이터만 받은 상태 (데이터를 받는 중)
	4 : 데이터를 전부 응답받은 상태
	
	XMLHttpRequest.status : 응답 결과 상태값
	200(성공), 4xx(클라이언트 오류), 5xx(서버측 오류 - 개발자 실수)
	********************************/
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	// readyState 상태가 변할 때 실행할 콜백함수 작성
	request.onreadystatechange = requestAjax;
	
	//2. open("전송방식", "요청정보", "비동기여부")
	request.open("GET", "data.json", false);
	
	//3. send() : 실행
	request.send();
	
	function requestAjax() {
		if (request.readyState == 4 && request.status == 200) {
			//받은 데이터 확인
			alert("request.responseText : " + request.responseText);
			
			//문자열 -> JS객체화 : JSON.parse()사용
			var json = JSON.parse(request.responseText);
			alert("JSON.parse() 처리후 : " + json);
			
			//JS 객체 데이터 추출
			var output = "";
			for (let i=0; i<json.length; i++) {
				output += "<h2>";
				output += json[i].name + " : " + json[i]["price"];
				output += "</h2>";
			}
			
			//4. 응답데이터 처리
			document.body.innerHTML += output;
			
			
		}
	}
	
</script>
	
</body>
</html>