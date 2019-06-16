package java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletRequest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/loginuser")
public class loginuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginuser() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","ayushi");
			String query ="Select name, password from users where name =? and password=?;";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,name);
			pstmt.setString(2,password);
			ResultSet rtst = pstmt.executeQuery();
			if(rtst.next())
			{
				session.setAttribute("user_id",rtst.getString(1));
				session.setAttribute("password",rtst.getString(2));
				String name1 = (String)session.getAttribute("user_id");
				String pass = (String)session.getAttribute("password");
				
				if(name.equals(name1.trim()) && password.equals(pass.trim()))
				{
					RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
					rd.forward(request, response);
				}
				
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
