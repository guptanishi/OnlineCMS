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


@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();		
		
		String admin_name=request.getParameter("uname");
		String admin_pwd=request.getParameter("pwd");
		 boolean result=false;
		    
			Boolean validateResult=(Boolean)session.getAttribute("login_success");
			if(validateResult !=null && validateResult==true){
				response.sendRedirect("admin_login.jsp?s=false");
				return;
			}
		 
			if (admin_name == null || admin_name.isEmpty() || admin_pwd == null	|| admin_pwd.isEmpty()) {
				response.sendRedirect("admin_login.jsp?s=false");
			} else {
				String sql = "select * from admin";
				ResultSet rs = DBConnection.selectQuery(sql);
				
				try {
					while(rs.next())
					{
						String name= rs.getString("name");
						String pwd= rs.getString("pwd");
						System.out.println(name+pwd);
						
						if(name.equals(admin_name) && pwd.equals(admin_pwd))
						{
							session.setAttribute("login_success", true);
							session.setAttribute("admin_name", name);
							result=true;
						}
					}
					
					if(result)
					{
						response.sendRedirect("dashboard.jsp");
						
					}
					else
					{
						response.sendRedirect("admin_login.jsp?s=invalid");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
					

			}
	
		
	}

}
