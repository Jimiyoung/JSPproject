<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>nuriUpdate.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
	  'use strict';
		let cnt = 1;
		
		function fileAppend() {
			cnt++;
			let fileBox ="";
			fileBox += '<div id="fBox'+cnt+'" class="form-group">';
			fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'"  class="form-control-file border" style="width:85%; float:left;"/>';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control ml-2" style="width:10%;"/>';
			fileBox += '</div>';
			$("#fileInsert").append(fileBox);
		}
		
		function deleteBox(cnt) {
			$("#fBox"+cnt).remove();	
		}
  	
		function fCheck() {
			let fName = $("#fName1").val();
			let maxSize = 1024*1024*20;
			let title = $("#title").val();
				
			/* if(fName.trim() == ""){
				alert("업로드할 파일을 선택하세요.");
				return false;
			} */
			
			if(title.trim()==""){
				alert("게시글 제목을 입력하세요.");
				document.getElementById("title").focus();
				return false;
			}
			/* else if(content.trim()==""){
				alert("게시글 내용을 입력하세요.");
				document.getElementById("content").focus();
				return false;
			} */
			
			let fileSize=0;
			for(let i=1; i<=cnt; i++){
				let imsiName = "fName"+i;
				fName = document.getElementById(imsiName).value;
				if(fName != ""){
					let ext = fName.substring(fName.lastIndexOf(".")+1)   //pdsTest/atom.jpg
			  	let uExt = ext.toUpperCase();
					fileSize += document.getElementById(imsiName).files[0].size;
					
					if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "HWP"){
			  		alert("업로드 가능한 파일은 'JPG/GIF/PNG/HWP' 입니다.")
			  		return false;
			  	}
				}
			}  //여기까지 확장자체크, 사이즈 누적
			
			if(fileSize > maxSize){
  			alert("업로드 가능한 파일의 최대용량은 20MByte 입니다.")
  			return false;
  		}
  		else {
  			myForm.fileSize.value = fileSize;
				myForm.submit();
  		}
  	}	
		// 첨부파일 삭제처리
		function nurifSNameDelete(idx,fSName) {
			let ans = confirm("첨부파일을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type  : "post",
				url   : "${ctp}/fSNameDelete.nu",
				data  : {
					idx : idx,
					fSName : fSName
				},
				success:function(data) {
					if(data == "fSNameDeleteOk") {
						alert("첨부파일 삭제 완료!");
						location.reload();
					}
					else {
						alert("첨부파일 삭제 실패~~");
					}
				},
				error : function() {
					alert("전송오류~~");
				}
			});
		}
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<div class="container">
  <form name="myForm" method="post" action="${ctp}/nuriUpdateOk.nu" enctype="multipart/form-data">
  	<h2>누리반 이야기 글 수정</h2>
  	<div class="form-group">작성자 : ${sNickName}</div>
  	<div class="form-group">
  		<label for="title">글제목 : </label>
  		<input type="text" name="title" id="title" value="${vo.title}"  class="form-control" required/>
  	</div> 
  	<div class="form-group">
  		<label for="content">글내용 : </label>
  		<textarea rows="15" name="content" id="content" class="form-control" required>${vo.content}</textarea>
  	</div>
  	<div class="form-group">
  		<label for="openSw">공개여부 : </label>&nbsp;
  		<c:if test="${vo.openSw=='공개'}">
	  		<input type="radio" name="openSw" value="공개" checked/>공개&nbsp;&nbsp;
	  		<input type="radio" name="openSw" value="비공개"/>비공개
  		</c:if>
  		<c:if test="${vo.openSw=='비공개'}">
	  		<input type="radio" name="openSw" value="공개"/>공개&nbsp;&nbsp;
	  		<input type="radio" name="openSw" value="비공개" checked/>비공개
  		</c:if>
  	</div>
  	<div class="form-group"> 
  		<input type="button" value="파일추가" onclick="fileAppend()" class="btn btn-info btn-sm mb-1"/>
  		<c:if test="${not empty vo.fName}">
	  		<c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
	  		&nbsp; 
	  		<c:forEach var="fName" items="${fNames}" varStatus="st">
	  		  ${st.count}. ${fName} / &nbsp;
	  		</c:forEach><a href="javascript:nurifSNameDelete('${vo.idx}','${vo.fSName}')" class="btn btn-danger btn-sm">삭제</a>
  		</c:if>
  		<c:if test="${empty vo.fName}">첨부파일없음</c:if>
  		<input type="file" name="fName1" id="fName1" class="form-control-file border" accept=".jpg,.gif,.png,.hwp"/>  <!-- accept="" 올릴 수 있는 파일만 볼 수 있도록-->
  	</div>
  	<div class="form-group text-center">
  		<input type="button" value="수정하기" onclick="fCheck()" class="btn btn-primary"/>&nbsp;&nbsp;
  		<input type="reset" value="다시쓰기"  class="btn btn-info"/>&nbsp;&nbsp;
  		<input type="button" value="돌아가기" onclick="location.href='${ctp}/nuriList.nu';" class="btn btn-secondary"/>
  	</div>
  	<input type="hidden" name="fileSize"/>
  	<input type="hidden" name="idx" value="${vo.idx}"/>
	  <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
	  <input type="hidden" name="imsiFname"/>
	  <input type="hidden" name="imsiFSname"/>
  </form>
</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>