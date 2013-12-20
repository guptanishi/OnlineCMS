package server;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBConnection;

@WebServlet("/TeacherLoginController")
public class TeacherLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacher_name=request.getParameter("uname");
		String teacher_pwd=request.getParameter("pwd");
		boolean result=false;
	
	    HttpSession session =request.getSession();
	    session.setAttribute("tname", teacher_name);
	    session.setAttribute("tpwd", teacher_pwd);
		  
		Boolean validateResult=(Boolean)session.getAttribute("login_success");
		if(validateResult !=null && validateResult==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("teacherLogin.jsp?s=false");
			rd.forward(request,response);
			return;
		}
		
		if (teacher_name == null || teacher_name.isEmpty() || teacher_pwd == null || teacher_pwd.isEmpty()) 
		{
			response.sendRedirect("teacherLogin.jsp?s=false");
		} 
		else 
		{
			String sql = "select * from teacher";
			ResultSet rs = DBConnection.selectQuery(sql);
			try {
				while(rs.next())
				{
					String name= rs.getString("tname");
					String pwd= rs.getString("tpwd");
					
					if(name.equals(teacher_name) && pwd.equals(teacher_pwd))
					{
						result=true;
					}
				}
				
				if(result)
				{
					response.sendRedirect("AddQuestions.jsp");
				}
				else{
					response.sendRedirect("teacherLogin.jsp?t=invalid");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
