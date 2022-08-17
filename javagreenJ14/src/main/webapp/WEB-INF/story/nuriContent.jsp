<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>nuriContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <%@ include file="/include/bs4.jsp" %>
  <script>
  //게시글 삭제
	function nuriDelCheck(idx,fSName) {
		let ans = confirm("게시글을 삭제하시겠습니까?");
		
			if(!ans) return false;
			
			$.ajax({
				type : "post",
				url : "${ctp}/nuriDeleteOk.nu",
				data : {
					idx : idx,
					fSName : fSName
					},
				success:function(data){
					if(data=='NuriDeleteOk'){
						alert("게시글이 삭제되었습니다.");
						location.href="${ctp}/nuriList.nu";
					}
					else{
						alert("게시글 삭제 실패");
					}
				},
				error : function(){
					alert("전송오류");
				}
			});
	}
  	
 // 좋아요 수
  	function goodCheck() {
		$.ajax({
			type : "post",
			url : "${ctp}/nuriGoodCount",
			data : {idx : ${vo.idx}},
			success : function() {
				location.reload();
			},
			error : function() {
				alert("전송오류");
			}
		});
	}

  //댓글 입력처리
  	function replyCheck() {
			let content=$("#content").val();
			if(content.trim()==""){
				alert("댓글을 입력하세요.");
				$("#content").focus();
				return false;
			}
			
			let query={
				nuriIdx : ${vo.idx},
				mid : '${sMid}',
				nickName : '${sNickName}',
				content : content
			}
			$.ajax({
				type : "post",
				url : "${ctp}/nuriReplyInput",
				data : query,
				success : function(data) {
					if(data=="1"){
						location.reload();
					}
					else {
						alert("이런, 댓글 입력 실패");
					}
				},
				error : function() {
					alert("전송오류");
				}
			});
		} 
 
// 댓글 삭제 (ajax)
  	function replyDelCheck(idx) {
			let ans=confirm("현재 댓글을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type : "post",
				url : "${ctp}/nuriReplyDeleteOk.nu",
				data : {idx : idx},
				success : function(data) {
					if(data == "1"){
						location.reload();
					}
					else{
						alert("댓글 삭제 실패");
					}
				},
				error : function() {
					alert("전송 실패");
				}
			});
		}
		
