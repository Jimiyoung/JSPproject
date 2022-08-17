<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>entranceInput.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>
  	'use strict';
			
 		// 상담신청폼 체크후 서버로 전송하기
  	function fCheck() {
      let submitFlag = 0;  //전송체크버튼. 값이 1이면 체크완료되어 전송처리함
      
      let pName = myForm.pName.value;
	  	let relation = myForm.relation.value;
	    let tel1 = myForm.tel1.value;
	    let tel2 = myForm.tel2.value;
	    let tel3 = myForm.tel3.value;
	    let tel = myForm.tel1.value + "-" + myForm.tel2.value + "-" + myForm.tel3.value;
	  	let cName = myForm.cName.value;
	  	let gender = myForm.gender.value;
	  	let birthday = myForm.birthday.value;
    	let content = myForm.content.value;
    	let check = $("#chk1").prop("checked");
    	
    	
      if(pName == "") {
	  		alert("보호자 성명을 입력하세요");
	  		myForm.pName.focus();
	  		return false;
	  	}
      else if(relation == "") {
	  		alert("아동과의 관계를 입력하세요");
	  		myForm.relation.focus();
	  		return false;
	  	}
	  	else if(cName == "") {
	  		alert("아동 성명을 입력하세요");
	  		myForm.cName.focus();
	  		return false;
	  	}
	  	else if(gender == "") {
	  		alert("아동의 성별을 선택하세요");
	  		myForm.gender.focus();
	  		return false;
	  	}
	  	else if(tel2 == "" || tel3 == "") {
	  		alert("연락처를 입력하세요");
	  		myForm.tel2.focus();
	  		return false;
	  	}	
	  	else if(check==false) {
	  		alert("개인정보 수집을 동의해 주세요");
	  		myForm.chk1.focus();
	  		return false;
	  	}	
	    else {
	    	  submitFlag = 1;
      }
      
      // 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
	    let postcode = myForm.postcode.value + " ";
			let roadAddress = myForm.roadAddress.value + " ";
			let detailAddress = myForm.detailAddress.value + " ";
			let extraAddress = myForm.extraAddress.value + " ";
			myForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress+ "/";
			// 전송 전 모든 체크가 끝나서 submitFlag가 1이 되면 서버로 전송
		  		myForm.tel.value = tel;
		  			
					myForm.submit();
    }
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main p-5" style="margin-left:250px">
<div class="container" style="padding:30px">
<div class="text-center"><img src="${ctp}/images/entrance.jpg"/></div>
	<form name="myForm" method="post" action="${ctp}/enInputOk.en" class="was-validated">
    <h4>보호자정보</h4>
    <br/>
    <div class="form-group">
      <label for="pName">성명</label>
      <input type="text" class="form-control" name="pName" id="pName" required autofocus/>
    </div>
    <div class="form-group">
      <label for="relation">아동과의 관계 : </label>
       <input type="text" class="form-control" name="relation" id="relation" autofocus/>
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
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">연락처 :</span> &nbsp;&nbsp;
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
     <h4>대상아동정보</h4>
    <div class="form-group">
      <label for="cName">성명 :</label>
      <input type="text" class="form-control" id="cName" name="cName" required />
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="남자" >남자
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="여자">여자
			  </label>
			</div>
    </div>
    <div class="form-group">
      <label for="birthday">생년월일</label>
      <c:set var="now" value="<%=new java.util.Date()%>"/>
      <fmt:formatDate var="birthday" value="${now}" pattern="yyyy-MM-dd"/>
			<input type="date" name="birthday" value="${birthday}" class="form-control"/>
    </div>
    <div class="text-center">
			    	※ 연령기준 ※
			만3세 (2017.01.01~2017.12.31)
			
			만4세 (2016.01.01~2016.12.31)
			
			만5세 (2015.01.01~2015.12.31)
    </div>
    <div class="form-group">
      <label for="content">하실말씀(참고사항)</label>
      <textarea rows="3" class="form-control" id="content" name="content"></textarea>
    </div>
    <div class="form-group">
    	<label for="chk1">개인정보수집동의</label>
    	<div>
	    	<textarea rows="4" cols="100">
1. 개인정보 수집 항목 
신청자 정보(이름, 생년월일, 주소, 전화번호, 이메일 등)
			
2. 개인정보의 수집 및 이용 목적
신청자 관리

3. 개인정보의 보유 및 이용기간
보유기간 : 처리목적 달성시

4. 개인정보 파기절차 및 방법
창릉어린이집은 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기 절차 및 방법은 입력하신 정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라 (3. 개인정보의 보유 및 이용기간) 일정 기간 저장된 후 파기됩니다. 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다. 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
	   		</textarea>
	   	</div>	
   		<label class="form-check-label">
		    <input type="checkbox" class="form-check-input" name="chk1" id="chk1" >위의 개인정보 이용에 동의합니다.
		  </label>
    </div>
    <div class="text-center">
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">신청</button> &nbsp;
	    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/';">돌아가기</button>
	    <input type="hidden" name="tel"/>
    </div>
  </form>
</div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>