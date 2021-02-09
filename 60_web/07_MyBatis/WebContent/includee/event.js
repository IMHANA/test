function sel_all(frm) {
	frm.action = "selectAll.jsp";
	frm.submit();
}
function sel_one(frm) {
	frm.action = "selectOneID.jsp";
	frm.submit();
}
function add_go(frm) {
	//아이디값 입력여부 확인
	if (frm.id.value.trim() == "") {	//아이디가 입력안됐거나 null인경우
		alert("아이디(ID)는 필수 항목입니다.\n입력하세요");
		frm.id.value = "";
		frm.id.focus();
		return false;	//함수를 종료
	}	//아이디가 정상 입력된 경우
	frm.action = "insertMember.jsp";
	frm.submit();
}
function del_go(frm) {
	//아이디값 입력여부 확인
	if (frm.id.value.trim() == "") {
		alert("아이디(ID)는 필수 항목입니다.\n입력하세요");
		frm.id.value = "";
		frm.id.focus();
		return false;
	}
	frm.action = "deleteMember.jsp";
	frm.submit();
}