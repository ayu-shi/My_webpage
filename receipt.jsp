
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Fun Cinemas</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='//fonts.googleapis.com/css?family=Oxygen:400,700,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/menu.css" />
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
</script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
<!---- start-smoth-scrolling---->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
		String name=((String)request.getParameter("name"));
		String date=((String)request.getParameter("date"));
		String time=((String)request.getParameter("time"));
		String theatre=((String)request.getParameter("theatre"));
		String total=((String)request.getParameter("total"));
		String seatno=((String)request.getParameter("seatno"));
		int qty = Integer.parseInt(total)/110;
		String str[] = new String[qty];
		int index=seatno.indexOf(",");
		int i=0;
		String st1[] = new String[qty];
		while(index!=-1)
		{
		String sub=seatno.substring(0,index);
		//System.out.println(sub);
		seatno=seatno.substring(index+1);
		str[i]=sub;
		//System.out.println(str[i]);
		i++;
		index=seatno.indexOf(",");
		}
		str[i]=seatno;
		//System.out.println(str[0]);
		//System.out.println(str[1]);
		//for(int j=0;j<=i;j++)
		//System.out.println(str[j]);
		//System.out.printl
		//index=str[0].lastindexOf("-");
		String seat="";
		for(int j=0;j<=i;j++)
		{
			index=str[0].lastIndexOf("-");
			st1[j]= str[j].substring(index+1);
			System.out.println(st1[j]);
			seat = (seat+st1[j]+" , ");
		}
		index = seat.lastIndexOf(",");
		seat = seat.substring(0,index);
			
		//response.sendRedirect("payment.jsp?movie_name="+movie_name+"&date="+date);
		%>
		<button class="btn btn-primary" onclick="adminlogout()" >
    back</button>
         <div class="payment-right">
				<center><h1>Ticket Summary</h1><br>
				
				<h3><span>&nbsp; Movie-Name:</span><%=name %>
				<p><span>Theatre:</span><%=theatre %></p>
				<p><span>Date:</span><%=date %></p>
				<p><span>Time:</span><%=time %></p>
				<p><span>Seat Info:</span><%=seat %></p>
				<p><span>Qty:</span><%=qty %></p></h3></center>
				<!-- <center><h5><span>Total :Rs.</span><%=total %></h5></center> -->
				
			</div>
           <center><h2><b><span>Total :Rs.</span><%=total %></b></h2></center>
           <script src="js/movieticket.js"></script>
           
    </body>
</html>
