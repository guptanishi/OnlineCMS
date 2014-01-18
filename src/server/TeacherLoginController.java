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
				String sql = "select tid, tname, tpwd from teacher where tregid='"+teacher_id+"'";
				ResultSet rs = DBConnection.selectQuery(sql);
				try {
					if(rs.next())
					{
						if(rs.getString("tpwd").equals(teacher_pwd)){
							session.setAttribute("t_name",rs.getString("tname"));
							session.setAttribute("t_id", rs.getInt("tid"));
							result=true;	
						}	
					}
					
					if(result){   
						response.sendRedirect("AddQuestions.jsp");
						return;
					}
					else{
						response.sendRedirect("Login.jsp?t=invalid");
						return;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}		
	}
}
