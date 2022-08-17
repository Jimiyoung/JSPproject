<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%	pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memInfor.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
</head>
<body class="w3-content" style="max-width:1200px"> 
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="container " style="padding:30px">
	<div class="w3-main p-5" style="margin-left:250px">
	  <h2>*회 원 정 보 상 세 보 기*</h2>
	  <br/> 
	  <table class="table">
	  	<tr><td>아이디 : ${vo.mid}</td></tr>
	  	<tr><td>성명 : ${vo.name}</td></tr>
	  	<tr><td>닉네임 : ${vo.nickName}</td></tr>
	  	<tr><td>생일 : ${vo.birthday}</td></tr>
	  	<tr><td>자녀이름 : ${vo.childName}</td></tr>
	  	<tr><td>자녀학급 : ${vo.ban}</td></tr>
	  	<tr><td>전화번호 : ${vo.tel}</td></tr>
	  	<tr><td>주소 : ${vo.address}</td></tr>
	  	<tr><td>이메일 : ${vo.email}</td></tr>
	  	<tr><td>등급 : ${vo.strLevel}</td></tr>
	  	<tr><td>가입일자 : ${vo.startDate}</td></tr>
	  	<tr><td>마지막방문일자 : ${vo.lastDate}</td></tr>
	  	<tr><td>오늘 방문횟수 : ${vo.userDel}</td></tr>
	  </table>
	  <hr/>
  	<div class="text-center">
	 		<p><input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary"/></p>
		</div>
  </div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>