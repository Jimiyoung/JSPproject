<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>memMain.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script>
	'use strict';
	function memberDelCheck() {
		let ans=confirm("정말 탈퇴하시겠습니까?")
		if(ans){
			ans=confirm("탈퇴후 1개월간 같은 아이디로 가입할 수 없습니다. \n 탈퇴 하시겠습니까??")
			if(ans) location.href="<%=request.getContextPath()%>/memDelete.mem";
		}
	}
</script>
</head>
<body class="w3-content" style="max-width:1200px"> 
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="container text-center" style="padding:30px">
	<div class="w3-main p-5" style="margin-left:250px">
	<p><br/></p>
	  <h2 class=>회 원 전 용</h2>
	  <hr/>
	  <p><font color="blue">${sNickName}</font>님 로그인 중입니다.</p>
	  <p>현재 <font color="red">${vo.strLevel}</font>입니다.</p>
	  <p>자녀이름 <font color="red">${vo.childName}</font>입니다.</p>
	  <p>자녀학급 <font color="red">${vo.ban}</font>입니다.</p>
	  <p>최종 접속일 :<font color="blue">${fn:substring(vo.lastDate,0,19)}</font></p>
	  <hr/>
	  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/memUpdate.mem';">회원정보수정</button>
	  <a href="javascript:memberDelCheck()"><button type="button" class="btn btn-secondary btn-sm">회원탈퇴</button></a>
	</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>