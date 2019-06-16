<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
	try{
		 Class.forName("com.mysql.jdbc.Driver");
         Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "ayushi");
          System.out.println("connect");
          
          String seatno=((String)request.getParameter("seatno"));
          String name=((String)request.getParameter("m_name"));
          String date=((String)request.getParameter("m_date"));
          String time=((String)request.getParameter("time"));
          String theatre=((String)request.getParameter("theatre"));
          String total=((String)request.getParameter("total"));
          
  	    System.out.println(seatno);
  	    String[] num=seatno.split(",");
  	    for(int i = 0;i<num.length;i++)
  	    {
  	    	int r= Character.getNumericValue(num[i].charAt(10));
  	    	int c= Character.getNumericValue(num[i].charAt(12));
  	    	String query = "INSERT INTO `seat`( `row`, `col`, `price`, `status`) VALUES (?,?,?,?)";
  	    	PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,r);
            pstmt.setInt(2,c);
            pstmt.setInt(3,110);
            pstmt.setInt(4,1);
          	pstmt.executeUpdate();
  	    	//System.out.println(r+" "+c);
  	    
  	    }
  	  response.sendRedirect("receipt.jsp?name="+name+"&date="+date+"&time="+time+"&theatre="+theatre+"&total="+total+"&seatno="+seatno);
  	    
  	    
	}
	  catch(Exception e)
    {
        System.out.println("error");
        System.out.println(e);
    }
		
		//String date=((String)request.getParameter("movie_date"));
		%>
		

</body>
</html>