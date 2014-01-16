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

/**
 * Servlet implementation class StudentLoginController
 */
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

		HttpSession session = request.getSession();

		if (student_name == null || student_name.isEmpty()
				|| student_pwd == null || student_pwd.isEmpty()) {
			response.sendRedirect("teacherLogin.jsp?s=false");
		} else {
			String sql = "select * from teacher";
			ResultSet rs = DBConnection.selectQuery(sql);
			try {
				while (rs.next()) {
					String sId = rs.getString("SID");
					String sfName = rs.getString("SFNAME");
					String spwd = rs.getString("PASSWORD");

					if (sfName.equals(student_name) && spwd.equals(student_pwd)) {
						session.setAttribute("sId", sId);
						
						session.setAttribute("sPwd", spwd);
						result = true;

					}

				}

				if (result) {
					response.sendRedirect(".jsp");

				} else {

					response.sendRedirect("Login.jsp?t=invalid");

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
