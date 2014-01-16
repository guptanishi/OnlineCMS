<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<%!
	String msg = "";
%>
<%
	if(request.getParameter("t") != null){
		msg = request.getParameter("t");
		if(msg.equals("invalid")){
			msg = "Username Password Mismatch!";
		}else if(msg.equals("false")){
			msg = "Please Login First";
		}
	}

  
%>
<script type="text/javascript" >
function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

function check()
{
        if (getUrlVars()["t"] == undefined) 
        {
        	document.getElementById("myTab").childNodes[3].className = "";
       		document.getElementById("myTab").childNodes[1].className = "active";
       		document.getElementById("home").className = "tab-pane fade active in";
       		document.getElementById("profile").className = "tab-pane fade";
        }
        else
       	{
        	document.getElementById("myTab").childNodes[3].className = "active";
       		document.getElementById("myTab").childNodes[1].className = "";
       		document.getElementById("home").className = "tab-pane fade";
       		document.getElementById("profile").className = "tab-pane fade active in";
        }
}
</script>
</head>
<body onload="check()">

<div id="back" style="width:100%; height:100%; position: fixed; z-index:1; min-width: 1000px;">
<nav class="navbar navbar-default" role="navigation" style="min-width: 1000px;" >
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">CMS(online Exams)</a>
  </div>
  
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background-color:#F1EEEE">

    <ul class="nav navbar-nav navbar-right">
      <li><a href="#">Home</a></li>
      
    </ul>
	
  </div><!-- /.navbar-collapse -->
</nav>

  <div style="margin:150px auto; width:400px;"> 
  <ul class="nav nav-tabs" id="myTab" style=" width:400px; border:0px solid;">
  <li class="active" style=" width:200px;"><a href="#home" data-toggle="tab" style="color:#000;">Student Login</a></li>
  <li style=" width:200px;"><a href="#profile" data-toggle="tab" style="color:#000;">Teacher Login</a></li>
  </ul>
  
<div class="tab-content" style="border:1px solid #ddd;width:400px;  border-radius:5px;">
	<div   class="tab-pane fade in active" id="home" style="width:350px; height:211px; margin:0px auto;  margin-left:37px;" >
		<div id="back2" style="position:absolute; box-shadow: 0px 0px 20px #222222; width:350px; height:211px; margin:-15px;opacity:0.7; background-color:#cfcfcf; padding:0px; z-index:-1; border-radius:10px;  "></div> 
		<div style=" background:url('images/admin_login.gif'); background-size:150px 50px; background-repeat:no-repeat; height:50px; max-height:70px; border-radius:30px; max-width:200px; margin-top:30px;margin-left:-1px "></div>
		<form action="StudentLoginController" method="post">
			<div class="input-group"  style="width:310px; margin:10px;">
				  <span class="input-group-addon"><div style="background-image: url('images/user_icon.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
				  <input type="text" class="form-control" placeholder="Student Id" name="uname">
				  <span class="input-group-addon"><div style="background-image: url('images/quest.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
			</div>

			<div class="input-group" style="width:310px; margin:10px;">
				<span class="input-group-addon" ><div style="background-image: url('images/pwd_icon.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
				<input type="password" class="form-control" placeholder="Password" name="pwd">
				<span class="input-group-addon" ><div style="background-image: url('images/quest.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
			 
			</div>

			<div style="text-align:right; width:310px;">
				<div>
					<div><input type="button"  class="btn btn-info" value="submit" /></div>
				</div>
			</div>
		</form>
	</div>
	
	
	<div class="tab-pane fade" id="profile" style="width:350px; height:211px; margin:10px auto; margin-left:35px;">
<div style="position: absolute; color: #ff0000; text-align: center; width: 330px; font-weight: bold;"><%=msg %></div>
		<div id="back2" style="position:absolute;box-shadow: 0px 0px 20px #222222; width:350px; height:211px; margin:-10px; opacity:0.7; background-color:#cfcfcf; padding:0px; z-index:-1; border-radius:10px;  "></div> 
		<div style=" background:url('images/admin_login.gif'); background-size:150px 50px; background-repeat:no-repeat; height:50px; max-height:70px; border-radius:30px; max-width:200px; margin-top:30px;margin-left:-1px "></div>
		<form action="TeacherLoginController" method="post">
			<div class="input-group"  style="width:310px; margin:10px;">
			    <span class="input-group-addon"><div style="background-image: url('images/user_icon.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
		   	    <input type="text" class="form-control" placeholder="Teacher Id" name="uname">
				<span class="input-group-addon"><div style="background-image: url('images/quest.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
			</div>

			<div class="input-group" style="width:310px; margin:10px;">
				<span class="input-group-addon" ><div style="background-image: url('images/pwd_icon.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
				<input type="password" class="form-control" placeholder="Password" name="pwd">
				<span class="input-group-addon" ><div style="background-image: url('images/quest.png'); background-size: 20px 20px; height: 20px; width: 20px;"></div></span>
				 
			</div>

			<div style="text-align:right; width:310px;">
				<div>
					<div><input type="submit"  class="btn btn-info" value="submit" /></div>
				</div>
			</div>
		</form>
	</div>
</div>	
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="js/tab.js" type="text/javascript"></script>
<%msg=""; %>
</html>