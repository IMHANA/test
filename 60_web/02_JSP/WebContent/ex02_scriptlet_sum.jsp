<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>합계구하기</title>
</head>
<body>
	<h1>1부터 10까지의 합계 구하기</h1>
	<h3>출력형태 : 1+2+3+...+9+10=55</h3>
	<h3>1+2+3+...+9+10=
	<%
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		sum += i;
	}
	out.print(sum); //브라우저 화면에 출력
	%>
	</h3>
	<hr>
	<%-- 스크립트릿, out 객체를 사용해서 h3태그 출력
	<h3>출력형태 : 1+2+3+...+9+10=55</h3>
	<h3>1+2+3+4+5+6+7+8+9+10=55</h3>
	 --%>
	<hr>
	<%
		//(실습)<h3>1+2+3+4+5+6+7+8+9+10=55</h3>
			//반복문을 사용해서 문장 만들고 합계값 출력
		sum = 0;
		int first = 1;
		int last = 20;
		int step = 1;
		boolean isFirst = true;

		for (int i = first; i <= last; i += step) {
			if (isFirst) {
				out.print(i);
				isFirst = false;
			} else {
				out.print("+" + i);
			}
			sum += i;
		}
		out.print("=" + sum);
	%>

</body>
</html>