// 댓글 수정
		function nuriReplyUpdate(idx){
			let content = $("#content").val();
			let query={
				idx : idx,
				content : content,
			}
			$.ajax({
				type:"post",
				url:"${ctp}/nuriReplyUpdateOk.nu",
				data : query,
				success: function(data) {
					if(data=="1"){
						alert("댓글이 수정되었습니다.");
						location.href="${ctp}/nuriContent.nu?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
					}
					else{
						alert("댓글 수정 실패");
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  </script>
  <style>
  	th{
  		background-color:#eee;
  		text-align:center;
  	}
  </style>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<p><br/></p>
<div class="container">
  <h2 class="text-center">누리이야기</h2>
  <br/>
  <table class="table table-bordered">
	  <tr>
	  	<th>제목</th>
	  	<td colspan="3">${vo.title}</td>
	  	<th>좋아요</th>
	  	<td><a href="javascript:goodCheck()">❤</a>(${vo.good})
	  </tr>
	  <tr>
	  	<th>작성자</th>
	  	<td>${vo.nickName}</td>
	  	<th>등록일</th>
	  	<td>${fn:substring(vo.wDate,0,19)}</td>
	  	<th>조회수</th>
	  	<td>${vo.readNum}</td>
	  </tr>
	  <tr>
	  	<th>글 내용</th>
	  	<td colspan="5" style="height:220px">
	  		<div>
		  		<c:if test="${vo.openSw =='공개' || sMid == vo.mid || sLevel == 0}">
	  				<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
							<c:forEach var="fSName" items="${fSNames}" varStatus="st">
								<c:set var="fSNameLen" value="${fn:length(fSName)}"/>
								<c:set var="ext" value="${fn:substring(fSName,fSNameLen-3,fSNameLen)}"/> <!-- 확장자  -->
								<c:set var="extUpper" value="${fn:toUpperCase(ext)}"/> <!-- 확장자를 대문자로 바꿈  -->
								<c:if test="${extUpper=='JPG' || extUpper=='GIF' ||extUpper=='PNG'}">
									<img src="${ctp}/data/nuri/${fSName}" width="500px"/>
								</c:if>
						</c:forEach>
	  			</c:if>
  			</div>
	  		${fn:replace(vo.content,newLine,"<br/>")}
			</td>	  
	  </tr>
	   <tr>
	  	<td colspan="6" class="text-center">
		  	<c:if test="${flag=='s'}">
		  		<input type="button" value="돌아가기" onclick="location.href='nuriSearch.nu?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-secondary"/>
		  	</c:if>	
		  	<c:if test="${flag!='s'}">
		  		<input type="button" value="돌아가기" onclick="location.href='nuriList.nu?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
		  	</c:if>	
	  		<c:if test="${sLevel==0 || sMid==vo.mid}">
		  		<input type="button" value="수정" onclick="location.href='nuriUpdate.nu?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
		  		<input type="button" value="삭제" onclick="nuriDelCheck('${vo.idx}','${vo.fSName}')" class="btn btn-secondary"/>
	  		</c:if>
	  	</td>
	  </tr>	
	 </table>
	 
	 <!-- 이전글/다음글 처리 -->
		<table class="table table-borderless">
			<tr>
				<td>
				<c:if test="${nextVo.nextIdx !=0}">
					<a href="nuriContent.nu?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}"><b>▲ 다음글 : ${nextVo.nextTitle}</b></a><br/>
				</c:if>	
				<c:if test="${preVo.preIdx !=0}">
					<a href="nuriContent.nu?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}"><b>▼ 이전글 : ${preVo.preTitle}</b></a><br/>
				</c:if>	
				</td>
			</tr>
		</table> 
		
	<!-- 댓글 처리(출력, 입력) -->
	<!-- 댓글 출력 처리 -->
	<table class="table table-hover text-center">
		<tr>
			<th>작성자</th>
			<th>댓글내용</th>
			<th>작성일자</th>
		</tr>
		<c:forEach var="replyVo" items="${replyVos}">
			<tr>
				<td>
					${replyVo.nickName}
				</td>
				<td class="text-left">
					${fn:replace(replyVo.content,newLine,"<br/>")}
					<c:if test="${replyVo.wNdate <=24}"><img src="${ctp}/images/new.gif"></c:if>
					<c:if test="${sMid == replyVo.mid || sLevel==0}">
						(<a href="nuriContent.nu?replyIdx=${replyVo.idx}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">수정 | </a>
						<a href="javascript:replyDelCheck(${replyVo.idx})">삭제</a>)
					</c:if>
				</td>
				<td>
					<c:if test="${replyVo.wNdate <=24}">${fn:substring(replyVo.wDate,11,19)}</c:if>
					<c:if test="${replyVo.wNdate >24}">${fn:substring(replyVo.wDate,0,10)}</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 댓글 입력 처리 -->
	<form name="replyForm" method="post" action="nuriReplyInput.nu">
		<table class="table text-center">
			<tr>
				<td style="width:85%" class="text-left">
					댓글  <textarea rows="1" name="content" id="content"  placeholder="댓글을 입력해보세요." class="form-control">${replyContent}</textarea>
				</td>
				<td style="width:15%">
					<br/>
					<p>작성자 : ${sNickName}</p>
					<p>
						<c:if test="${empty replyContent}">
							<input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info"/>
						</c:if>	
						<c:if test="${!empty replyContent}">
							<input type="button" value="댓글수정하기" onclick="nuriReplyUpdate(${replyIdx})"class="btn btn-info"/>
						</c:if>	
					</p>
				</td>
			</tr>
		</table>
		<input type="hidden" name="nuriIdx" value="${vo.idx}"/>
		<input type="hidden" name="mid" value="${sMid}"/>  <!-- vo, s 둘다 가능  -->
		<input type="hidden" name="nickName" value="${sNickName}"/> <!-- vo, s 둘다 가능  -->
	</form>
	
	<br/>
	<br/>
</div>	
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>