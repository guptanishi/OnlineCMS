package db;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.QuestionData;
import com.Teacher;

public class DBConnection {

	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement st=null;
	static {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@202.141.152.20:1521:xe",
					"DAC13_130840320049", "Nishi1991");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ResultSet selectQuery(String sql) {

		try {
			st = con.createStatement();
			rs=st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rs;

	}
	
	public static int insertQuery(Teacher tec)
	{
		int flag=0;
		String sql="insert into teacher(tid,tregId,tname,tpwd,temail,tmobile,tsub,tcity,tstate) values(t_id.NEXTVAL,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, tec.getTregId());
			ps.setString(2, tec.gettName());
			ps.setString(3, tec.gettPwd());
			ps.setString(4, tec.gettEmail());
			ps.setInt(5, tec.gettMobile());
			ps.setString(6, tec.gettSub());
			ps.setString(7, tec.gettCity());
			ps.setString(8, tec.gettState());
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static int insertQuestion(String tid, QuestionData qd)
	{
		int flag=0;
		String questionid = "1001";
		String sql="INSERT INTO QBANK(tid, qid, sub, type, statement, imgpath, opt1, opt2, opt3, opt4, ans, qlevel, marks) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, tid);
			ps.setString(2, questionid);
			ps.setString(3, qd.getSubject());
			ps.setString(4, qd.getQtype());
			ps.setString(5, qd.getQue());
			ps.setString(6, "que1jpg");
			ps.setString(7, qd.getOpt1());
			ps.setString(8, qd.getOpt2());
			ps.setString(9, qd.getOpt3());
			ps.setString(10, qd.getOpt4());
			ps.setString(11, qd.getCorrect());
			ps.setInt(12, qd.getHardness());
			ps.setInt(13, qd.getMarks());
			
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static int loadCSV(String path)
	{
		String csvFile = path;
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
	    int result=0;
		try {
	 
			br = new BufferedReader(new FileReader(csvFile));
			while ((line = br.readLine()) != null) {
	 
			    // use comma as separator
				String[] t_info = line.split(cvsSplitBy);
	 
				if(t_info[0]!=null)
				{
				System.out.println("t_info [id= " +t_info[0] 
	          
						+ " , name=" + t_info[1] + "]");
				
				Teacher teacher=new Teacher();
				 teacher.setTregId(t_info[1]);
				 teacher.settName(t_info[2]);
				 teacher.settPwd(t_info[3]);
				 teacher.settEmail(t_info[4]);
				 teacher.settMobile(Integer.parseInt(t_info[5]));
				 teacher.settSub(t_info[6]);
				 teacher.settCity(t_info[7]);
				 teacher.settState(t_info[8]);
				
	            result=insertQuery(teacher);
				}
				else
				{
					result=0;
				}
				
			}
	 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}	 
		System.out.println("Done");
		return result;
	}
}
