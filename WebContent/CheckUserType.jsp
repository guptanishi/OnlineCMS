<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%
	Integer T=(Integer)session.getAttribute("t_id");
    Integer S = (Integer)session.getAttribute("sId");
	String stat = "N";
	if(T != null){
		stat = "T";
	}else if(S != null){
		stat = "S";
	}
%><%=stat %>