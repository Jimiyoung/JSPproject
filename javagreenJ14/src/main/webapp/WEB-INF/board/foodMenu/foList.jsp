<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>foList.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	function pageCheck() {
			let pageSize = $("#pageSize").val();
			location.href="foodList.fo?pag=${pag}&pageSize="+pageSize;
		}
  	// 검색기처리
  	function searchCheck() {
			let searchString=$("#searchString").val();
			
			if(searchString.trim()==""){
				alert("검색어를 입력하세요!");
				searchForm.searchString.focus();
			}
			else{
				searchForm.submit();
			}
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
<div class="w3-main" style="margin-left:250px">
<div class="container">
  <h4 class="text-center">식단표</h4>
  <br/>
  <table class="table table-borderless">
  	<tr>
  	<c:if test="${sLevel == 0}">
  		<td class="text-left p-0">
  			<a href="foInput.fo" class="btn btn-info btn-sm">글쓰기</a>
	  	</td>
	  </c:if>	
	  	<td class="text-right p-0">
	  		<select name="pageSize" id="pageSize" onChange="pageCheck()">
	  			<option value="5" ${pageSize==5 ? 'selected' : ''} >5건</option>
	  			<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
	  			<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
	  			<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
	  		</select>
	  	</td>
	  </tr>	
  </table>
  <table class="table table-hover text-center">
  	<tr id="title">
  		<th>번호</th>
  		<th>제목</th>
  		<th>작성자</th>
  		<th>등록일</th>
  		<th>조회수</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}">
  		<tr>
  			<td>${curScrStartNo}</td>
  			<td class="text-left"><a href="foContent.fo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
  				<c:if test="${vo.wNdate <=24}"><img src="${ctp}/images/new.gif"></c:if>
  			</td>
  			<td>${vo.nickName}</td>
  			<td>
					<c:if test="${vo.wNdate <=24}">${fn:substring(vo.wDate,11,19)}</c:if>
					<c:if test="${vo.wNdate >24}">${fn:substring(vo.wDate,0,10)}</c:if>
				</td>
  			<td>${vo.readNum}</td>
  		</tr>
  		<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
  	</c:forEach>
  	<tr><td colspan="5" class="padding"></td></tr>
  </table>
</div>
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
	<ul class="pagination justify-content-center" >
	  <c:if test="${pag > 1}"> 
	  	<li class="page-item"><a href="foList.fo?pag=1&pageSize=${pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${curBlock > 0}">
	  	<li class="page-item"><a href="foList.fo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
	    <c:if test="${i <= totPage && i == pag}">
	      <li class="page-item active"><a href="foList.fo?pag=${i}&pageSize=${pageSize}" class="page-link bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= totPage && i != pag}">
	      <li class="page-item"><a href='foList.fo?pag=${i}&pageSize=${pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}">
	    <li class="page-item"><a href="foList.fo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pag != totPage}">
	  	<li class="page-item"><a href="foList.fo?pag=${totPage}&pageSize=${pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
	</ul>
</div>
<!-- 블록 페이징 처리 끝 -->	
<!-- 검색기 처리 시작 -->
<div class="container text-center">
	<form name="searchForm" method="post" action="foSearch.fo">
		<b>검색 : </b>
		<select name="search" onchange="searchChange()">
			<option value="title">글제목</option>
			<option value="content">글내용</option>
			<option value="nickName">작성자</option>
		</select>
		<input type="text" name="searchString" id="searchString"/>
		<input type="button" value="검색" onclick="searchCheck()"/>
		<input type="hidden" name="pag" value="${pag}"/>
		<input type="hidden" name="pageSize" value="${pageSize}"/>
	</form>
</div>
<br/>
<br/>
<!-- 검색기 처리 끝 -->	
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>