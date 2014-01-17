package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

@WebServlet("/StudentDetailsHandler")
public class StudentDetailsHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentDetailsHandler() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("hiiii");
		String sId =  request.getParameter("sid");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String newpwd = request.getParameter("newPwd");
		String conpwd = request.getParameter("conPwd");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");

		
		
		if (fname == null || fname.isEmpty() || lname == null || dob.isEmpty()
				|| dob == null || mobile.isEmpty() || mobile == null) {
			response.sendRedirect("studentDetails.jsp?s=invalid");
		}
		if (newpwd != null && !newpwd.equals("") && conpwd != null
				&& !conpwd.equals("")) {
			if (!newpwd.equals(conpwd)) {
				response.sendRedirect("studentDetails.jsp?s=fail");
			}
		}

		else{
			int sid=Integer.parseInt(sId);
			System.out.println("hii");
			int flag= DBConnection.updateStudentDetails(sid,fname,lname,newpwd,dob,email,mobile,address,city,state);
			
			if(flag==1)
			{
				response.sendRedirect("studentDashBoard.jsp");
				
			}
			else{
				response.sendRedirect("sudentDetails.jsp?s=queryFail");
			}
		}
		
		//System.out.println(fname + lname + pwd + dob + mobile + address + city
				//+ state);

	}

}
