<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>nuriInput.jsp</title>
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
				
			if(title.trim()==""){
				alert("게시글 제목을 입력하세요.");
				document.getElementById("title").focus();
				return false;
			}
			else if(content == ""){
				alert("게시글 내용을 입력하세요.");
				document.getElementById("content").focus();
				return false;
			}
			
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
  </script>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<div class="w3-main" style="margin-left:250px">
<div class="container">
  <form name="myForm" method="post" action="${ctp}/nuriInputOk.nu" enctype="multipart/form-data">
  	<h2>누리반 이야기 등록</h2>
  	<div class="form-group">작성자 : ${sNickName}</div>
  	<div class="form-group">
  		<label for="title">글제목 : </label>
  		<input type="text" name="title" id="title" class="form-control" required/>
  	</div> 
  	<div class="form-group">
  		<label for="content">글내용 : </label>
  		<textarea rows="15" name="content" id="content" class="form-control" required></textarea>
  	</div>
  	<div class="form-group">
  		<label for="openSw">공개여부 : </label>&nbsp;
  		<input type="radio" name="openSw" value="공개" checked/>공개&nbsp;&nbsp;
  		<input type="radio" name="openSw" value="비공개"/>비공개
  	</div>
  	<div class="form-group">
  		<input type="button" value="파일추가" onclick="fileAppend()" class="btn btn-info btn-sm mb-1"/>
  		<input type="file" name="fName1" id="fName1" class="form-control-file border" accept=".jpg,.gif,.png,.hwp"/>  <!-- accept="" 올릴 수 있는 파일만 볼 수 있도록-->
  	</div>
  	<div class="form-group" id="fileInsert"></div>
  	<div class="form-group text-center">
  		<input type="button" value="등록하기" onclick="fCheck()" class="btn btn-primary"/>&nbsp;&nbsp;
  		<input type="reset" value="다시쓰기"  class="btn btn-info"/>&nbsp;&nbsp;
  		<input type="button" value="돌아가기" onclick="location.href='${ctp}/nuriList.nu';" class="btn btn-secondary"/>
  	</div>
  	<input type="hidden" name="fileSize"/>
  	<input type="hidden" name="${sMid}"/>
  	<input type="hidden" name="${sNickName}"/>
  </form>
</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>