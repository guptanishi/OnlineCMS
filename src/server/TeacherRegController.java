package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Teacher;

import db.DBConnection;

@WebServlet("/TeacherRegController")
public class TeacherRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacher_regId=request.getParameter("t_regId");
		String teacher_name=request.getParameter("t_name");
		String teacher_pwd=request.getParameter("t_pwd");
		String teacher_sub[]=request.getParameterValues("t_sub");
		String t_sub="";
		for(int i=0; i<=teacher_sub.length-1;i++)
		{
			if(t_sub.equals(""))
			{
				t_sub=teacher_sub[i];
			}
			else
			{
				t_sub=t_sub+"_"+teacher_sub[i];
			}
		}
		
		Teacher teacher=new Teacher();
		teacher.setTregId(teacher_regId);
		teacher.settName(teacher_name);
		teacher.settPwd(teacher_pwd);
		teacher.settSub(t_sub);
		teacher.settEmail("");
		teacher.settMobile(0);
		teacher.settCity("");
		teacher.settState("");
		
		int result=DBConnection.insertQuery(teacher);
		
		if(result==1)
		{
			response.sendRedirect("dashboard.jsp");
		}
		else
		{
			response.sendRedirect("teacher_registraion.jsp?s=invalid");
		}
	}

}
