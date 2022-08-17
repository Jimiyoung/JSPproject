<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>entranceList.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	function swCheck() {
		let sw = swCheckForm.sw.value;
		location.href="${ctp}/entranceList.ad?sw="+sw;
	}
  </script>
  <style>
  	#title{
  		background-color:#fafafa;
  	}
  </style>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="container text-center" style="padding:30px">
<div class="w3-main" style="margin-left:250px">
  <h2 class="text-center">입학 대기 신청(${sw})</h2>
  <br/> <br/>
  <table class="table table-borderless">
  	<tr>
  		<td class="text-left" style="width:20%">
  			<form name="swCheckForm">
  				<select name="sw" onchange="swCheck()" class="form-control">
  					<option value="전체" ${sw== '전체' ? 'selected': ''}>전체</option>
  					<option value="YES" ${sw== 'YES' ? 'selected': ''}>YES</option>
  					<option value="NO" ${sw== 'NO' ? 'selected': ''}>NO</option>
  				</select>
  			</form> 
  		</td>
  	</tr>
  </table>
  <table class="table table-hover text-center">
    <tr id="title">
    	<th>번호</th>
    	<th>보호자성명</th>
    	<th>주소</th>
    	<th>아동성명</th>
    	<th>아동성별</th>
    	<th>아동생년월일</th>
    	<th>확인여부</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${curScrStartNo}</td>
    	  <td>${vo.pName}</td>
    	  <td>${vo.address}</td>
    	  <td>${vo.cName}</td>
    	  <td>${vo.gender}</td>
    	  <td>${fn:substring(vo.birthday,0,11)}</td> 
    	  <td>
    	  	<c:if test="${vo.sw=='NO'}"> 
    	  		<a href="entranceContent.ad?idx=${vo.idx}" class="btn btn-danger btn-sm">${vo.sw}</a>
    	  	</c:if>
    	  	<c:if test="${vo.sw=='YES'}"> 
    	  		<a href="entranceContent.ad?idx=${vo.idx}" class="btn btn-info btn-sm">${vo.sw}</a>
    	  	</c:if>
    	  </td>
    	</tr>
    	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
    </c:forEach>
    <tr><td colspan="7"></td></tr>
  </table>
</div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>