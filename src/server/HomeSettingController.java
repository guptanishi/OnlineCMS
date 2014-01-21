package server;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class HomeSettingController
 */
@WebServlet("/HomeSettingController")
@MultipartConfig
public class HomeSettingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String univerName = request.getParameter("univName");
		String aboutUniver = request.getParameter("about");
		final Part img1 = request.getPart("img1");
		String path = getServletContext().getRealPath("");
		File folder = new File(path + "\\SliderImages");
		String imgpath1 = "";

		String flag1 = "false";
		String flag2 = "false";
		String flag3 = "false";
		String img1label = "";
		String img1desc = "";
		if (img1 != null) {

			if (!folder.exists())
				folder.mkdir();

			imgpath1 = path + "\\SliderImages\\img1.jpg";
			img1.write(imgpath1);

			flag1 = "true";
			img1label = request.getParameter("lable1");
			img1desc = request.getParameter("desc1");
		}

		final Part img2 = request.getPart("img2");
		String imgpath2 = "";
		String img2label = "";
		String img2desc = "";
		if (img2 != null) {

			if (!folder.exists())
				folder.mkdir();

			imgpath2 = path + "\\SliderImages\\img2.jpg";
			img2.write(imgpath2);
			flag2 = "true";
			img2label = request.getParameter("label2");
			img2desc = request.getParameter("desc2");
		}

		final Part img3 = request.getPart("img3");
		String imgpath3 = "";
		String img3label = "";
		String img3desc = "";
		if (img3 != null) {
			if (!folder.exists())
				folder.mkdir();

			imgpath3 = path + "\\SliderImages\\img3.jpg";
			img3.write(imgpath3);
			flag3 = "true";
			img3label = request.getParameter("label3");
			img3desc = request.getParameter("desc3");
		}

		if (univerName == null || univerName.isEmpty() || aboutUniver == null
				|| aboutUniver.isEmpty() || aboutUniver == null) {
			response.sendRedirect("HomePageSetting.jsp?err=false");
		} else {
			JSONObject obj = new JSONObject();
			obj.put("UniversityName", univerName);
			obj.put("AboutUniversity", aboutUniver);
			obj.put("ImagePath1", flag1);
			obj.put("Label1", img1label);
			obj.put("Description1", img1desc);
			obj.put("ImagePath2", flag2);
			obj.put("Label2", img2label);
			obj.put("Description2", img2desc);
			obj.put("ImagePath3", flag3);
			obj.put("Label3", img3label);
			obj.put("Description3", img3desc);

			try {
				String serverPath = request.getServletContext().getRealPath("");
				FileWriter file = new FileWriter(serverPath
						+ "\\js\\homepage.json");
				file.write(obj.toJSONString());
				file.flush();
				file.close();

				response.sendRedirect("index.jsp");

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}

}
