
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            try
            {
                String name=request.getParameter("email").trim();
                String password=request.getParameter("password").trim();
                System.out.println(name+" "+password);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
                 System.out.println("connect");
                String query = "Select email_id,password from admin where email_id=? and password=?;";
                
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1,name);
                pstmt.setString(2,password);
                ResultSet rtst = pstmt.executeQuery();
                System.out.println("done");
                if(rtst.next()) {
                    
                   
                  session.setAttribute("userid",rtst.getString(1));
                  session.setAttribute("password",rtst.getString(2));
                  String name1=(String)session.getAttribute("userid");
                  String pass=(String)session.getAttribute("password");
                  System.out.println("userid"+name1+" password"+pass);
                  if(name.equals(name1.trim()) && password.equals(pass.trim()))
                  {
                      
                       RequestDispatcher rd=request.getRequestDispatcher("adminpan.jsp");
               
                        rd.forward(request,response); 
                   
                  }
                 
                }
                else
                {
                    RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
                    rd.forward(request,response);
                }
             
            }
            catch(Exception e)
            {
                System.out.println("error");
                System.out.println(e);
            }
            %>
    </body>
</html>
