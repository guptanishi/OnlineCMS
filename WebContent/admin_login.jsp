<%@page import="sun.misc.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Login</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">

</head>
<%!
	String msg = "";
%>
<%
	if(request.getParameter("s") != null){
		msg = request.getParameter("s");
		if(msg.equals("invalid")){
			msg = "Username Password Mismatch!";
		}else if(msg.equals("false")){
			msg = "Please Login First";
		}
	}
%>
<body onresize="hadj()" onload="display()">
<div id="back" style="width:100%; height:100%; position: fixed; display:none; z-index:1; min-width: 500px;">
<nav id="navibar" class="navbar navbar-default" role="navigation" style="display:none;" >
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">CMS(Online Exams)</a>
	<a class="navbar-brand" style="user-select:none;">&gt;</a>
	<a class="navbar-brand" href="#" >Administrator Login</a>
  </div>

  
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background-color:#F1EEEE">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" style="color:#000000" >Home</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
<div id="login" style="margin:200px auto; display:none; width:350px; text-align:center; padding:10px; #dddddd; border-radius:10px; box-shadow: 0px 0px 20px #222222; border:1px solid #999999;">
<div id="back2" style="position:absolute; box-shadow: inset 0px 0px 10px #ffffff; width:350px; height:231px; margin:-10px; opacity:0.7; background-color:#cfcfcf; padding:0px; z-index:-1; border-radius:10px; "></div>
<div style="position: absolute; color: #ff0000; text-align: center; width: 330px; font-weight: bold;"><%=msg %></div>
<div style=" background:url('images/admin_login.gif'); background-size:150px 80px; background-repeat:no-repeat; height:77px; max-height:100px; border-radius:30px; max-width:200px;"></div>
<form action="AdminLoginController" method="post">
<div class="input-group"  style="width:310px; margin:10px;">
  <span class="input-group-addon"><div style="background-image: url('images/user_icon.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
  <input type="text" class="form-control" placeholder="Username" name="uname">
  <span class="input-group-addon"><div style="background-image: url('images/quest.png'); background-size: 20px 20px; height: 20px; width: 20px;" data-toggle="tooltip" id="ureq" title="username required" data-placement="right"></div></span>
</div>

<div class="input-group" style="width:310px; margin:10px;">
	<span class="input-group-addon" ><div style="background-image: url('images/pwd_icon.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
	<input type="password" class="form-control" placeholder="Password" name="pwd">
	<span class="input-group-addon" ><div style="background-image: url('images/quest.png'); background-size: 20px 20px; height: 20px; width: 20px;" data-toggle="tooltip" id="preq" title="password required" data-placement="right"></div></span>
 
</div>

<div style="text-align:right; width:310px;">
	<input type="submit"  class="btn btn-info" value="submit"  >
</div>
 </form>
 
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/tooltip.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
<% msg = ""; %>
</html>