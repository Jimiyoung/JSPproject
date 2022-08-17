<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>창릉어린이집</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/include/bs4.jsp" %>
	<script>
		// Accordion 
		function myAccFunc1() {
		  var x = document.getElementById("demoAcc1");
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else {
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
		function myAccFunc2() {
		  var x = document.getElementById("demoAcc2");
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else {
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
		function myAccFunc3() {
		  var x = document.getElementById("demoAcc3");
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else {
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
		function myAccFunc4() {
		  var x = document.getElementById("demoAcc4");
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else {
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
		function myAccFunc5() {
		  var x = document.getElementById("demoAcc5");
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else {
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
		
		// Click on the "Jeans" link on page load to open the accordion for demo purposes
		document.getElementById("myBtn1").click();
		document.getElementById("myBtn2").click();
		document.getElementById("myBtn3").click();
		document.getElementById("myBtn4").click();
		document.getElementById("myBtn5").click();
		
		
		// Open and close sidebar
		function w3_open() {
		  document.getElementById("mySidebar").style.display = "block";
		  document.getElementById("myOverlay").style.display = "block";
		}
		 
		function w3_close() {
		  document.getElementById("mySidebar").style.display = "none";
		  document.getElementById("myOverlay").style.display = "none";
		}
	</script>
</head>
<body class="w3-content" style="max-width:1200px">
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>

<!-- !PAGE CONTENT! 메인창 container역할-->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens 잘 모르겠음 -->
 <div class="w3-hide-large" style="margin-top:83px"></div>
  
 

  <!-- Image header -->
  <div><img src="${ctp}/images/main.jpg" style="width:100%;"></div>
  
  <div class="container" style="background-image:url(${ctp}/images/main2.jpg)">
	  <div class="col">
	  	<img src="${ctp}/images/news.jpg"/>
	  	<h3><b><font color="white">공지사항</font></b></h3>
	  	<a href="#"><img src="${ctp}/images/plus.jpg"></a>
	  	
	  
	  	<img src="${ctp}/images/photo.jpg"/>
	  	<h3><b><font color="white">포토갤러리</font></b></h3>
	  	<a href="#"><img src="${ctp}/images/plus.jpg"></a>
	  	
	  </div>
  </div>
  
<%@ include file="/include/footer.jsp" %>
</body>
</html>
