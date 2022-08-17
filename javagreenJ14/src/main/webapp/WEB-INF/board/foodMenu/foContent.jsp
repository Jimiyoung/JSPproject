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
  <title>foContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <%@ include file="/include/bs4.jsp" %>
  <script>
//파일 삭제처리하기
	function foDelCheck(idx,fSName) {
		let ans = confirm("게시글을 삭제하시겠습니까?");
		
			if(!ans) return false;
			
			$.ajax({
				type : "post",
				url : "${ctp}/foDeleteOk.fo",
				data : {
					idx : idx,
					fSName : fSName
					},
				success:function(data){
					if(data=='1'){
						alert("식단 게시글이 삭제되었습니다.");
						location.href="${ctp}/foList.fo";
					}
					else{
						alert("식단 게시글 삭제 실패");
					}
				},
				error : function(){
					alert("전송오류");
				}
			});
	}
  	
  //다운로드 수 증가처리
  	function downNumCheck(idx) {
			$.ajax({
				type : "post",
				url : "${ctp}/foDownNum.fo",
				data : {idx:idx},
				success : function(){
					location.reload();
				},
				error : function(){
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
  <h2 class="text-center">식단게시판 - 글 내 용 보 기 </h2>
  <br/>
  <table class="table table-bordered">
	  <tr>
	  	<th>제목</th>
	  	<td colspan="5">${vo.title}</td>
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
  		<th>파일명</th>
  		<td>${vo.fName}</td>
  		<th>다운로드수</th>
  		<td>${vo.downNum}</td>
  		<th>파일크기</th>
  		<td><fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0"/>KByte</td>
  	</tr>
	  <tr>
	  	<th>글 내용</th>
	  	<td colspan="5" style="height:220px">
	  		<div class="text-right">
		  		<c:if test="${vo.openSw =='공개' || sMid == vo.mid || sLevel == 0}">
	  					<%-- ${vo.fName}<br/> --%>
	  					<c:set var="fNames" value="${fn:split(vo.fName,'/')}"/> <!-- 파일을 각각 분리 -->
	  					<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/> <!-- 파일을 각각 분리 -->
	  					<c:forEach var="fName" items="${fNames}" varStatus="st">
	  						첨부파일 다운로드[<a href="${ctp}/data/foodMenu/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})"> ${fName} </a>]<br/>	
	  					</c:forEach>
	  				(<fmt:formatNumber value="${vo.fSize / 1024}" pattern="#,##0"/>KByte)
	  			</c:if>
  			</div>
	  	<hr/>
	  		${fn:replace(vo.content,newLine,"<br/>")}
			</td>	  
	  </tr>	
	  <tr>
	  	<td colspan="6" class="text-center">
		  	<c:if test="${flag=='s'}">
		  		<input type="button" value="돌아가기" onclick="location.href='foSearch.fo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-primary"/>
		  	</c:if>	
		  	<c:if test="${flag!='s'}">
		  		<input type="button" value="돌아가기" onclick="location.href='foList.fo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/>
		  	</c:if>	
	  		<c:if test="${sLevel==0 || sMid==vo.mid}">
		  		<input type="button" value="수정" onclick="location.href='foUpdate.fo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-success"/>
		  		<input type="button" value="삭제" onclick="foDelCheck('${vo.idx}','${vo.fSName}')" class="btn btn-danger"/>
	  		</c:if>
	  	</td>
	  </tr>	
  </table>
	<!-- 이전글/다음글 처리 -->
	<table class="table table-borderless">
		<tr>
			<td>
			<c:if test="${nextVo.nextIdx !=0}">
				<a href="foContent.fo?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}"><b>▲ 다음글 : ${nextVo.nextTitle}</b></a><br/>
			</c:if>	
			<c:if test="${preVo.preIdx !=0}">
				<a href="foContent.fo?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}"><b>▼ 이전글 : ${preVo.preTitle}</b></a><br/>
			</c:if>	
			</td>
		</tr>
	</table>
	<br/>
		<input type="hidden" name="foIdx" value="${vo.idx}"/>
		<input type="hidden" name="mid" value="${sMid}"/>  <!-- vo, s 둘다 가능  -->
		<input type="hidden" name="nickName" value="${sNickName}"/> <!-- vo, s 둘다 가능  -->
</div>	
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>