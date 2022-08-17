<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>noticeSearch.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
<div class="w3-main" style="margin-left:250px">
	<div class="container">
		<div class="container">
		  <h2 class = "text-center">공 지 사 항 검 색 리 스 트</h2>
		  <div class="text-center">(<font color="blue">${searchTitle}</font>)(으)로 <font color="blue">${searchString}</font>를(을) 검색한 결과<font color="red">${searchCount}</font>건이 검색되었습니다.</div>
		  <br/>
		  <table class="table table-hover text-center">
		  	<tr id="title">
		  		<th>번호</th>
		  		<th>제목</th>
		  		<th>작성자</th>
		  		<th>등록일</th>
		  		<th>조회수</th>
		  	</tr>
		  	<c:forEach var="vo" items="${vos}" varStatus="st">
		  		<tr>
		  			<td>${st.count}</td>
		  			<td class="text-left"><a href="noticeContent.no?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&flag=s&search=${search}&searchString=${searchString}">${vo.title}</a>
		  				<c:if test="${vo.wNdate <=24}"><img src="${ctp}/images/new.gif"></c:if>
		  			</td>
		  			<td>${vo.nickName}</td>
		  			<td>
							<c:if test="${vo.wNdate <=24}">${fn:substring(vo.wDate,11,19)}</c:if>
							<c:if test="${vo.wNdate >24}">${fn:substring(vo.wDate,0,10)}</c:if>
						</td>
		  			<td>${vo.readNum}</td>
		  		</tr>
		  	</c:forEach>
		  	<tr><td colspan="5" class="padding"></td></tr>
		  </table>
		</div>
	</div>
<div class="text-center"><input type="button" value="돌아가기" onclick="location.href='noticeList.no?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary "/></div>
</div>
<br/>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>