<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Questions to Bank</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<style>
	.text-style{
		font-weight:600; 
		font-size:14px; 
		text-align:center;
		color:#777777;
	}
	
	.back-gradient{
		background: #e0e0e0; /* Old browsers */
		background: -moz-linear-gradient(top,  #e0e0e0 0%, #686868 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#e0e0e0), color-stop(100%,#686868)); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  #e0e0e0 0%,#686868 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  #e0e0e0 0%,#686868 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  #e0e0e0 0%,#686868 100%); /* IE10+ */
		background: linear-gradient(to bottom,  #e0e0e0 0%,#686868 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e0e0e0', endColorstr='#686868',GradientType=0 ); /* IE6-9 */
	}
	
	#que-choices tr td{
		text-align:right;
		padding-right:10px;
	}
	
</style>
<script>
	var choicedata = "";
	var tfdata = '<div style="padding:5px;"><div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title" style="text-align:center; font-weight:bold;">Correct Answer</h3></div><div class="panel-body"><div style="width:130px; margin:0px auto;"><table id="que-options"><tr><td style="width:80px;"><label style="margin-top: 3px;">TRUE</label></td><td style="width:50px;" align="center"><input type="radio" name="correct" value="T"/></td></tr><tr><td style="width:80px;"><label style="margin-top: 3px;">FALSE</label></td><td style="width:50px;" align="center"><input type="radio" name="correct" value="F"/></td></tr></table></div></div></div></div>';
				
	function behav(value)
	{
		if(value == "tf"){
			window.choicedata = document.getElementById("choices").innerHTML;
			document.getElementById("choices").innerHTML = "";
			document.getElementById("tfchoices").innerHTML = window.tfdata;
		}
		else if(value == "mcq"){
			document.getElementById("choices").innerHTML = window.choicedata;
			document.getElementById("tfchoices").innerHTML = "";
		}
	}
</script>
</head>
<% String teacher_name=(String)session.getAttribute("t_name") ;%>
<body style="overflow-y: scroll;">
<div id="back" style="width:100%; height:100%; z-index:1; min-width: 500px;">
	<nav id="navibar" class="navbar navbar-default" role="navigation" >
	  <!-- Brand and toggle get grouped for better mobile display -->
	  <div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		  <span class="sr-only">Toggle navigation</span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">CMS(Online Exams)</a>
		<a class="navbar-brand">&gt;</a>
		<a class="navbar-brand" href="#">Add Questions</a>
	  </div>

	  
	 <div class="btn-group" style="float:right; padding-right:60px; margin-top:10px;">
	  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="">
	    <%=teacher_name %> <span class="caret"></span>
	  </button>
	  <form action="Logout" method="post" id="logout">
	  	<input type="hidden" name="user" value="teacher" />
	  </form>
	  <ul class="dropdown-menu" role="menu" style="width:60px; ">
	    <li><a href="#">Edit Account</a></li>
	    <li><a href="#" onclick="logout.submit();">Logout</a></li>
	  </ul>
    </div>
	  
	</nav>
	<div style="background-color:#ffffff; width:800px; border: 1px solid #000000; margin:50px auto; padding:5px; box-shadow:0px 0px 20px #333333; border-radius:5px;">
		<form id="questionform" action="AddQuestionsHandler" method="post">
		<div style="width:600px; margin:15px auto; padding:5px;">
			<div style="width:535px; margin:0px auto;">
				<table>
					<tr>
						<td style="width:115px; text-align:right; padding-right:10px;"><label>Question Type</label></td>
						<td>
							<select name="qtype" class="form-control" style="width:150px;" onchange="behav(this.value);" required>
							  <option value="mcq">MCQ</option>
							  <option value="tf">True/False</option>
							</select>
						</td>
						<td style="width:115px; text-align:right; padding-right:10px;"><label>Subject</label></td>
						<td>
							<select name="subject" class="form-control" style="width:150px;" required>
							  <option value="">--</option>
							  <option value="one">One</option>
							  <option value="two">Two</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div style="margin-top:30px; padding:5px;">
				<div class="panel panel-default">
					  <div class="panel-heading">
						<h3 class="panel-title" style="text-align:center; font-weight:bold;">Type Your Question here</h3>
					  </div>
					  <div class="panel-body" style="background-color:#f5f5f5;">
						<textarea class="form-control" rows="3" name="que" style="max-width:548px; min-width:548px; min-height:100px;" required pattern=".{10,3800}" maxlength="3800" placeholder="Max 3800 Characters"></textarea>
					  </div>
				</div>
			</div>
			<div id="choices">
				<div style="padding:5px;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title" style="text-align:center; font-weight:bold;">Answer Choices</h3>
						</div>
						<div class="panel-body">
							<div style="width:300px; margin:0px auto;">
								<table id="que-options">
									<tr><td style="width:80px;"><label>Option 1</label></td><td style="width:200px;"><input type="text" name="opt1" class="form-control" placeholder="Max. 2000 Char's" required pattern=".{4,2000}" maxlength="2000" /></td><td style="width:50px;" align="center"><div style="position:absolute; font-size:10px; margin-left:-5px; margin-top:-22px; color:#ff0000; font-weight:bold;">Correct Answer</div><input type="radio" name="correct" value="A" required /></td></tr>
									<tr><td><label>Option 2</label></td><td><input type="text" name="opt2" class="form-control" placeholder="Max. 2000 Char's" required pattern=".{4,2000}" maxlength="2000" /></td><td align="center"><input type="radio" name="correct" value="B"  required /></td></td></tr>
									<tr><td><label>Option 3</label></td><td><input type="text" name="opt3" class="form-control" placeholder="Max. 2000 Char's" pattern=".{4,2000}" maxlength="2000" /></td><td align="center"><input type="radio" name="correct" value="C"  required /></td></td></tr>
									<tr><td><label>Option 4</label></td><td><input type="text" name="opt4" class="form-control" placeholder="Max. 2000 Char's" pattern=".{4,2000}" maxlength="2000" /></td><td align="center"><input type="radio" name="correct" value="D"  required /></td></td></tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="tfchoices">
			</div>
			<div style="padding:5px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" style="text-align:center; font-weight:bold;">Options</h3>
					</div>
					<div class="panel-body">
						<div style="width:500px; margin:0px auto;">
							<table id="que-choices" style="margin:0px auto;">
								<tr>
									<td>
										<table>
											<tr>
												<td><label>Hardness</label></td>
												<td>
													<select name="hardness" class="form-control" required>
														<option value="">----</option>
														<option value="1">1 (Easy)</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5 (Average)</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9 (Hard)</option>
													</select>
												</td>
											</tr>
										</table>
									</td>
									<td>
										<table>
											<tr>
												<td><label>Marks</label></td>
												<td>
													<input type="text" class="form-control" name="marks" placeholder="Bet. 1 to 9999" maxlength="4" required pattern=".{1,4}" style="width:125px;"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div style="text-align:right;">
				<input type="submit" class="btn btn-info" value="Add Question to Bank" />
				<button type="button" class="btn btn-danger" style="margin-left:20px;" onclick="location.reload();">Reset</button>
			</div>
		</div>
		</form>
	</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/tooltip.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>