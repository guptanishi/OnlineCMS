<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Registration</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script>
function closeDiv()
{
	document.getElementById('errormsg').style.display="none";
}
</script>
</head>
<%!
	String msg = "";
%>
<%
	if(request.getParameter("s") != null){
		msg = request.getParameter("s");
		if(msg.equals("invalid")){
			msg = "File contains duplicate Reg. Id";
		}
		else if(msg.equals("exists"))
		{
			msg="Teacher RegistrationId already Exists";
		}
	}


String admin_name=(String)session.getAttribute("admin_name");
Boolean validateResult=(Boolean)session.getAttribute("login_success");
if(validateResult==null)
{
	System.out.println("dsfdsf");
	response.sendRedirect("admin_login.jsp?s=false");
	
}
%>
<body>
<div id="back" style="width:100%; height:100%; position: fixed; z-index:1;">

<nav class="navbar navbar-default" role="navigation" >
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">CMS(online Exams)</a>
	
	 <a class="navbar-brand" >Teacher Account</a>
  </div>

  
 <div class="btn-group" style="float:right; padding-right:60px; margin-top:10px;">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="">
    <%=admin_name %> <span class="caret"></span>
  </button>
  <form action="Logout" method="post" id="logout">
  	<input type="hidden" name="user" value="admin" />
  </form>
  <ul class="dropdown-menu" role="menu" style="width:60px; ">
    <li><a href="#">Edit Account</a></li>
    <li><a href="#" onclick="logout.submit();">Logout</a></li>
  </ul>
 </div>
</nav>
<%if(!msg.equals(""))
{%>
<div  id="errormsg" class="alert alert-danger"  style="font-size: 18px;line-height: 1.5;"> <center><%=msg %></center><span id="cross" style="float:right ;position: absolute;top: 70px;right: 15px; " onclick="closeDiv()" ><h3 style="cursor:pointer;">X</h3></span></div>
<%} %>
<div style=" margin:0px auto; padding:50px; min-width:1000px; max-width:1000px; padding:20px;">
<div style=" width:450px; display:inline-block;vertical-align: top; float:left;">
		 <div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"> Fill Teacher's Details</h3>
				
			  </div>
			 
			  <div class="panel-body">
				
				<form role="form" action="TeacherRegController" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1"> Registration Id </label>
					<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter ID" name="t_regId" required pattern="[a-zA-Z0-9]{1,20}" maxlength="20" >
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">Teacher's Name</label>
					<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Name" name="t_name" required pattern="[a-zA-Z ]{1,30}" maxlength="30">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password" name="t_pwd" required pattern=".{1,32}" maxlength="32">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">Subject</label>
					<select  class="form-control" name="t_sub" multiple required >
					  <option value="Java">Java</option>
					  <option value="C/C++">C/C++</option>
                      <option value="DBT">DBT</option>
					</select>
				  </div>
				  
				  <button type="submit" class="btn btn-info">Submit</button>
				</form>
				
			  </div>
		       
		  
		 </div>
	 
	</div>
	
	<div style="width:60px; height:400px; float:left; margin:0px auto;">
	    <div style="border:1px solid #000; width:1px; height:150px;margin:0px auto "></div>   
		
		<div style="font-size:20px; border-radius:50px; width:40px; height:35px; box-shadow:2px 2px 2px #333333; padding-top:5px; background-color:#ffffff;  margin:15px 0px 0px -5px; margin:0px auto; text-align:center;">OR</div>
		<div style="border:1px solid #000; width:1px; height:150px; margin-top:30px;margin:0px auto"></div>
	
	</div>
    <div style=" width:450px; display:inline-block;vertical-align: top;float:left; ">
		 <div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title">Import Teacher's  Details</h3>
			  </div>
			  <div class="panel-body">
				<form role="form" action="TeacherRegCsv"  enctype="multipart/form-data" method="post">
					<h4>CSV File Import</h4>
					<div class="radio" style="display:none;">
					  <label>
					  <input type="hidden" name="option" id="optionsRadios1" value="csv" required>
					  </label>
					</div>
				   <div class="form-group">
					<label for="exampleInputFile">File input</label>
					<input type="file" id="exampleInputFile" name="ufile" required>
					
				  </div>
				    <button type="submit" class="btn btn-info">Submit</button>
				</form>
				
			  </div>
		       
		  
		 </div>
	 
	</div>


</div>

<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
<script>
$("#errormsg").delay(5000).fadeOut(100);
</script>
</html>