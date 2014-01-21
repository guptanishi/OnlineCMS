<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check()
	{
		var from=document.getElementById("from").value;
		var to=document.getElementById("to").value;
		
		if(from=="" || to=="")
		{
			alert("Please Enter range to create account");
			return false;
		}
		return true;
	}
	
	function closeDiv()
	{
		document.getElementById('infoDiv').style.display="none";
	}
	
</script>
</head>
<%!
	String msg = "";
	String rr1 = "";
	String rr2 = "";
%>
<%
	if(request.getParameter("err") != null)
	{
		msg= request.getParameter("err");
			if(msg.equals("wrong"))
			{
				msg = "Invalid range of Student id";
			}
	}
	
	else if(request.getParameter("s") != null)
	{
	    rr1=request.getParameter("r1");
	    rr2=request.getParameter("r2");
		msg = request.getParameter("s");
		if(msg.equals("invalid"))
		{
			msg = "Student id already exits from "+rr1+" to "+rr2;
		}
		if(msg.equals("fail"))
		{
			msg="file id not uploaded properly";
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
	
	 <a class="navbar-brand" >Student Account</a>
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
<%if(!msg.equals("")){ 
	%>
<div  id="infoDiv" class="alert alert-danger"  style="font-size: 18px;line-height: 1.5;"> <center><%=msg %></center><span id="cross" style="float:right ;position: absolute;top: 70px;right: 15px; " onclick="closeDiv()" ><h3>X</h3></span></div>
<% }
%>
<div style=" margin:0px auto; padding:50px; min-width:1000px; max-width:1000px; padding:20px;">
<div style=" width:450px; display:inline-block;vertical-align: top; float:left;">
		 <div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"> Enter Students Id</h3>
			  </div>
			  <div class="panel-body">
				<p>*Enter range to create students account</p>
				<form role="form" action="StudentRegController" method="post" onsubmit="return check()">
				  <div class="form-group">
					<label for="exampleInputEmail1">Rollno from </label>
					<input type="text" class="form-control" name="from" id="from">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">Rollno To</label>
					<input type="text" class="form-control" name="to" id="to">
				  </div>
				  <div>
				  <div style="float:left"><button type="submit" class="btn btn-info" >Submit</button></div>
				  </div>
				  <!--  <div style="position: absolute;float:left;line-height: 30px; color: #ff0000; text-align: center; width: 400px; font-weight: bold;"><%=msg %></div>-->
				  </div>
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
				<h3 class="panel-title">Import Student's Details</h3>
			  </div>
			  <div class="panel-body">
				<form role="form" action="StudentRegCsv" method="post" enctype="multipart/form-data">
					<h4>CSV File Import</h4>
				   <div class="form-group">
					<label for="exampleInputFile">File input</label>
					<input type="file" id="exampleInputFile" name="tfile" required>
					
				  </div>
				    <button type="submit" class="btn btn-info" >Submit</button>
				    
				</form>
				
			  </div>
		       
		  
		 </div>
	 
	</div>


</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
<% 	msg = ""; 
	rr1="";
	rr2="";%>
	
</html>