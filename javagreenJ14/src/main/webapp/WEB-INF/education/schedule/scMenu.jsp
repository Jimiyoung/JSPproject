<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>scMenu.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	$(document).ready(function(){  /* 본문을 읽고 실행. 안그럼 읽기 전 먼저 실행됨 */
  		$("#scheduleInputHidden").hide();
  	});
  	
  	//일정 등록폼 보여주기
  	function scheduleInputView() {
			let scheduleInput =	'<hr/><div id="scheduleInputForm">';
			scheduleInput +='<form name="myForm">';
			scheduleInput +=	'<table class="table bordered">';
			scheduleInput +=	'<tr><th>일정분류</th><td>';
			scheduleInput +=	'<div class="form-group">';
			scheduleInput +=	'<select name="part" class="form-control">';
			scheduleInput +=	'<option value="행사">행사</option>';
			scheduleInput +=	'<option value="현장학습">현장학습</option>';
			scheduleInput +=	'<option value="안전교육">안전교육</option>';
			scheduleInput +=	'<option value="부모교육">부모교육</option>';
			scheduleInput +=	'<option value="기타">기타</option>';
			scheduleInput +=	'</select>';
			scheduleInput +=	'</div>';
			scheduleInput +=	'</td></tr>';
			scheduleInput +=	'<tr><th>제목</th><td>';
			scheduleInput +=	'<input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" autofocus required />';
			scheduleInput +=	'</td></tr>';
			scheduleInput +=	'<tr><th>장소</th><td>';
			scheduleInput +=	'<input type="text" name="place" placeholder="장소를 입력하세요" class="form-control" autofocus required />';
			scheduleInput +=	'</td></tr>';
			scheduleInput +=	'<tr><th>시간</th><td>';
			scheduleInput +=	'<input type="text" name="stime" placeholder="시간을 입력하세요" class="form-control" autofocus required />';
			scheduleInput +=	'</td></tr>';
			scheduleInput +=	'<tr><th>상세내용</th><td>';
			scheduleInput +=	'<textarea name="content" rows="3" class="form-control"></textarea>';
			scheduleInput +=	'</td></tr>';
			scheduleInput +=	'</table>';
			scheduleInput +=	'<div>';
			scheduleInput +=	'<input type="button" value="일정등록" onclick="scheduleInputOk()" class="btn btn-secondary"/>';
			scheduleInput +=	'</div>';
			scheduleInput +=	'</form></div>';

			$("#scheduleInputView").hide();
			$("#scheduleInputHidden").show();
			$("#demo").slideDown(50000);
			$("#demo").html(scheduleInput);	
		}
  	
  	// 일정 등록창 닫기
  	function scheduleInputHidden() {
			$("#scheduleInputForm").hide();
			$("#scheduleInputForm").slideUp(50000);
			$("#scheduleInputHidden").hide();
			$("#scheduleInputView").show();
		}
  	
  	//일정등록하기(ajax처리)
  	function scheduleInputOk() {
			let part = myForm.part.value;
			let title = myForm.title.value;
			let place = myForm.place.value;
			let stime = myForm.stime.value;
			let content = myForm.content.value;
			
			if(title ==""){
				alert("제목을 입력하세요.");
				myForm.title.focus();
				return false;
			}
			else if(place ==""){
				alert("장소를 입력하세요.");
				myForm.place.focus();
				return false;
			}
			else if(stime ==""){
				alert("시간을 입력하세요.");
				myForm.stime.focus();
				return false;
			}
			let query={
					nickName : '${sNickName}',
					ymd : '${ymd}',
					part : part,
					title : title,
					stime : stime,
					place : place,
					content : content
			}
			
			$.ajax({
				type:"post",
				url:"${ctp}/scheduleInputOk",
				data:query,
				success:function(data){
					if(data=="scheduleInputOk"){
						alert("일정이 등록되었습니다.");
						location.reload();
					}
					else{
						alert("일정등록 오류");
					}
				},
				error:function(){
					alert("전송오류");
				}
			});
		}
  	
  	//일정관리 내용보기
  	function newWin(idx) {
			let url = "scContent.sc?idx="+idx+"&ymd=${ymd}";
			window.open(url,"newWin","width=500px,height=800px");
		}
  	
  	//일정 삭제
  	function delCheck(idx) {
			let ans = confirm("일정을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type : "post",
				url : "${ctp}/scheduleDeleteOk",
				data : {idx : idx},
				success:function(data){
					if(data=="scheduleDeleteOk"){
						alert("일정이 삭제되었습니다.");
						location.reload();
					}
					else{
						alert("일정삭제 실패");
					}
				},
				error:function(){
					alert("전송오류");
				}
			});
		}
  	
  	//일정 수정
  	function updateCheck(idx) {
			let url = "scUpdate.sc?idx="+idx+"&ymd=${ymd}";
			window.open(url,"newWin","width=500px,height=800px");
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
<div class="w3-main" style="margin-left:250px">
<p><br/></p>
<div class="container">
  <h4><font color="blue"><b>${ymd}</b></font>일정 입니다.</h4>
  <p>오늘의 일정은 총 <font color="red"><b>${scheduleCnt}</b></font>건 있습니다.</p>
  <hr/>
  <div>
	  <c:if test="${sLevel==0}">
	  	<input type="button" value="일정등록" onclick="scheduleInputView()" id="scheduleInputView" class="btn btn-info"/>
	  	<input type="button" value="등록창닫기" onclick="scheduleInputHidden()" id="scheduleInputHidden" class="btn btn-info"/>
	  </c:if>
	  <%-- <input type="button" value="돌아가기" onclick="location.href='${ctp}/schedule.sc?yy=${fn:split(ymd,'-')[0]}&mm=${fn:split(ymd,'-')[1]-1}';" id="scheduleInputHidden" class="btn btn-info"/> --%>
  </div>
  <div id="demo"></div>
  <hr/>
  <c:if test="${scheduleCnt != 0}">
  	<table class="table table-hover text-center">
  		<tr id="title">
  			<th>번호</th>
  			<th>제목</th>
  			<th>분류</th>
  			<th>비고</th>
  		</tr>
  		<c:forEach var="vo" items="${vos}" varStatus="st">
  			<tr>
  				<td>${st.count}</td>
  				<td><a href="javascript:newWin(${vo.idx})">${vo.title}</a></td>
  				<td>${vo.part}</td>
  				<td>
  				<c:if test="${sLevel==0}">
  					<input type="button" value="수정" onclick="updateCheck('${vo.idx}')" class="btn btn-secondary btn-sm"/>
  					<input type="button" value="삭제" onclick="delCheck('${vo.idx}')" class="btn btn-danger btn-sm"/>
  				</c:if>
  				</td>
  			</tr>
  		</c:forEach>
  		<tr><td colspan="4" class="p-0"></td></tr>
  	</table>
  </c:if>
  <input type="button" value="돌아가기" onclick="location.href='${ctp}/schedule.sc?yy=${fn:split(ymd,'-')[0]}&mm=${fn:split(ymd,'-')[1]-1}';" class="btn btn-info"/>
</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>