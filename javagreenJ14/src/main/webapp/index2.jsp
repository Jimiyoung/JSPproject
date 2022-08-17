<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>창릉어린이집</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/include/bs4.jsp" %>
<!-- 	// Open and close sidebar -->
  <script>
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
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>

  <!-- Image header 메인-->
  <div class="w3-display-container">
    <img src="${ctp}/images/main.jpg" style="width:100%; margin-top:5%; margin-bottom:5%;">
  </div>
  
 <!-- Image header -->
  <div class="w3-display-container">
    <img src="${ctp}/images/main2.jpg" style="width:100%">
    <div class="row">
	    <div class="w3-display-topleft w3-text-white col-sm-4" style="padding:24px 48px"> 
	      <img src="${ctp}/images/news.jpg">
	      <div><a href="#"><img src="${ctp}/images/news2.jpg"></a></div>     	
	    </div>
	    <div class="w3-display w3-text-white col-sm-8" style="padding:24px 48px"> 
	      <img src="${ctp}/images/photo.jpg">
	      <div><a href="#">포토갤러리</a></div>     	
	    </div>
	  </div>
	</div>
      
  
<%@ include file="/include/footer.jsp" %>
</body>
</html>
