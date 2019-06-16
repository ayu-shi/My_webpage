<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Logic</title>
    </head>
    <body>
        <%
            try
            {
                String name=request.getParameter("name").trim();
                String email_id=request.getParameter("email_id").trim();
                String password=request.getParameter("password").trim();
              Long user_mob =new Long(request.getParameter("user_mob").trim());
           
               
                
                
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
                 
                String query = "INSERT INTO `users`(`name`, `email_id`, `password`, `user_mob`) values (?,?,?,?);";
  
                PreparedStatement pstmt = con.prepareStatement(query);
           
                pstmt.setString(1,name);
                pstmt.setString(2,email_id);
                pstmt.setString(3,password);
                //pstmt.setString(5,user_mob);
                pstmt.setLong(4,user_mob);
               
                pstmt.executeUpdate();
                RequestDispatcher rd=request.getRequestDispatcher("index.html");
               
                        rd.forward(request,response); 
                System.out.println("Successfully inserted");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
            %>
    </body>
</html>
