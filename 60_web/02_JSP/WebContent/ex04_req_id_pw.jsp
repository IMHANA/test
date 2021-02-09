<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP id, pw</title>
<script>
	function send_go(form) {
		alert("전달받은 객체 : " + form);
		console.log(form);
		frm.action = "ex04_resp.jsp";
		frm.submit(); //서버로 전송
	}
</script>
</head>
<body>
	<%-- JSP 요청페이지에서 응답페이지로 이동 --%>
	<h2>(요청)ID, PW 값 서버측으로 전달</h2>
	<form>
		<p>ID: <input type="text" name="id"></p>
		<p>PW: <input type="password" name="pw"></p>
		<input type="button" value="전송(다른페이지로 이동)"
			onclick="send_go(this.form)">
	</form>
</body>
</html>