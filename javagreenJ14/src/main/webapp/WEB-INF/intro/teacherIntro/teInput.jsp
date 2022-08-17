<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>foInput.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
	  'use strict';
  	
		function fCheck() {
			let fName = $("#fName1").val();
			let maxSize = 1024*1024*20;
			let teacherName = $("#teacherName").val();
			let teacherBan = $("#teacherBan").val();
			let content = $("#content").val();
				
			if(fName.trim() == ""){
				alert("업로드할 파일을 선택하세요.");
				return false;
			}
			else if(teacherName.trim()==""){
				alert("교사 이름을 입력하세요.");
				document.getElementById("teacherName").focus();
				return false;
			}
			else if(teacherBan ==""){
				alert("담당학급을 선택하세요.");
				document.getElementById("teacherBan").focus();
				return false;
			}
			else if(content.trim()==""){
				alert("인사말을 입력하세요.");
				document.getElementById("content").focus();
				return false;
			}
			
			let fileSize = 0;
				
			if(fName1 != ""){
				let ext = fName.substring(fName.lastIndexOf(".")+1)   //pdsTest/atom.jpg
		  	let uExt = ext.toUpperCase();
				fileSize = document.getElementById("fName1").files[0].size;
					
					if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG"){
			  		alert("업로드 가능한 파일은 'JPG/GIF/PNG' 입니다.")
			  		return false;
			  	}
				}
			//여기까지 확장자체크, 사이즈 누적
			
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
  <form name="myForm" method="post" action="${ctp}/teInputOk.te" enctype="multipart/form-data">
  	<h2>교 사 등 록</h2>
  	<div class="form-group">
  		<input type="file" name="fName1" id="fName1" class="form-control-file border" accept=".jpg,.gif,.png"/>  <!-- accept="" 올릴 수 있는 파일만 볼 수 있도록-->
  	</div>
  	<div class="form-group">작성자 : ${sNickName}</div>
  	<div class="form-group">
  		<label for="teacherName">교사이름 : </label>
  		<input type="text" name="teacherName" id="teacherName" placeholder="교사이름을 입력하세요." class="form-control" required/>
  	</div> 
  	<div class="form-group">
  		<label for="teacherBan">담당학급 : </label>
	  		<div class="input-group-append">
			    <select name="teacherBan" class="custom-select">
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
  		<label for="content">인사말 : </label>
  		<textarea rows="3" name="content" id="content" class="form-control"></textarea>
  	</div>
  	<div class="form-group">
  		<label for="openSw">공개여부 : </label>&nbsp;
  		<input type="radio" name="openSw" value="공개" checked/>공개&nbsp;&nbsp;
  		<input type="radio" name="openSw" value="비공개"/>비공개
  	</div>
  	<div class="form-group text-center">
  		<input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-primary"/>&nbsp;&nbsp;
  		<input type="reset" value="다시쓰기"  class="btn btn-info"/>&nbsp;&nbsp;
  		<input type="button" value="돌아가기" onclick="location.href='${ctp}/teList.te';" class="btn btn-secondary"/>
  	</div>
  	<input type="hidden" name="fileSize"/>
  	<input type="hidden" name="${sMid}"/>
  </form>
</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>