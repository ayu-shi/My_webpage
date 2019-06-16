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
                String movie_name=request.getParameter("movie_name").trim();
                String duration=request.getParameter("duration").trim();
                String genre=request.getParameter("genre").trim();
                String date=request.getParameter("date").trim();
                String cast=request.getParameter("cast").trim();
                String language=request.getParameter("language").trim();
                String director=request.getParameter("director").trim();
                String rating=request.getParameter("rating").trim();
                String plot=request.getParameter("plot").trim();
                String status=request.getParameter("status").trim();
                String image=request.getParameter("image").trim();
                
                
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
                String query = "INSERT INTO `movie` (`duration`, `genre`, `date`, `cast`, `language`, `director`, `rating`, `plot`, `image`, `status`, `movie_name`) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1,duration);
                ps.setString(2,genre);
                ps.setString(3,date);
                ps.setString(4,cast);
                ps.setString(5,language);
                ps.setString(6,director);
                ps.setString(7,rating);
                ps.setString(8,plot);
                ps.setString(9,image);
                ps.setString(10,status);
                ps.setString(11,movie_name);
                
                
                int b=ps.executeUpdate();
                out.println("Data Added Successfully!");
                HttpSession session=request.getSession();
                System.out.println(b);
                if(b>0)
                {
                	 response.sendRedirect("addmovie.jsp?status=added successfully");
                }
                else
                {
                	response.sendRedirect("addmovie.jsp?status=data not inserted");
                	
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