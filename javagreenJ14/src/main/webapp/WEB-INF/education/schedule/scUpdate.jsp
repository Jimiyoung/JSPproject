<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>scUpdate.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	function scUpdate() {
			myForm.submit();
		}
  </script>
  <style>
  	th{background-color:#ccc}
  </style>
</head>
<body>

<p><br/></p>
<div class="container">
	<form name="myForm" method="post" action="${ctp}/scUpdateOk.sc">
	  <h2>일정 내역보기(${vo.ymd})</h2>
	  <br/>
	  <table class="table table-bordered">
	  	<tr>
	  		<th>작성자</th>
	  		<td>${vo.nickName}</td>
	  	</tr>
	  	<tr>
	  		<th>분류</th>
	  		<td>${vo.part}
		  		<select name="part" class="form-control">
						<option value="행사" <c:if test="${vo.part=='행사'}">selected</c:if>>행사</option>
						<option value="현장학습" <c:if test="${vo.part=='현장학습'}">selected</c:if>>현장학습</option>
						<option value="안전교육" <c:if test="${vo.part=='안전교육'}">selected</c:if>>안전교육</option>
						<option value="부모교육" <c:if test="${vo.part=='부모교육'}">selected</c:if>>부모교육</option>
						<option value="기타" <c:if test="${vo.part=='기타'}">selected</c:if>>기타</option>
					</select>
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>제목</th>
	  		<td><input type="text" name="title" value="${vo.title}" class="form-control" required /></td>
	  	</tr>
	  	<tr>
	  		<th>장소</th>
	  		<td><input type="text" name="place" value="${vo.place}" class="form-control" required /></td>
	  	</tr>
	  	<tr>
	  		<th>시간</th>
	  		<td><input type="text" name="stime" value="${vo.stime}" class="form-control" required /></td>
	  	</tr>
	  	<tr>
	  		<th>상세내역</th>
	  		<td><textarea name="content" rows="2" class="form-control">${vo.content}</textarea></td>
	  	</tr>
	  	<tr>
	  		<td colspan="2" class="text-center">
	  			<input type="hidden" name="idx" id="idx" value="${vo.idx}"/>
	  			<input type="hidden" name="ymd" id="ymd" value="${vo.ymd}"/>
	  			<input type="hidden" name="nickName" id="nickName" value="${vo.nickName}"/>
	        <input type="button" value="창닫기" onclick="window.close()" class="btn btn-info">&nbsp;
	        <input type="button" value="수정하기" onclick="scUpdate()"  class="btn btn-success"/>
	      </td>
	    </tr> 
	  </table>
	</form>
</div>
<p><br/></p>
</body>
</html>