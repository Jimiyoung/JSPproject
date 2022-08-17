<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>entranceContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	function entranceCheck(idx) {
  		$.ajax({
			type : "post",
			url : "${ctp}/entranceSw.ad",
			data : {idx : idx},
			success : function(data) {
				if(data=="1"){
					alert("확인 체크 성공");
					location.href="${ctp}/entranceList.ad";
				}
				else{
					alert("확인 체크 실패");
				}
			},
			error : function() {
				alert("전송오류");
			}
		});
	}
  </script>
  <style>
  	th{
  		background-color:#eee;
  		text-align:center;
  	}
  </style>
</head>
<body>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<p><br/></p>
<div class="container">
  <h2 class="text-center">입학대기신청 상세내용</h2>
  <br/>
  <table class="table table-bordered">
	  <tr>
	  	<th>성명</th>
	  	<td>${vo.pName}</td>
	  </tr>
	  <tr>
	  	<th>아동과의 관계</th>
	  	<td>${vo.relation}</td>
	  </tr>
	  <tr>	
	  	<th>주소</th>
	  	<td>${vo.relation}</td>
	  </tr>	
	  <tr>
	  	<th>연락처</th>
	  	<td>${vo.tel}</td>
	  </tr>	
	  <tr>
	  	<th>아동 성명</th>
	  	<td>${vo.cName}</td>
	  </tr>	
	  <tr>
	  	<th>아동 성별</th>
	  	<td>${vo.gender}</td>
	  </tr>	
	  <tr>
	  	<th>아동 생년월일</th>
	  	<td>${fn:substring(vo.birthday,0,11)}</td>
	  </tr>	
	  <tr>
	  	<th>참고사항</th>
	  	<td>${vo.content}</td>
	  </tr>	
	  <tr>
	  	<td colspan="6" class="text-center">
		  	<input type="button" value="돌아가기" onclick="location.href='entranceList.ad?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-info"/>
		  	<input type="button" value="확인" onclick="entranceCheck(${vo.idx})" class="btn btn-success"/>
	  	</td>
	  </tr>	
  </table>
	<br/>
</div>	
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>