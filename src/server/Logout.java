package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		String usercheck = request.getParameter("user");
		if(usercheck != null){
			if(usercheck.equals("admin"))
				response.sendRedirect("admin_login.jsp");
			else if (usercheck.equals("teacher"))
				response.sendRedirect("Login.jsp?t=");
			else if(usercheck.equals ("student"))
				response.sendRedirect("Login.jsp?s=");
		}else{
			response.sendRedirect("Login.jsp");
		}
	}

}
