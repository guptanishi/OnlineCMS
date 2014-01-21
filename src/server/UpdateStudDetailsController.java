package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBConnection;

/**
 * Servlet implementation class UpdateStudDetailsController
 */
@WebServlet("/UpdateStudDetailsController")
public class UpdateStudDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int id=(Integer)session.getAttribute("sId");
		String pwd=(String)session.getAttribute("sPwd");
		System.out.println(pwd);
	
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String newPwd=request.getParameter("newPwd");
	
		String dob=request.getParameter("dob");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		if(newPwd==null||newPwd.length()==0)
		{
			newPwd=pwd;
		}
		
		int flg=DBConnection.updateStudentDetails(id,fname,lname,newPwd,dob,email,mobile,address,city,state);
		if(flg==1)
		{
			response.sendRedirect("studentDashBoard.jsp?f=1");
		}
		
		else
		{
			response.sendRedirect("studentDashBoard.jsp?f=0");
		}
	
	}

}
