package server;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;


@WebServlet("/StudentRegController")
public class StudentRegController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String password_characters="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		int key=0;
		key=Integer.parseInt(from);
		int no_of_pwd=Integer.parseInt(to)-Integer.parseInt(from);
		int chk=Integer.parseInt(from)-Integer.parseInt(to);
		int i,j,r1=0,r2=0;
		
		ArrayList<Integer> arr=new ArrayList<Integer>();
		
		if(chk>0)
		{
			
			response.sendRedirect("createStudent.jsp?err=wrong");
		}
		else
		{
		for(i=Integer.parseInt(from);i<=Integer.parseInt(to);i++)
		{
			arr.addAll(DBConnection.CheckKey(i));	
				
		}
		if(!(arr.isEmpty()))
		{
			r1=arr.get(0);
			r2=arr.get(arr.size()-1);
		}
		
		String passwords="";
		int result=0;
		if(r1==0 && r2==0)
		{
			for(j=0;j<no_of_pwd+1;j++)
			{ 
				for(i=0;i<8;i++)
				{ 
					passwords+=password_characters.charAt((int) (Math.floor(Math.random()*password_characters.length())));
				}
			
					result=DBConnection.insertQueryStud(key,passwords);
					passwords="";
					key++;
			} 
		}
		if(result==1)
		{
			
			response.sendRedirect("dashboard.jsp?status=s_success");
		}
		else
		{
			
			response.sendRedirect("createStudent.jsp?s=invalid&r1="+r1+"&r2="+r2);
		}
		
		}
	}

}
