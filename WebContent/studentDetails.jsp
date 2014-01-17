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
function closeDiv()
{
	document.getElementById('errormsg').style.display="none";
}
</script>
<%
	int sid = 0;
	String pwd = "";
	if (request.getParameter("sid") != null) {
		String sId1 = request.getParameter("sid");
		int sId = Integer.parseInt(sId1);
		ResultSet rs = DBConnection.selectStudent(sId);

		if (rs.next()) {
			sid = rs.getInt("sid");
			pwd = rs.getString("password");
		}

	}
	String msg="";
	if(request.getParameter("s") != null){
		msg = request.getParameter("s");
		if(msg.equals("invalid")){
			msg = "Please fill all details!";
		}else if(msg.equals("fail")){
			msg = "please Re-Type Password";
		}
		else if(msg.equals("queryFail"))
		{
			msg = "Details are not properly inserted";
		}
	}
%>
</head>

<body>

	<div id="back" style="width: 100%; height: 100%; z-index: 1;">

		<nav class="navbar navbar-default" role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">CMS(online Exams)</a> <a
				class="navbar-brand">Student Account</a>
		</div>



		</nav>

		<div
			style="margin: 0px auto; padding: 50px; min-width: 600px; max-width: 600px; padding: 20px;">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Fill Student Details</h3>
				</div>
				<div class="panel-body">

					<form role="form" action="StudentDetailsHandler" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Student's Id</label> <input
								type="text" class="form-control" name="id" value="<%=sid%>"
								disabled>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">First Name</label> <input
								type="text" class="form-control" name="fname"
								placeholder="Enter First Name" required pattern="[a-zA-Z]{1,20}" maxlength="30" >
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Last Name</label> <input
								type="text" class="form-control" name="lname"
								placeholder="Enter Last Name" required pattern="[a-zA-Z]{1,20}" maxlength="30" >
						</div>

						<div class="form-group">
							<label for="exampleInputPassword1">Old Password</label> <input
								type="text" class="form-control" name="password"
								placeholder="Password" required pattern=".{1,20}"
								value="<%=pwd%>" disabled maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">New Password</label> <input
								type="password" class="form-control" name="newPwd"
								placeholder=" New Password" required pattern=".{1,20}" maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Confirm Password</label> <input
								type="password" class="form-control" name="conPwd"
								placeholder="Re-type Password" required pattern=".{1,20}" maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">DOB</label> <input type="date"
								class="form-control" name="dob" placeholder="Date Of Birth"
								required maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Email</label> <input
								type="email" class="form-control" name="email"
								placeholder="Email" required maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Contact No</label> <input
								type="tel" class="form-control" name="mobile"
								placeholder="Contact No." required maxlength="10">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Address</label> <input
								type="text" class="form-control" name="address"
								placeholder=" Enter Address" required maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">City</label> <input
								type="text" class="form-control" name="city"
								placeholder=" Enter City" maxlength="30">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">State</label> <input
								type="text" class="form-control" name="state"
								placeholder=" Enter state" maxlength="30">
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