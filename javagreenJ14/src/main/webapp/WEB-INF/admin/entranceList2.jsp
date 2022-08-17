<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>entranceList.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
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
  <h2 class="text-center">입학 대기 신청</h2>
  <br/> <br/>
  <table class="table table-hover text-center">
    <tr id="title">
    	<th>번호</th>
    	<th>보호자성명</th>
    	<th>주소</th>
    	<th>아동성명</th>
    	<th>아동성별</th>
    	<th>아동생년월일</th>
    	<th>확인여부${vos}</th>
    </tr>
    
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${st.count}</td>
    	  <td>${vo.pName}</td>
    	  <td>${vo.address}</td>
    	  <td>${vo.cName}</td>
    	  <td>${vo.gender}</td>
    	  <td>${vo.birthday}</td>
    	  <td>${vo.sw}</td>
    	 <%-- <td>
    	    <c:if test="${vo.userDel == 'OK'}"><font color="red">탈퇴신청</font></c:if>
    	    <c:if test="${vo.userDel != 'OK'}">활동중</c:if>
    	    <c:if test="${vo.applyDiff >= 30 and vo.userDel == 'OK'}"><font color="blue"><a href="javascript:userDelCheck(${vo.idx})" title="30일경과">*</a></font></c:if>
    	  </td> --%>
    	</tr>
    	<%-- <c:set var="curScrStartNo" value="${curScrStartNo-1}"/> --%>
    </c:forEach>
    
    <tr><td colspan="8"></td></tr>
  </table>
</div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>