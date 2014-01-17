package server;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		String teacher_id=request.getParameter("uname");
		String teacher_pwd=request.getParameter("pwd");
		 boolean result=false;
		
		    HttpSession session =request.getSession();
		    
		    Boolean validateResult=(Boolean)session.getAttribute("login_success");
			if(validateResult !=null && validateResult==true){
				response.sendRedirect("Login.jsp?t=false");
				return;
			}
		    
			if (teacher_id == null || teacher_id.isEmpty() || teacher_pwd == null
					|| teacher_pwd.isEmpty()) {
				response.sendRedirect("Login.jsp?t=false");
			} else {
				if(!teacher_id.matches(".*\\d.*")){
					response.sendRedirect("Login.jsp?t=invalid");
					return;
				}
				int id=Integer.parseInt(teacher_id);
				String sql = "select * from teacher";
				ResultSet rs = DBConnection.selectQuery(sql);
				try {
					while(rs.next())
					{
						String name= rs.getString("tname");
						String pwd= rs.getString("tpwd");
						
						int tid= rs.getInt("tid");
						if(tid==id && pwd.equals(teacher_pwd)){
							session.setAttribute("t_name",name );
							session.setAttribute("t_id", tid);
							result=true;	
						}	
					}
					
					if(result){   
						response.sendRedirect("AddQuestions.jsp");
					}
					else{
						response.sendRedirect("Login.jsp?t=invalid");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}		
	}
}
