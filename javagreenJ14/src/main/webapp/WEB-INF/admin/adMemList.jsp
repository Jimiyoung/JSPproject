<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>adMemList.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	//등급변경
    function levelChange() {
    	alert("등급변경 버튼을 클릭하시면 선택된 등급으로 변환됩니다.");
    }
  	//학급변경
    function banChange(){
    	alert("학급변경 버튼을 클릭하시면 선택된 학급으로 변환됩니다.");
    }
    
    function userDelCheck(idx) {
    	let ans = confirm("정말 회원에서 삭제처리하시겠습니까?");
    	if(ans) location.href="${ctp}/memUserDelete.mem?idx="+idx;
    }
    
  	// 부분자료 검색처리(반)
  	function banCheck() {
			let ban = banCheckForm.ban.value;
			location.href="${ctp}/adMemList.ad?ban="+ban;
		}
  </script>
  <style>
  	#title{
  		background-color:#fafafa;
  	}
  </style>
</head>
<body class="w3-content" style="max-width:1200px"> 
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="container text-center" style="padding:30px">
<div class="w3-main" style="margin-left:250px">
  <h2 class="text-center">전체 회원 리스트 (${ban})</h2>
  <br/> <br/>
  <table class="table table-borderless">
  	<tr>
  		<td class="text-left" style="width:20%">
  			<form name="banCheckForm">
  				<select name="ban" onchange="banCheck()" class="form-control">
  					<option value="전체" ${ban== '전체' ? 'selected' : ''}>전체</option>
  					<option value="누리반" ${ban== '누리반' ? 'selected' : ''}>누리반</option>
  					<option value="도담반" ${ban== '도담반' ? 'selected' : ''}>도담반</option>
  					<option value="새솔반" ${ban== '새솔반' ? 'selected' : ''}>새솔반</option>
  					<option value="은솔반" ${ban== '은솔반' ? 'selected' : ''}>은솔반</option>
  					<option value="해든실반" ${ban== '해든실반' ? 'selected' : ''}>해든실반</option>
  					<option value="하나울반" ${ban== '하나울반' ? 'selected' : ''}>하나울반</option>
  				</select>
  			</form> 
  		</td>
  	</tr>
  </table>
  <table class="table table-hover text-center">
    <tr id="title">
    	<th>번호</th>
    	<th>아이디</th>
    	<th>성명</th>
    	<th>닉네임</th>
    	<th>자녀이름</th>
    	<th>자녀학급</th>
    	<th>등급</th>
    	<th>활동유무</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${st.count}</td>
    	  <td><a href="${ctp}/memInfor.mem?mid=${vo.mid}">${vo.mid}</a></td>
    	  <td>${vo.name}</td>
    	  <td>${vo.nickName}</td>
    	  <td>${vo.childName}</td>
    	  <td>
    	  	<form name="banForm" method="post" action="${ctp}/adMemBanChange.ad">   
	    	    <select name="ban" onchange="banChange()">
	    	      <option value="누리반" <c:if test="${vo.ban == '누리반'}">selected</c:if>>누리반</option>
	    	      <option value="도담반" <c:if test="${vo.ban == '도담반'}">selected</c:if>>도담반</option>
	    	      <option value="새솔반" <c:if test="${vo.ban == '새솔반'}">selected</c:if>>새솔반</option>
	    	      <option value="은솔반" <c:if test="${vo.ban == '은솔반'}">selected</c:if>>은솔반</option>
	    	      <option value="해든실반" <c:if test="${vo.ban == '해든실반'}">selected</c:if>>해든실반</option>
	    	      <option value="하나울반" <c:if test="${vo.ban == '하나울반'}">selected</c:if>>하나울반</option>
	    	    </select>
	    	    <input type="submit" value="학급변경" class="btn btn-warning btn-sm"/>
	    	    <input type="hidden" name="idx" value="${vo.idx}"/>
    	    </form>
    	  </td>
    	  <td>
    	    <form name="levelForm" method="post" action="${ctp}/adMemLevelChange.ad">   
	    	    <select name="level" onchange="levelChange()">
	    	      <option value="0" <c:if test="${vo.level == 0}">selected</c:if>>관리자</option>
	    	      <option value="1" <c:if test="${vo.level == 1}">selected</c:if>>준회원</option>
	    	      <option value="2" <c:if test="${vo.level == 2}">selected</c:if>>학부모</option>
	    	      <option value="3" <c:if test="${vo.level == 3}">selected</c:if>>교사</option>
	    	    </select>
	    	    <input type="submit" value="등급변경" class="btn btn-success btn-sm"/>
	    	    <input type="hidden" name="idx" value="${vo.idx}"/>
    	    </form>
    	  </td>
    	  <td>
    	    <c:if test="${vo.userDel == 'OK'}"><font color="red">탈퇴신청</font></c:if>
    	    <c:if test="${vo.userDel != 'OK'}">활동중</c:if>
    	    <c:if test="${vo.applyDiff >= 30 and vo.userDel == 'OK'}"><font color="blue"><a href="javascript:userDelCheck(${vo.idx})" title="30일경과">*</a></font></c:if>
    	  </td>
    	</tr>
    	<%-- <c:set var="curScrStartNo" value="${curScrStartNo-1}"/> --%>
    </c:forEach>
    <tr><td colspan="8"></td></tr>
  </table>

<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
	<ul class="pagination justify-content-center" >
	  <c:if test="${pag > 1}"> 
	  	<li class="page-item"><a href="adMemList.ad?pag=1&pageSize=${pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${curBlock > 0}">
	  	<li class="page-item"><a href="adMemList.ad?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
	    <c:if test="${i <= totPage && i == pag}">
	      <li class="page-item active"><a href="adMemList.ad?pag=${i}&pageSize=${pageSize}" class="page-link bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= totPage && i != pag}">
	      <li class="page-item"><a href='adMemList.ad?pag=${i}&pageSize=${pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}">
	    <li class="page-item"><a href="adMemList.ad?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pag != totPage}">
	  	<li class="page-item"><a href="adMemList.ad?pag=${totPage}&pageSize=${pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
	</ul>
</div>
<!-- 블록 페이징 처리 끝 -->
</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</html>