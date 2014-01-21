<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, db.DBConnection ;"%>
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
	String msgerr = "";
	String msgsuc = "";
	String msg="";
%>
<%
	
	int id=(Integer)session.getAttribute("sId");
	String pwd=(String)session.getAttribute("sPwd"); 
	
	ArrayList  arr=new ArrayList();
	arr=DBConnection.populateStudentDetails(id);
	

	
	if(request.getParameter("f") != null){
		msg = request.getParameter("f");
		if(msg.equals("1")){
			msgsuc = "Details updated successfully";
		}else if(msg.equals("0")){
			msgerr = "Details not updated successfully";
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


function closeDiv()
{
	document.getElementById('infoDiv').style.display="none";
}

</script>
</head>
<body id="back" onload="check()">

<div  style="width:100%; height:100%;  z-index:1; min-width: 1000px;">
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
    <a class="navbar-brand" href="#">Student Dashboard</a>
  </div>
  
   <div class="btn-group" style="float:right; padding-right:60px; margin-top:10px;">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="">
    <%=arr.get(0) %> <span class="caret"></span>
  </button>
  <form action="Logout" method="post" id="logout">
  	<input type="hidden" name="user" value="student" />
  </form>
  <ul class="dropdown-menu" role="menu" style="width:60px; ">
    <li><a href="#">Edit Account</a></li>
    <li><a href="#" onclick="logout.submit();">Logout</a></li>
  </ul>
</div>
</nav>

<%if(msg!=null)
{
if(msg.equals("1"))
{
	%>
	<div  id="infoDiv" class="alert alert-success"  style="font-size: 18px;line-height: 1.5;"> <center><%=msgsuc %></center><span id="cross" style="float:right ;position: absolute;top: 70px;right: 15px; " onclick="closeDiv()" ><h3 style="cursor: pointer;">X</h3></span></div>
	<%
}
else if(msg.equals("0"))
{
	%>
	<div  id="infoDiv" class="alert alert-danger"  style="font-size: 18px;line-height: 1.5;"> <center><%=msgerr %></center><span id="cross" style="float:right ;position: absolute;top: 70px;right: 15px; " onclick="closeDiv()" ><h3 style="cursor: pointer;">X</h3></span></div>
	<%
}
} %>
  <div style="margin-left:100px; width:400px;"> 
  <ul class="nav nav-tabs" id="myTab" style=" width:400px; border:0px solid;">
  <li class="active" style=" width:200px;"><a href="#home" data-toggle="tab" style="color:#000;">Profile</a></li>
  <li style=" width:200px;"><a href="#profile" data-toggle="tab" style="color:#000;">Exam</a></li>
  </ul>
  
<div class="tab-content" style="width:700px;  border-radius:5px;">
	<div   class="tab-pane fade in active" id="home" style="width:350px; height:0px auto; margin:0px auto;  margin-left:-20px;margin-top:-20px" >
		<div style="margin: 0px auto; padding: 50px; min-width: 850px; max-width: 850px; padding: 20px;">
		<form role="form" action="UpdateStudDetailsController" method="post">
			<div class="panel panel-default" style=" height:370px;">
				<div class="panel-heading">
					<h3 class="panel-title"><%=arr.get(0)+" "+arr.get(1) %></h3>
				</div>
				
				<table style="margin-left:70px ;   "> 
					<tr>
					<td style="height:10px"></td>
					</tr>
					<tr>
						
						<td>
							 <label for="exampleInputEmail1">Student's Id</label>
				    	 </td>
				    	 <td>
							 <input type="text" class="form-control" name="id" value="<%=id%>"disabled> 
						</td>
						<td style="width:10px"></td>
						<td>
							<label for="exampleInputPassword1">DOB</label>
						</td>
						<td>
							 <input type="date"
								class="form-control" name="dob" placeholder="Date Of Birth"
								  value="<%=arr.get(3)%>"required maxlength="30">
						</td>
					</tr>
					<tr>
					<td style="height:10px"></td>
					</tr>
					<tr>
						<td>
							<label for="exampleInputEmail1">First Name</label>
						</td>
						<td>
							 <input	type="text" class="form-control" name="fname"
								placeholder="Enter First Name" value="<%=arr.get(0)%>"required pattern="[a-zA-Z]{1,20}" maxlength="30" >
							
						</td>
						<td style="width:10px"></td>
						<td>
							<label for="exampleInputPassword1">Email</label> 
						</td>
						<td>
							<input	type="email" class="form-control" name="email"
								 value="<%=arr.get(4)%>" placeholder="Email" required maxlength="30">
						</td>
					</tr>
					<tr>
					<td style="height:10px"></td>
					</tr>
					<tr>
						<td>
						<label for="exampleInputEmail1">Last Name</label> 
						</td>
						<td>
						<input type="text" class="form-control" name="lname"
								placeholder="Enter Last Name" value="<%=arr.get(1)%>"  required pattern="[a-zA-Z]{1,20}" maxlength="30" >
							 
						</td>
						<td style="width:10px"></td>
						<td>
							<label for="exampleInputPassword1">Contact No</label>
						</td>
						<td>
							 <input type="tel" class="form-control" name="mobile"
								 value="<%=arr.get(5)%>" placeholder="Contact No." required maxlength="10">
						</td>
					</tr>
					<tr>
					<td style="height:10px"></td>
					</tr>
					<tr>
						<td>
						<label for="exampleInputPassword1">Old Password</label>
						</td>
						<td>
						 <input type="text" class="form-control" name="password"
							value="<%=pwd%>"	placeholder="Password" required pattern=".{1,20}"
								 disabled maxlength="30">
						</td>
						<td style="width:10px"></td>
						<td>
							<label for="exampleInputPassword1">Address</label>
							</td>
							<td>
							 <input	type="text" class="form-control" name="address"
								 value="<%=arr.get(6)%>" placeholder=" Enter Address" required maxlength="30">
						</td>
					</tr>
					<tr>
					<td style="height:10px"></td>
					</tr>
					<tr>
						<td>
						<label for="exampleInputPassword1">New Password</label> 
						</td>
						<td>
						<input type="password" class="form-control" name="newPwd"
								placeholder=" New Password"   pattern=".{1,20}" maxlength="30">
						</td>
						<td style="width:10px"></td>
						<td>
							<label for="exampleInputPassword1">City</label> 
						</td>
						<td>
							<input type="text" class="form-control" name="city"
								 value="<%=arr.get(7)%>" placeholder=" Enter City" maxlength="30">
						</td>
					</tr>
					<tr>
					<td style="height:10px"></td>
					</tr>
					<tr>
						
						<td>
						<label for="exampleInputPassword1">Confirm Password</label>
						</td>
						<td>
						 <input	type="password" class="form-control" name="conPwd"
								placeholder="Re-type Password"    pattern=".{1,20}" maxlength="30">
						</td>
						<td style="width:70px"></td>
						<td>
							<label for="exampleInputPassword1">State</label>
						</td>
						<td>
							 <input	type="text" class="form-control" name="state"
								 value="<%=arr.get(8)%>" placeholder=" Enter state" maxlength="30">
						</td>
					</tr>
					<tr>
					
					<td style="height:10px;"></td>
					</tr>
					
				</table>
					<div style="width:172px;float:right;">
					<button type="submit" class="btn btn-info">Submit</button>
					</div>
				
				</div>	
			
			</div>

	</div>
	</form>
	<div class="tab-pane fade" id="profile" style="width:350px; height:211px; margin:10px auto; margin-left:35px;">
      <div><h3><a style="color:#ffffff; " href="exam.jsp">Start Exam !!</a></h3></div>
</div>	
</div>
</body>

<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="js/tab.js" type="text/javascript"></script>
<%msg=""; %>
</html>