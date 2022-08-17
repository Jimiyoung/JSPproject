<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>scContent.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <style>
  	th{background-color:#fafafa;}
  </style>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<p><br/></p>
<div class="container">
  <h2>일정 내역보기(${vo.ymd})</h2>
  <br/>
  <table class="table table-bordered">
  	<tr>
  		<th>작성자</th>
  		<td>${vo.nickName}</td>
  	</tr>
  	<tr>
  		<th>분류</th>
  		<td>${vo.part}</td>
  	</tr>
  	<tr>
  		<th>제목</th>
  		<td>${vo.title}</td>
  	</tr>
  	<tr>
  		<th>장소</th>
  		<td>${vo.place}</td>
  	</tr>
  	<tr>
  		<th>시간</th>
  		<td>${vo.stime}</td>
  	</tr>
  	<tr>
  		<th>상세내용</th>
  		<td>${fn:replace (vo.content,newLine,"<br/>")}</td>
  	</tr>
  	<tr>
  		<td colspan="2" class="text-center">
        <input type="button" value="창닫기" onclick="window.close()"/>
      </td>
    </tr> 
  </table>
</div>  
</div>
<p><br/></p>
</body>
</html>