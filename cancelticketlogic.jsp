<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fun Cinema</title>
</head>
<body>
<%
            try
            {
            	System.out.println("1");
                String row=request.getParameter("row").trim();
                String col=request.getParameter("col").trim();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
                System.out.println("connect");
                /*Statement st=con.createStatement();
                int i=st.executeUpdate("DELETE FROM movie WHERE movie_name="+name);*/
                PreparedStatement ps=con.prepareStatement("DELETE FROM seat WHERE row=? and col=?");
                ps.setString(1,row);
                ps.setString(2,col);
                int b=ps.executeUpdate();
                out.println("Data Deleted Successfully!");
                HttpSession session=request.getSession();
                if(b>0)
                {
                	 response.sendRedirect("cancelticket.jsp?status=cancelled successfully");
                }
                else
                {
                	response.sendRedirect("cancelticket.jsp?status=data not found");
                	
                }
               
                }
                catch(Exception e)
                {
                System.out.print(e);
                e.printStackTrace();
                }
            %>

</body>
</html>