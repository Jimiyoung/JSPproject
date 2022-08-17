<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>foContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <%@ include file="/include/bs4.jsp" %>
  <script>
	  function fCheck() {
	  	var title = myForm.title.value;
	  	var content = myForm.content.value;
	  	
	  	if(title.trim() == "") {
	  		alert("게시글 제목을 입력하세요");
	  		myForm.title.focus();
	  	}
	  	else if(content.trim() == "") {
	  		alert("글내용을 입력하세요");
	  		myForm.content.focus();
	  	}
	  	else {
	  		myForm.submit();
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
	<form name="myForm" method="post" action="${ctp}/foUpdateOk.fo">
	d <table class="table table-bordered">
			<tr>
			  <td><h2 class="text-center">식단게시판 수정하기 </h2></td>
		  </tr>
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
	  		<th>파일명</th>
	  		<td>${vo.fName}</td>
	  		<th>다운로드수</th>
	  		<td>${vo.downNum}</td>
	  		<th>파일크기</th>
	  		<td><fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0"/>KByte</td>
	  	</tr>
		  <tr>
		  	<th>글 내용</th>
		  	<td colspan="5" style="height:220px">${fn:replace(vo.content,newLine,"<br/>")}</td>
		  </tr>	
		  <tr>
		  	<th>글 내용</th>
		  	<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
				<c:forEach var="fSName" items="${fSNames}" varStatus="st">
					${st.count}. ${fSName}<br/>
					<c:set var="fSNameLen" value="${fn:length(fSName)}"/>
					<c:set var="ext" value="${fn:substring(fSName,fSNameLen-3,fSNameLen)}"/> <!-- 확장자  -->
					<c:set var="extUpper" value="${fn:toUpperCase(ext)}"/> <!-- 확장자를 대문자로 바꿈  -->
					<c:if test="${extUpper=='JPG' || extUpper=='GIF' ||extUpper=='PNG' ||extUpper=='HWP'}">
						<img src="${ctp}/data/pds/${fSName}" width="500px"/>
					</c:if>
				</c:forEach>
		  </tr>	
		  <tr>
		 		<td colspan="2" class="text-center">
		  		<input type="button" value="수정하기" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
	        <input type="reset" value="다시입력" class="btn btn-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/foList.fo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
		  	</td>
		  </tr>	
	  </table>
		<br/>
		<input type="hidden" name="noticeIdx" value="${vo.idx}"/>
		<input type="hidden" name="mid" value="${sMid}"/>  <!-- vo, s 둘다 가능  -->
		<input type="hidden" name="nickName" value="${sNickName}"/> <!-- vo, s 둘다 가능  -->
	</form>
	
</div>
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
		<!-- 이전글/다음글 처리 끝 -->
			
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>