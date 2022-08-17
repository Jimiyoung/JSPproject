<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");
	String mid = (String) request.getAttribute("mid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
	<script>
		'use strict';
		
		let msg = '<%=msg%>';
		let url = '<%=url%>';
		let val = '${val}';
		let mid = '<%=mid%>';
		
		if(msg == "nickCheckNo") msg = "닉네임이 중복되었습니다.";
		else if(msg == "idCheckNo") msg = "아이디가 중복되었습니다";
		else if(msg == "memJoinOk") msg = "축하합니다.🎉 회원가입 되었습니다.";
		else if(msg == "memJoinNo") msg = "회원가입 실패";
		else if(msg == "loginOk") msg = '${sMid}'+"님 로그인 되었습니다!";
		else if(msg == "loginNo") msg = "로그인 실패";
		else if(msg == "memLogOutOk") msg = val+"님 로그아웃 되었습니다!";
		else if(msg == "passwordNo") msg ="비밀번호가 일치하지 않습니다.다시 확인하세요.";
		else if(msg == "memUpdateOk") msg ="회원정보가 수정되었습니다.";
		else if(msg == "memUpdateNo") msg ="회원정보수정에 실패하였습니다.";
		else if(msg == "levelChangeOk") msg = "등급이 변경되었습니다!";
		else if(msg == "memDeleteUpdateOk") msg = "회원 탈퇴.!";
		else if(msg == "memDeleteUpdateNo") msg = "탈퇴 실패.!";
		else if(msg == "userDeleteOk") msg = "memberDB에서 삭제 완료!";
		else if(msg == "userDeleteNo") msg = "memberDB에서 삭제 실패!";
		else if(msg == "banChangeOk") msg = "학급이 변경되었습니다!";
		else if(msg == "MidFindNo") msg = "입력한 정보와 일치하는 아이디가 존재하지 않습니다. \n이름과 이메일을 확인해주세요. ";
		else if(msg == "MidFindOk") msg = "회원님의 아이디는 '${imsiSession}'입니다.  ";
		else if(msg == "PwdFindNo") msg = "입력한 정보와 일치하는 회원이 존재하지 않습니다. \n아이디와 이메일을 확인해주세요. ";
		else if(msg == "PwdFindOk") msg = "등록정보가 확인되었습니다. 비밀번호 재설정 창으로 이동합니다.";
		else if(msg == "pwdResetOk") msg = "비밀번호가 재설정되었습니다. ";
		else if(msg == "PwdResetNo") msg = "비밀번호 재설정에 실패했습니다.";
		else if(msg == "noticeOk") msg = "공지사항이 등록되었습니다.";
		else if(msg == "noticeNo") msg = "공지사항 등록에 실패했습니다.";
		else if(msg == "noticeDeleteOk") msg = "게시글 삭제 성공";
		else if(msg == "noticeDeleteNo") msg = "게시글 삭제 실패";
		else if(msg == "noticeUpdateOk") msg = "게시글 수정 성공";
		else if(msg == "noticeUpdateNo") msg = "게시글 수정 실패";
		else if(msg == "foInputOk") msg = "식단게시글 등록 성공";
		else if(msg == "foInputNo") msg = "식단게시글 등록 실패";
		else if(msg == "foDeleteOk") msg = "식단게시글 삭제 성공";
		else if(msg == "foDeleteNo") msg = "식단게시글 삭제 실패";
		else if(msg == "foUpdateOk") msg = "식단게시글 수정 성공";
		else if(msg == "foUpdateNo") msg = "식단게시글 수정 실패";
		else if(msg == "enInputOk") msg = "입학대기신청 성공";
		else if(msg == "enInputNo") msg = "입학대기신청 실패";
		else if(msg == "nuriInputOk") msg = "누리반 이야기가 등록되었습니다.";
		else if(msg == "nuriInputNo") msg = "누리반 이야기 등록 실패";
		else if(msg == "NuriUpdateOk") msg = "누리반 이야기가 수정되었습니다.";
		else if(msg == "NuriUpdateNo") msg = "누리반 이야기 수정 실패";
		else if(msg == "normal") msg = "학부모 레벨 이상만 이용 가능합니다.";
		else if(msg == "nono") msg = "회원 전용 게시판입니다.";
		
		alert(msg);
		if(url !="") location.href=url;
	</script>
</head>
<body>

</body>
</html>