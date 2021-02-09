<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>작업선택</title>
<script>
	function all_search(frm) {
		//frm.action = "list.jsp"; //예전 jsp 직접 호출방식
		//frm.action = "list";	// list 요청 ! 여기서 요청하는거네?
		frm.action = "controller?type=all"	//요청명은 controller 타입은 all. 타입갖고 분기처리할것임
		frm.submit();
	}
	function dept_search(frm) {
		//frm.action = "dept.jsp"; //예전 jsp 직접 호출방식
		//frm.action = "dept";
		frm.action = "controller?type=dept"
		frm.submit();
	}
	
	function fullname_search(frm) {
		//frm.action = "fullname";
		frm.action = "controller?type=fullname"
		frm.submit();
	}
	
	function search_go(frm) {
		frm.action = "controller?type=search";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form method="post">
		<input type="button" value="전체보기" onclick="all_search(this.form)">
		<input type="button" value="부서코드검색" onclick="dept_search(this.form)">
		<input type="button" value="성명검색(성, 이름포함)" onclick="fullname_search(this.form)">
		<input type="button" value="동적검색" onclick="search_go(this.form)">
	</form>

</body>
</html>