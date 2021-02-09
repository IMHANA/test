<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
<script>
	function list_go() {
		location.href = "list.jsp";
	}
	function sendData() {
		//alert(">>sendData() 시작");
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {	//값이 입력되었는지 확인
			console.log(firstForm.elements[i] );
			<%--if (i == 3) continue;	// file은 옵션이므로 제외. 이 포문은 여기있어도, 밑에있어도 됨 --%>
			if (firstForm.elements[i].value.trim() == "") {	//값이 빈 문자열인지 확인 (length로 확인해도됨)
				if (i == 3) continue;	//file란에는 값이 없어도 계속 진행해라
				alert(firstForm.elements[i].title + "입력하세요");	//빈 문자열이면 값 입력하라고 하기
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
</script>
</head>
<body>

<div id="bbs">
<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
	<table>
		<caption>게시판 글쓰기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" size="12" title="작성자">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="file_name">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="pwd" size="12" title="password">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="sendData()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

</div>

	
</body>
</html>