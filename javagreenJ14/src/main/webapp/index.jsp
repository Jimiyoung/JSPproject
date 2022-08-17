<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>창릉어린이집</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/include/bs4.jsp" %>
</head>
<body class="w3-content" style="max-width:1200px">  
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>

<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  <!-- Image header 메인-->
  <div class="w3-display-container">
    <img src="${ctp}/images/main.jpg" style="width:100%; margin-top:5%; margin-bottom:5%;">
  </div>
    <img src="${ctp}/images/main2.jpg" style="width:100%;margin-bottom:5%;">
</div>

<%@ include file="/include/footer.jsp" %>

</body>
</html>
