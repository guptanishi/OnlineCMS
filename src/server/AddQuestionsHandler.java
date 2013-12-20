package server;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.QuestionData;

@WebServlet("/AddQuestionsHandler")
public class AddQuestionsHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddQuestionsHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacherid = "1001A";
		String qtype = request.getParameter("qtype");
		String subject =  request.getParameter("subject");
		String que = request.getParameter("que");
		String opt1 = request.getParameter("opt1");
		String opt2 = request.getParameter("opt2");
		String opt3 = request.getParameter("opt3");
		String opt4 = request.getParameter("opt4");
		String correct = request.getParameter("correct");
		String hardness = request.getParameter("hardness");
		String marks = request.getParameter("marks");
		
		if(qtype != null && subject != null && que != null && correct != null && hardness != null && marks != null){
			if(qtype.equals("tf")){
				opt1 = "null";
				opt2 = "null";
				opt3 = "null";
				opt4 = "null";
			}
			if(!qtype.equals("") && !subject.equals("") && !que.equals("") && !opt1.equals("") && !opt2.equals("") && !correct.equals("") && !hardness.equals("") && !marks.equals("")){
				
				QuestionData qd = new QuestionData();
				qd.setQtype(qtype);
				qd.setSubject(subject);
				qd.setQue(que);
				qd.setOpt1(opt1);
				qd.setOpt2(opt2);
				qd.setOpt3(opt3);
				qd.setOpt4(opt4);
				qd.setCorrect(correct);
				qd.setHardness(Integer.parseInt(hardness));
				qd.setMarks(Integer.parseInt(marks));
				
				int status = db.DBConnection.insertQuestion(teacherid, qd);
				if(status != 0){
					response.sendRedirect("AddQuestions.jsp?stat=added");
				}else{
					response.sendRedirect("AddQuestions.jsp?stat=failed");
				}
			}else{
				response.sendRedirect("AddQuestions.jsp?stat=error");
				return;
			}
		}else{
			response.sendRedirect("AddQuestions.jsp?stat=error");
			return;
		}
	}

}
