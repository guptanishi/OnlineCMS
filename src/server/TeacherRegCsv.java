package server;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import db.DBConnection;

@WebServlet("/TeacherRegCsv")
@MultipartConfig
public class TeacherRegCsv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final Part filePart = request.getPart("ufile");
		String fileName = getFileName(filePart);
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		String fileExt = fileName.substring(fileName.length() - 3);
		String serverPath = getServletContext().getRealPath("");
		if (fileExt.equals("csv")) {
			serverPath = serverPath + "/" + "file.csv";
		} else {
			serverPath = serverPath + "/" + "file.xml";
		}

		System.out.println(serverPath);
		filePart.write(serverPath);

		if (request.getParameter("option").equals("csv")) {

			int result = DBConnection.loadCSV(serverPath);
			if (result == 1) {
				// File doomedFile = new File (serverPath);
				// doomedFile.delete();
				response.sendRedirect("dashboard.jsp");
			}
		}
	}

	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println("content-disposition header= " + contentDisp);
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {

				return token.substring(token.indexOf("=") + 2,
						token.length() - 1);
			}
		}
		return "";
	}
}
