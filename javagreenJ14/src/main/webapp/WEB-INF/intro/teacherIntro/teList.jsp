<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>teList.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<div class="container">
	<h2 class="text-center">교 사 소 개</h2>
	<br/>
	<table class="table table-bordered">
		<tr>
			<c:if test="${sLevel == 0}">
	  		<td class="text-left p-0">
	  			<a href="teInput.te" class="btn btn-secondary btn-sm">글쓰기</a>
		  	</td>
		  </c:if>	
	  </tr>

	  <c:forEach var="vo" items="${vos}">
		<tr>
			<th>
		  		<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
					<c:forEach var="fSName" items="${fSNames}" varStatus="st">
						${st.count}. ${fSName}<br/>
						<c:set var="fSNameLen" value="${fn:length(fSName)}"/>
						<c:set var="ext" value="${fn:substring(fSName,fSNameLen-3,fSNameLen)}"/> <!-- 확장자  -->
						<c:set var="extUpper" value="${fn:toUpperCase(ext)}"/> <!-- 확장자를 대문자로 바꿈  -->
						<c:if test="${extUpper=='JPG' || extUpper=='GIF' ||extUpper=='PNG'}">
							<img src="${ctp}/data/teacher/${fSName}" width="500px"/>
						</c:if>
					</c:forEach>
			</th>
			<td> 
				이름 : ${vo.teacherName}
				담당학급 : ${vo.teacherBan} 
			</td>
		</tr>
		</c:forEach>
	</table>
</div>	
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>