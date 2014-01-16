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
import java.util.ArrayList;

import com.QuestionData;
import com.Student;
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

		} catch (Exception e) {

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
	
	public static int insertQueryTeacher(Teacher tec)
	{
		int flag=0;
		String sql="insert into teacher(tid,tregId,tname,tpwd,temail,tmobile,tsub,tcity,tstate) values(t_id.NEXTVAL,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, tec.getTregId());
			ps.setString(2, tec.gettName());
			ps.setString(3, tec.gettPwd());
			ps.setString(4, tec.gettEmail());
			ps.setString(5, tec.gettMobile());
			ps.setString(6, tec.gettSub());
			ps.setString(7, tec.gettCity());
			ps.setString(8, tec.gettState());
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
	public static int insertQuestion(int tid, QuestionData qd)
	{
		int flag=0;
		
		String sql="INSERT INTO QBANK(tid, qid, sub, type, statement, imgpath, opt1, opt2, opt3, opt4, ans, qlevel, marks) VALUES (?,que_id.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, tid);
			
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
	
	public static int insertQueryStudentCsv(Student stu)
	{
		int flag=0;
		String sql="insert into student(SID,SFNAME,SLNAME,PASSWORD,FATHERNAME,DOB,EMAIL,MOBILENO,ADDRESS,CITY,STATE) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, stu.getsId());
			ps.setString(2, stu.getFname());
			ps.setString(3, stu.getLname());
			ps.setString(4, stu.getPwd());
			ps.setString(5, stu.getFathername());
			ps.setString(6, stu.getDob());
			ps.setString(7, stu.getEmail());
			ps.setString(8, stu.getMobile());
			ps.setString(9, stu.getAddress());
			ps.setString(10, stu.getCity());
			ps.setString(11, stu.getState());
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
	public static int insertQueryStud(int key,String pwd)
	{
		int flag=0;
	
		String sql="insert into student(sid,password) values(?,?)";
		
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, key);
				ps.setString(2, pwd);
				flag = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();		
			}

		return flag;
		
		
	}
	public static int loadCSV(String path,String acctype)
	{
		String csvFile = path;
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
	    int result=0;
		try {
	 
			br = new BufferedReader(new FileReader(csvFile));
			while ((line = br.readLine()) != null) {
	 
				System.out.println(line);
			    // use comma as separator
				String[] t_info = line.split(cvsSplitBy);
	 
				
				System.out.println("t_info [id= " +t_info[0] + " , name=" + t_info[1] + ""+t_info[2]+" "+t_info[3]+" "+t_info[4]+" "+t_info[5]+" "+t_info[6]);
	          
				boolean flag=checkTeacherId(t_info[1]);
				
			    System.out.println(flag);
				if(acctype.equals("teacher"))		
				{
				 Teacher teacher=new Teacher();
				 teacher.setTregId(t_info[1]);
				 teacher.settName(t_info[2]);
				 teacher.settPwd(t_info[3]);
				 teacher.settEmail(t_info[4]);
				 teacher.settMobile(t_info[5]);
				 teacher.settSub(t_info[6]);
				 teacher.settCity(t_info[7]);
				 teacher.settState(t_info[8]);
	             result=insertQueryTeacher(teacher);
				}
				else{
					
					try{
					 Student stu = new Student();
					 stu.setFname(t_info[0]);
					 stu.setFname(t_info[1]);
					 stu.setLname(t_info[2]);
					 stu. setFathername(t_info[3]);
					 stu.setPwd(t_info[4]);
					 stu.setDob(t_info[5]);
					 stu.setMobile(t_info[6]);
					 stu.setAddress(t_info[7]);
					 stu.setCity(t_info[8]);
					 stu.setState(t_info[9]);
					 result=insertQueryStudentCsv(stu);
					}
					catch(Exception e)
					{
						System.out.println("Exception Occured");
					}
					 
					
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
	
	public static ArrayList<Integer> CheckKey(int key)
	{ 
		int chk=0,sid=0;			
		ArrayList<Integer> t = new ArrayList<Integer>();
		String sql="select sid from student where sid="+key;
		try
		{
			ps=con.prepareStatement(sql);		
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
			sid=rs.getInt("sid");
			t.add(key);
			}			
					
		}		
		catch(Exception e)
			{
				e.printStackTrace();
			}
		return t; 
	}
	public static boolean checkTeacherId(String key)
	{ 
				boolean flag=false;
		
		String sql="select tregid from teacher where tregid='"+key+"'";
		try
		{
			ps=con.prepareStatement(sql);		
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				
				flag=true;
		
			}
			else{
				flag=false;
			}
					
		}		
		catch(Exception e)
			{
				e.printStackTrace();
			}
		  
			   
		   
		return flag; 
	}

	
}
