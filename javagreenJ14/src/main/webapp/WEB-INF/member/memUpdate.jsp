<%@page import="member.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>memUpdate.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>
  	'use strict';
  		let nickCheckSw=0;
  	
    // 회원가입폼 체크후 서버로 전송하기
    function fCheck() {
  		/* let regMid = /^[a-z0-9]{4,16}$/;
      let regPwd = /(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,16}/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/; */
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      
      let submitFlag = 0;  //전송체크버튼. 값이 1이면 체크완료되어 전송처리함
            
	  	/* let name = myForm.name.value;
	  	let nickName = myForm.nickName.value; */
	  	let childName = myForm.childName.value;
	  	let ban = myForm.ban.value;
	    let tel1 = myForm.tel1.value;
	    let tel2 = myForm.tel2.value;
	    let tel3 = myForm.tel3.value;
	    let tel = myForm.tel1.value + "-" + myForm.tel2.value + "-" + myForm.tel3.value;
	   	//비밀번호 확인
	  	let pwd = myForm.pwd.value;
	  	//이메일
	  	let email1 = myForm.email1.value;
    	let email2 = myForm.email2.value;
      let email = email1 + '@' + email2;
	    
    	// 기타 추가로 체크해야 할 항목들을 모두 체크하세요.....
     /* if(!regPwd.test(pwd)) {
    	  alert("비밀번호는 영문자, 숫자, 특수문자 조합입니다.(길이는 8~16자 이내로 입력하세요.)");
        myForm.pwd.focus();
        return false;
      }
      else  */if(!regEmail.test(email)) {
          alert("이메일 형식에 맞지않습니다.");
          myForm.email1.focus();
          return false;
      }
      else if(childName == "") {
	  		alert("자녀이름을 입력하세요");
	  		myForm.childName.focus();
	  		return false;
	  	}
	  	else if(ban == "") {
	  		alert("자녀 학급을 선택하세요");
	  		myForm.ban.focus();
	  		return false;
	  	}
      if(tel2 != "" || tel3 != "") {
	      if(!regTel.test(tel)) {
	        alert("전화번호 형식에 맞지않습니다.(000-0000-0000)");
	        myForm.tel2.focus();
	        return false;
	      }
	      else {
	    	  submitFlag = 1;
	      }
      }

  		// 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
  		let postcode = myForm.postcode.value + " ";
  		let roadAddress = myForm.roadAddress.value + " ";
  		let detailAddress = myForm.detailAddress.value + " ";
  		let extraAddress = myForm.extraAddress.value + " ";
  		myForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
  		
  		// 묶여진 필드를 폼태그안에 hidden태그의 값으로 저장시켜준다.(email/tel.)
    	if (submitFlag == 1) {
  			myForm.email.value = email;
  			myForm.tel.value = tel;
  			myForm.submit();
    	}
    	else {
    		alert("회원정보수정 실패");
    	}
    }
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="container" style="padding:30px">
<div class="w3-main p-5" style="margin-left:250px">
  <form name="myForm" method="post" action="${ctp}/memUpdateOk.mem" class="was-validated">
    <h2>회 원 정 보 수 정</h2>
      <div><font color="blue">(회원정보를 수정하려면 비밀번호를 정확히 입력하세요.)</font></div>
    <br/>
    <div class="form-group">
      아이디 :
      <input type="text" class="form-control" name="mid" id="mid" value="${sMid}" readonly/>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 : *비밀번호는 8~16자 이내로 입력하세요(숫자+영문자+특수문자)</label>
      <input type="password" class="form-control" id="pwd" name="pwd" required autofocus/>
    </div>
    <div class="form-group">
    	이름 : 
    	<input type="text" class="form-control" name="name" id="name" value="${vo.name}" readonly/>
    </div>
    <div class="form-group">
      닉네임 :
      <input type="text" class="form-control" name="nickName" id="nickName" value=" ${vo.nickName}" readonly/>
    </div>
    <div class="form-group">
    	생년월일 : 
    	<input type="text" class="form-control" name="birthday" id="birthday" value="${fn:substring(birthday,0,10)}" readonly/>
    </div>
    <div class="form-group">
      <label for="childName">자녀이름 :</label>
      <input type="text" class="form-control" value="${vo.childName}" id="childName" placeholder="자녀이름을 입력하세요" name="childName" required />
    </div>
    <div class="form-group">
      <label for="ban">자녀학급 :</label>
      <div class="input-group-append">
		    <select name="ban" class="custom-select">
			    <option value="누리반" <c:if test="${ban=='누리반'}">selected</c:if>>누리반</option>
			    <option value="도담반" <c:if test="${ban=='도담반'}">selected</c:if>>도담반</option>
			    <option value="새솔반" <c:if test="${ban=='새솔반'}">selected</c:if> >새솔반</option>
			    <option value="은솔반" <c:if test="${ban=='은솔반'}">selected</c:if>>은솔반</option>
			    <option value="해든실반" <c:if test="${ban=='해든실반'}">selected</c:if>>해든실반</option>
			    <option value="하나울반" <c:if test="${ban=='하나울반'}">selected</c:if>>하나울반</option>
			  </select>
		  </div>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
			      <select name="tel1" class="custom-select">
					    <option value="010" ${tel1=="010" ? selected : ""}>010</option>
					    <option value="02"  ${tel1=="02" ? selected : ""}>서울</option>
					    <option value="031" ${tel1=="031" ? selected : ""}>경기</option>
					    <option value="032" ${tel1=="032" ? selected : ""}>인천</option>
					    <option value="041" ${tel1=="041" ? selected : ""}>충남</option>
					    <option value="042" ${tel1=="042" ? selected : ""}>대전</option>
					    <option value="043" ${tel1=="043" ? selected : ""}>충북</option>
			        <option value="051" ${tel1=="051" ? selected : ""}>부산</option>
			        <option value="052" ${tel1=="052" ? selected : ""}>울산</option>
			        <option value="061" ${tel1=="061" ? selected : ""}>전북</option>
			        <option value="062" ${tel1=="062" ? selected : ""}>광주</option>
					  </select>-
	      </div>
	      <input type="text" name="tel2" value="${tel2}" size=4 maxlength=4 class="form-control"/>-
	      <input type="text" name="tel3" value="${tel3}" size=4 maxlength=4 class="form-control"/>
	    </div> 
    </div>
    <div class="form-group">
      <label for="email1">이메일 :</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" value="${email1}" id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" <c:if test="${email2=='naver.com'}">selected</c:if>>naver.com</option>
					    <option value="hanmail.net" <c:if test="${email2=='hanmail.net'}">selected</c:if>>hanmail.net</option>
					    <option value="hotmail.com" <c:if test="${email2=='hotmail.com'}">selected</c:if>>hotmail.com</option>
					    <option value="gmail.com" <c:if test="${email2=='gmail.com'}">selected</c:if>>gmail.com</option>
					    <option value="nate.com" <c:if test="${email2=='nate.com'}">selected</c:if>>nate.com</option>
					    <option value="yahoo.com" <c:if test="${email2=='yahoo.com'}">selected</c:if>>yahoo.com</option>
					  </select>
				  </div>
				</div>
	  </div>
    <div class="form-group">
      <label for="address">주소</label>
			<input type="hidden" name="address" id="address">
			<div class="input-group mb-1">
				<input type="text" name="postcode" id="sample6_postcode" value="${postcode}" placeholder="우편번호" class="form-control">
				<div class="input-group-append">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
				</div>
			</div>
			<input type="text" name="roadAddress" id="sample6_address" value="${roadAddress}" size="50" class="form-control mb-1">
			<div class="input-group mb-1">
				<input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" class="form-control"> &nbsp;&nbsp;
				<div class="input-group-append">
					<input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" class="form-control">
				</div>
			</div>
    </div>
    <div class="text-center">
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원정보수정</button> &nbsp;
	    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/memMain.mem';">돌아가기</button>
	    <input type="hidden" name="photo"/>
	    <input type="hidden" name="email"/>
	    <input type="hidden" name="tel"/>
    </div>
  </form>
</div>
</div>
<br/>
<%@ include file="/include/footer.jsp" %>
</body>
</html>