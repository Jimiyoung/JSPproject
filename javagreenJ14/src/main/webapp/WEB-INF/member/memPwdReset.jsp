<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	String name = (String) request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
  <title>memJoin.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	function fCheck() {
  		let regPwd = /(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,16}/;
  		
  		let pwd = pwdForm.pwd.value;
			let pwd2 = pwdForm.pwd2.value;
			
			if(pwd==""){
				alert("비밀번호를 입력하세요.");
				pwdForm.pwd.focus();
				return false;
			}
			else if (pwd2==""){
				alert("비밀번호 확인을 입력하세요.");
				pwdForm.pwd2.focus();
				return false;
			}
			else if(!regPwd.test(pwd)) {
    	  alert("비밀번호는 영문자, 숫자, 특수문자 조합으로 사용가능합니다.(길이는 8~16자 이내로 입력하세요.)");
    	  pwdForm.pwd.focus();
        return false;
      }
		 else if(pwd != pwd2) {  
    	  alert("비밀번호를 다시 확인하세요.");
    	  pwdForm.pwd.value="";
    	  pwdForm.pwd2.value="";
    	  pwdForm.pwd.focus();
        return false;
      }
		}
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
	<div class="modal-dialog col-8">
		<div class="modal-content">
			<div class="container p-3 border">
			  <form name="pwdForm" method="post" action="${ctp}/memPwdResetOk.mem" class="was-validated">
			    <h2>비밀번호 재설정</h2>
			    <p><b>${imsiSession}</b>님 새로운 비밀번호를 입력하세요.</p>
			    <div class="form-group">
			      <label for="pwd">비밀번호</label>
			      <br/>
			      *비밀번호는 8~16자 이내로 입력하세요(숫자+영문자+특수문자)
			      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="pwd" required />
			    </div>
			    <div class="form-group">
			      <label for="pwd2">비밀번호 확인 :</label>
			      <input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 한번 더 입력하세요" name="pwd2" required />
			    </div>
			     <div class="text-center">
				    <button type="submit" class="btn btn-secondary" onclick="fCheck()">비밀번호 재설정</button>
			    </div>
			  </form>
			</div>
		</div>
	</div>
</div>
<br/>
<br/>
<%@ include file="/include/footer.jsp" %>
</body>
</html>