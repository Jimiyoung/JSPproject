<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>memFind.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script>
	  'use strict';
		function IdCheck() {
			let name = idForm.name.value;
			let email = idForm.email.value;
	
	    if(name == "") {
		  		alert("이름을 입력하세요");
		  		idForm.name.focus();
		  		return false;
		  	}
	    else if(email == "") {
		  		alert("이메일을 입력하세요");
		  		idForm.email.focus();  
		  		return false;
	    }
		  myForm.submit();
	  }
		function PwdCheck() {
			let mid = pwdForm.mid.value;
			let email = pwdForm.email.value;
	
	    if(mid == "") {
		  		alert("아이디를 입력하세요");
		  		pwdForm.mid.focus();
		  		return false;
		  	}
	    else if(email == "") {
		  		alert("이메일을 입력하세요");
		  		pwdForm.email.focus();  
		  		return false;
	    }
		  myForm.submit();
	  }
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<br/>
<div class="w3-main" style="margin-left:250px">
<p><br/></p>
<div class="container row ">
  <div class="modal-dialog col-6">
		<div class="modal-content">
			<div class="container p-3 border">
			  <form name="idForm" method="post" action="${ctp}/memIdFind.mem" class="was-validated">
			    <h2>아이디 찾기</h2>
			    <p>이름과 이메일을 입력하세요.</p>
			    <div class="form-group">
			      <label for="name">이름 : </label>
			      <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." required autofocus />
			    </div>
			    <div class="form-group">
			      <label for="email">이메일:</label>
						<input type="text" class="form-control" id="email" name="email" required placeholder="이메일을 입력하세요." />
			 	 	</div>
			    <div class="text-center">
				    <button type="submit" class="btn btn-secondary" onclick="IdCheck()">아이디 찾기</button>
			    </div>
			  </form>
			</div>
		</div>
	</div>
	<div class="modal-dialog col-6">
		<div class="modal-content">
			<div class="container p-3 border">
			  <form name="pwdForm" method="post" action="${ctp}/memPwdFind.mem" class="was-validated">
			    <h2>비밀번호 재설정</h2>
			    <p>아이디와 이메일을 입력하세요.</p>
			    <div class="form-group">
			      <label for="mid">아이디 : </label>
			      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus />
			    </div>
			    <div class="form-group">
		      <label for="email">이메일 : </label>
						<div class="input-group mb-3">
						  <input type="text" class="form-control" id="email" name="email" required placeholder="이메일을 입력하세요." />
						</div>
			 	 	</div>
			     <div class="text-center">
				    <button type="submit" class="btn btn-secondary" onclick="PwdCheck()">비밀번호 재설정</button>
			    </div>
			  </form>
			</div>
		</div>
	</div>
</div>
	<div class="text-center">
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/member/memLogin.mem';">돌아가기</button>&nbsp;
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/member/memLogin.mem';">로그인</button>&nbsp;
	</div>	
<p><br/></p>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>