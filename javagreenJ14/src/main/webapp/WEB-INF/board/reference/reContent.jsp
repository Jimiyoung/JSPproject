<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>reContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	function reDelCheck() {
			let ans = confirm("현 게시물을 삭제하시겠습니까?");
			if(ans){
				location.href="reDeleteOk.re?idx=${vo.idx}";
			}
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
  <h2 class="text-center">교육자료실 - 글 내 용 보 기 </h2>
  <br/>
  <table class="table table-bordered">
	  <tr>
	  	<th>제목</th>
	  	<td colspan="5">${vo.title}</td>
	  </tr>
	  <tr>
	  	<th>작성자</th>
	  	<td>${vo.nickName}</td>
	  	<th>등록일</th>
	  	<td>${fn:substring(vo.wDate,0,19)}</td>
	  	<th>조회수</th>
	  	<td>${vo.readNum}</td>
	  </tr>	
	  <tr>
	  	<th>글 내용</th>
	  	<td colspan="5" style="height:220px">${fn:replace(vo.content,newLine,"<br/>")}</td>
	  </tr>	
	  <tr>
	  	<td colspan="6" class="text-center">
		  	<c:if test="${flag=='s'}">
		  		<input type="button" value="돌아가기" onclick="location.href='reSearch.re?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-primary"/>
		  	</c:if>	
		  	<c:if test="${flag!='s'}">
		  		<input type="button" value="돌아가기" onclick="location.href='reList.re?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/>
		  	</c:if>	
	  		<c:if test="${sLevel==0}">
		  		<input type="button" value="수정" onclick="location.href='reUpdate.re?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-success"/>
		  		<input type="button" value="삭제" onclick="noticeDelCheck()" class="btn btn-danger"/>
	  		</c:if>
	  	</td>
	  </tr>	
  </table>

	<!-- 이전글/다음글 처리 -->
	<table class="table table-borderless">
		<tr>
			<td>
			<c:if test="${nextVo.nextIdx !=0}">
				<a href="noticeContent.no?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}"><b>👆🏻다음글 : ${nextVo.nextTitle}</b></a><br/>
			</c:if>	
			<c:if test="${preVo.preIdx !=0}">
				<a href="noticeContent.no?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}"><b>👇🏻이전글 : ${preVo.preTitle}</b></a><br/>
			</c:if>	
			</td>
		</tr>
	</table>
	<br/>
		<input type="hidden" name="noticeIdx" value="${vo.idx}"/>
		<input type="hidden" name="mid" value="${sMid}"/>  <!-- vo, s 둘다 가능  -->
		<input type="hidden" name="nickName" value="${sNickName}"/> <!-- vo, s 둘다 가능  -->
</div>	
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>