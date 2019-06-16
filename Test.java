package java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test {

	public static void main(String[] args) {

		try
		{
			System.out.println("trying to connect to db");
		Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
        String query = "Select * from user;";
        
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rtst = pstmt.executeQuery();
        while(rtst.next())
        {
        	
        }
        System.out.println("done");
	}
		catch(Exception e)
		{
			
		}
		}

}
