<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>서버로부터 응답 받은 결과</h1>
<script>
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	
	// readyState 상태가 변할 때 실행할 콜백함수 작성
	request.onreadystatechange = requestAjax;
	
	//2. open("전송방식", "요청정보", "비동기여부")
	request.open("GET", "data.xml", false);
	
	//3. send() : 실행
	request.send();
	
	function requestAjax() {
		if (request.readyState == 4 && request.status == 200) {
			//4. 응답데이터 처리
			var xml = request.responseXML;
			
			//XML에서 데이터 추출
			var names = xml.getElementsByTagName("name");
			//"name"값을 태그이름으로 찾기 - name태그를 찾아서 배열에 저장이 되는 것임
			var prices = xml.getElementsByTagName("price");
			//"price"값을 태그이름으로 찾기 - price태그를 찾아서 배열에 저장이 되는 것임
			
			//데이터 사용
			let output = "";
			for (let i=0; i<names.length; i++) {
				console.log("name : " + names[i] + ", price : " + prices[i]);
				let name = names[i].childNodes[0].nodeValue;
				let price = prices[i].childNodes[0].nodeValue;
								
				output += "<h2>" + name + " : " + price + "</h2>";
			}
			
			document.body.innerHTML += output;
		}
	}
	
</script>
</body>
</html>







