<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int level = session.getAttribute("sLevel")==null? 99 : (int)session.getAttribute("sLevel");
%>
<!-- 줄였을 때 맨 위 로고 -->
<header class="w3-bar w3-top w3-hide-large w3-black">
  <div class="w3-bar-item w3-padding-24 w3-wide">창릉어린이집</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

 <!-- Top header -->
<header class="w3-container">
	<br/>
  <p class="w3-right">
<%		if(level != 99){ %>   
 		<a  href="<%=request.getContextPath()%>/memLogOut.mem"> 로그아웃 </a>|
 		<a  href="<%=request.getContextPath()%>/memUpdate.mem"> 마이페이지 </a>
<%		} else{ %> 
    <a href="<%=request.getContextPath()%>/memLogin.mem"> 로그인 </a>|
    <a href="<%=request.getContextPath()%>/memJoin.mem"> 회원가입 </a>|
    <a href="#"> ID/PW찾기 </a>
<%		} %>   
  </p>
	<br/>
</header>
<body class="w3-content" style="max-width:1200px">  
