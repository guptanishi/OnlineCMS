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

@WebServlet("/StudentLoginController")
public class StudentLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentLoginController() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String student_name = request.getParameter("uname");
		String student_pwd = request.getParameter("pwd");
		boolean result = false;
        int flag=0;
		HttpSession session = request.getSession();

		if (student_name == null || student_name.isEmpty() || 
				 student_pwd == null || student_pwd.isEmpty()) {
			response.sendRedirect("Login.jsp?s=false");
		} else {
			if(!student_name.matches(".*\\d.*")){
				response.sendRedirect("Login.jsp?s=invalid");
				return;
			}
			int sid=Integer.parseInt(student_name);
			String sql = "select * from student where sid='"+student_name+"'";
			ResultSet rs = DBConnection.selectQuery(sql);
			try {
				if(rs.next()) {
					if(rs.getString("PASSWORD").equals(student_pwd)) {
						session.setAttribute("sId", sid);
						session.setAttribute("sPwd", student_pwd);
						result = true;
						
						String sfName = rs.getString("SFNAME");
						String slName = rs.getString("SLNAME");
						if(sfName==null && slName==null )
							flag=0;
						else
							flag=1;
					}
				}

				if(result && flag==1 ) {
					response.sendRedirect("studentDashBoard.jsp");
				}
				else if (result && flag==0 ) {
					response.sendRedirect("studentDetails.jsp?sid="+sid);
				} else {
					response.sendRedirect("Login.jsp?s=invalid");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

}
