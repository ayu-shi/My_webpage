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
<title>Delete Movie</title>
</head>
<body>
<%
            try
            {
                String name=request.getParameter("name").trim();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
                /*Statement st=con.createStatement();
                int i=st.executeUpdate("DELETE FROM movie WHERE movie_name="+name);*/
                PreparedStatement ps=con.prepareStatement("DELETE FROM movie WHERE movie_name=?");
                ps.setString(1,name);
                int b=ps.executeUpdate();
                out.println("Data Deleted Successfully!");
                HttpSession session=request.getSession();
                if(b>0)
                {
                	 response.sendRedirect("deletemovie.jsp?status=deleted successfully");
                }
                else
                {
                	response.sendRedirect("deletemovie.jsp?status=data not found");
                	
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