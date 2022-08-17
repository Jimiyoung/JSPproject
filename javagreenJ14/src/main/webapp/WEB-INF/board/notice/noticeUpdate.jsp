<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>noticeUpdate.jsp</title>
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
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<div class="container">
  <form name="myForm" method="post" action="${ctp}/noticeUpdateOk.no">
	  <table class="table table-borderless">
	    <tr>
	      <td><h2>공지사항 수정하기</h2></td>
	    </tr>
	  </table>
	  <table class="table">
	    <tr>
	      <th>글쓴이</th>
	      <td>${sNickName}</td>
	    </tr>
	    <tr>
	      <th>글제목</th>
	      <td><input type="text" name="title" value="${vo.title}" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
	      <th>글내용</th>
	      <td><textarea rows="6" name="content" class="form-control" required>${vo.content}</textarea></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="수정하기" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
	        <input type="reset" value="다시입력" class="btn btn-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/noticeList.no?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" name="idx" value="${vo.idx}"/>
	  <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
</div>
<br/>
<%@ include file="/include/footer.jsp" %>
</body>
</html>