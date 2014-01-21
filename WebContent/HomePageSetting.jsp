<%@page import="db.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fill Student Details</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script>

function enableTextBox1() {
  
    if (document.getElementById("imgUpload1").checked == true)
    	{
        document.getElementById("img1").disabled = false;
        document.getElementById("label1").disabled = false;
        document.getElementById("desc1").disabled = false;
    	}
    else
    	{
        document.getElementById("img1").disabled = true;
        document.getElementById("label1").disabled = true;
        document.getElementById("desc1").disabled = true;
    	}
  }
    function enableTextBox2() { 
	    if (document.getElementById("imgUpload2").checked == true)
		{
	    document.getElementById("img2").disabled = false;
	    document.getElementById("label2").disabled = false;
	    document.getElementById("desc2").disabled = false;
		}
	   else
		{
	    document.getElementById("img2").disabled = true;
	    document.getElementById("label2").disabled = true;
	    document.getElementById("desc2").disabled = true;
		}
    } 
    
    function enableTextBox3() {   
    	
    	
    if (document.getElementById("imgUpload3").checked == true)
	{
    document.getElementById("img3").disabled = false;
    document.getElementById("label3").disabled = false;
    document.getElementById("desc3").disabled = false;
	}
   else
	{
    document.getElementById("img3").disabled = true;
    document.getElementById("label3").disabled = true;
    document.getElementById("desc3").disabled = true;
	}
    
    
 }
    
    function validateForm(form)
    {
    	
    }
</script>
</head>
<%
String msg="";
 String error=request.getParameter("err");
  if(error!=null)
  {
	msg="details are not submitted properly";  
  }
  

  Boolean validateResult=(Boolean)session.getAttribute("s");
  if(validateResult !=null && validateResult==true)
  {
  	System.out.println("dsfdsf");
  	response.sendRedirect("admin_login.jsp?s=false");
  	
  }
  String admin_name=(String)session.getAttribute("admin_name");
  String reg=request.getParameter("status");

 
  
%>
<body id="back">

	<div style="width: 100%; height: 100%; z-index: 1;">

		<nav class="navbar navbar-default" role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">CMS(online Exams)</a>
		</div>

		<div class="btn-group"
			style="float: right; padding-right: 60px; margin-top: 10px;">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" style="">
				<%=admin_name %>
				<span class="caret"></span>
			</button>
			<form action="Logout" method="post" id="logout">
				<input type="hidden" name="user" value="admin" />
			</form>
			<ul class="dropdown-menu" role="menu" style="width: 60px;">
				<li><a href="#">Edit Account</a></li>
				<li><a href="#" onclick="logout.submit();">Logout</a></li>
			</ul>
		</div>

		</nav>
		<%if(!msg.equals(""))
{%>
		<div id="errormsg" class="alert alert-danger"
			style="font-size: 18px; line-height: 1.5;">
			<center><%=msg %></center>
			<span id="cross"
				style="float: right; position: absolute; top: 70px; right: 15px;"
				onclick="closeDiv()"><h3>X</h3></span>
		</div>
		<%} %>
		<div
			style="margin: 0px auto; padding: 50px; min-width: 600px; max-width: 600px; padding: 20px;">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Home Page Setting</h3>
				</div>
				<div class="panel-body">

					<form role="form" action="HomeSettingController" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="exampleInputEmail1">Univerity Name</label> <input
								type="text" class="form-control" name="univName" maxlength=100
								required>

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">About univerity</label>
							<textarea type="text" class="form-control" name="about"
								placeholder="max 2000 characters" maxlength=2000 required></textarea>

						</div>



						<div class="form-group">

						<input type="checkbox" name="imgUpload1" OnChange="enableTextBox1()" id="imgUpload1"/>	<label for="exampleInputEmail1">Upload First Image for
								slider</label> <input type="file" name="img1" id="img1" disabled required > <label
								for="exampleInputEmail1">First image label</label> <input
								type="text" class="form-control" name="lable1" id="label1" disabled required>
							<label for="exampleInputEmail1">First Image Description</label>
							<textarea type="text" class="form-control" name="desc1"
								placeholder="max 200 characters" id="desc1" disabled required></textarea>


						</div>


						<div class="form-group">

							<input type="checkbox" name="imgUpload2" id="imgUpload2" OnChange="enableTextBox2()"/><label for="exampleInputEmail1">Upload Second Image for
								slider</label> <input type="file" name="img2" id="img2" disabled required> <label
								for="exampleInputEmail1">Second image label</label> <input
								type="text" class="form-control" name="label2"  id="label2" disabled required>
							<label for="exampleInputEmail1">Second Image Description</label>
							<textarea type="text" class="form-control" name="desc2" id="desc2"
								placeholder="max 200 characters" disabled required></textarea>


						</div>

						<div class="form-group">

						<input type="checkbox" name="imgUpload3" id="imgUpload3" OnChange="enableTextBox3()"/>	<label for="exampleInputEmail1">Upload Third Image for
								slider</label> <input type="file" name="img3" id="img3" disabled> <label
								for="exampleInputEmail1">Third image label</label> <input
								type="text" class="form-control" name="label3" id="label3"disabled>
							<label for="exampleInputEmail1">Third Image Description</label>
							<textarea type="text" class="form-control" name="desc3" id="desc3"
								placeholder="max 200 characters" disabled></textarea>


						</div>


						<button type="submit" class="btn btn-info">Submit</button>
					</form>

				</div>


			</div>

		</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</html>