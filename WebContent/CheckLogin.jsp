<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%
	Boolean validateResult=(Boolean)session.getAttribute("login_success");
	String stat = "N";
	if(validateResult != null){
		stat = "Y";
	} 
%><%=stat %>