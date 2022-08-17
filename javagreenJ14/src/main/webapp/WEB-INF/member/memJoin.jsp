<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>memJoin.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>
  	'use strict';
	  	let idCheckSw=0;
			let nickCheckSw=0;
			
 		// 회원가입폼 체크후 서버로 전송하기
  	function fCheck() {
  		let regMid = /^[a-z0-9]{4,16}$/;
      let regPwd = /(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,16}/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      
      let submitFlag = 0;  //전송체크버튼. 값이 1이면 체크완료되어 전송처리함
      
      let mid = myForm.mid.value;
      
	  	let name = myForm.name.value;
	  	let nickName = myForm.nickName.value;
	  	let childName = myForm.childName.value;
	  	let ban = myForm.ban.value;
	    let tel1 = myForm.tel1.value;
	    let tel2 = myForm.tel2.value;
	    let tel3 = myForm.tel3.value;
	    let tel = myForm.tel1.value + "-" + myForm.tel2.value + "-" + myForm.tel3.value;
	   	//비밀번호 확인
	  	let pwd = myForm.pwd.value;
	  	let pwd2 = myForm.pwd2.value;
	  	//이메일
	  	let email1 = myForm.email1.value;
    	let email2 = myForm.email2.value;
      let email = email1 + '@' + email2;
	    
			if(!regMid.test(mid)) {
        alert("아이디는 영문 소문자와 숫자만 사용가능합니다.(길이는 4~16자 이내로 입력하세요.)");
        myForm.mid.focus();
        return false;
      }
      else if(!regPwd.test(pwd)) {
    	  alert("비밀번호는 영문자, 숫자, 특수문자 조합으로 사용가능합니다.(길이는 8~16자 이내로 입력하세요.)");
        myForm.pwd.focus();
        return false;
      }
      else if(pwd != pwd2) {  //비밀번호 확인
    	  alert("비밀번호를 다시 확인하세요.");
        myForm.pwd.value="";
        myForm.pwd2.value="";
        myForm.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myForm.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myForm.name.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
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
			myForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress+ "/";
			// 전송 전 모든 체크가 끝나서 submitFlag가 1이 되면 서버로 전송
	    	if(submitFlag == 1) {
	    		if(idCheckSw == 0){
	    			alert("아이디 중복체크 버튼을 눌러주세요.");
	    		}
	    		else if(nickCheckSw==0){
	    			alert("닉네임 중복체크 버튼을 눌러주세요.");
	    		}
	    		else{
		  			// 묶여진 필드를 폼태그안에 hidden태그의 값으로 저장시켜준다.(email/tel.)
		  			myForm.email.value = email;
		  			myForm.tel.value = tel;
		  			
		  			myForm.submit();
	    		}
	    	}
	    	else {
	    		alert("회원가입 실패~~");
	    	}
	    }
	    // id중복체크
	    function idCheck() {
				let mid = myForm.mid.value;
				let url = "${ctp}/memIdCheck.mem?mid="+mid;
				
				if(mid==""){
					alert("아이디를 입력하세요.");
					myForm.mid.focus();
				}
				else {
					idCheckSw=1;
					window.open(url,"nWin","width=500px, height=250px");
				}
			}
	    // 닉네임중복체크
	    function nickCheck() {
				let nickName = myForm.nickName.value;
				let url = "${ctp}/memNickCheck.mem?nickName="+nickName;
				
				if(nickName==""){
					alert("닉네임을 입력하세요.");
					myForm.nickName.focus();
				}
				else {
					nickCheckSw=1;
					window.open(url,"nWin","width=500px, height=250px");
				}
			}
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="container" style="padding:30px">
<div class="w3-main p-5" style="margin-left:250px">
	<form name="myForm" method="post" action="${ctp}/memJoinOk.mem" class="was-validated">
    <h2 class="text-center">회 원 가 입</h2>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : *아이디는 4~16자 이내로 입력하세요(영문 소문자+숫자)</label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요" required autofocus maxlength="16"/>
      <input type="button" value="아이디 중복체크" class="btn btn-secondary btn-sm"  onclick="idCheck()"/>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 : *비밀번호는 8~16자 이내로 입력하세요(숫자+영문자+특수문자)</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="pwd" required />
    </div>
    <div class="form-group">
      <label for="pwd2">비밀번호 확인 :</label>
      <input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 한번 더 입력하세요" name="pwd2" required />
    </div>
    <div class="form-group">
      <label for="name">이름 :</label>
      <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요" name="name" required />
    </div>
    <div class="form-group">
      <label for="birthday">생년월일</label>
      <c:set var="now" value="<%=new java.util.Date()%>"/>
      <fmt:formatDate var="birthday" value="${now}" pattern="yyyy-MM-dd"/>
			<input type="date" name="birthday" value="${birthday}" class="form-control"/>
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : * 닉네임은 한글로 입력하세요.</label>
      <input type="button" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/>
      <input type="text" class="form-control" id="nickName" placeholder="닉네임을 입력하세요." name="nickName" required />
    </div>
    <div class="form-group">
      <label for="childName">자녀이름 :</label>
      <input type="text" class="form-control" id="childName" placeholder="자녀이름을 입력하세요" name="childName" required />
    </div>
    <div class="form-group">
      <label for="ban">자녀학급 :</label>
      <div class="input-group-append">
		    <select name="ban" class="custom-select">
			    <option value="" selected>학급을 선택하세요</option>
			    <option value="누리반">누리반</option>
			    <option value="도담반">도담반</option>
			    <option value="새솔반">새솔반</option>
			    <option value="은솔반">은솔반</option>
			    <option value="해든실반">해든실반</option>
			    <option value="하나울반">하나울반</option>
			  </select>
		  </div>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
			      <select name="tel1" class="custom-select" required >
					    <option value="010" selected>010</option>
					    <option value="02">서울</option>
					    <option value="031">경기</option>
					    <option value="032">인천</option>
					    <option value="041">충남</option>
					    <option value="042">대전</option>
					    <option value="043">충북</option>
			        <option value="051">부산</option>
			        <option value="052">울산</option>
			        <option value="061">전북</option>
			        <option value="062">광주</option>
					  </select>-
	      </div>
	      <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
	      <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
	    </div> 
    </div>
    <div class="form-group">
      <label for="email1">이메일 :</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" selected>naver.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="hotmail.com">hotmail.com</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="nate.com">nate.com</option>
					    <option value="yahoo.com">yahoo.com</option>
					  </select>
				  </div>
				</div>
	  </div>
    <div class="form-group">
      <label for="address">주소</label>
			<input type="hidden" name="address" id="address" required >
			<div class="input-group mb-1">
				<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
				<div class="input-group-append">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
				</div>
			</div>
			<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
			<div class="input-group mb-1">
				<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
				<div class="input-group-append">
					<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
				</div>
			</div>
    </div>
    <div class="text-center">
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입</button> &nbsp;
	    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/';">돌아가기</button>
	    <input type="hidden" name="photo"/>
	    <input type="hidden" name="email"/>
	    <input type="hidden" name="tel"/>
    </div>
  </form>
</div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>