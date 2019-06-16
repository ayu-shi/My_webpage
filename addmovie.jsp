<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    session="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>FUN Cinema</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts1/material-design-iconic-font/css/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css1/style.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('images1/bg-registration-form-2.jpg');">
			<div class="inner">
				<form action="addmovielogic.jsp">
				<%
					if("added successfully".equals((String)request.getParameter("status")))
							out.println("Added successfully");
					if("data not inserted".equals((String)request.getParameter("status")))
							out.println("Data not Inserted");
			%>
					<h3>Add Movie</h3>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Movie Name</label>
							<input type="text" class="form-control" name ="movie_name">
						</div>
					</div>
					<div class="form-wrapper">
						<label for="">Duration</label>
						<input type="text" class="form-control" name ="duration">
					</div>
					<div class="form-wrapper">
						<label for="">Genre</label>
						<input type="text" class="form-control" name ="genre">
					</div>
					<div class="form-wrapper">
						<label for="">Release Date</label>
						<input type="Date" class="form-control" name ="date">
					</div>
					<div class="form-wrapper">
						<label for="">Cast</label>
						<input type="text" class="form-control" name ="cast">
					</div>
					<div class="form-wrapper">
						<label for="">Language</label>
						<input type="text" class="form-control" name ="language">
					</div>
					<div class="form-wrapper">
						<label for="">Director</label>
						<input type="text" class="form-control" name ="director">
					</div>
					<div class="form-wrapper">
						<label for="">Rating</label>
						<input type="text" class="form-control" name ="rating">
					</div>
					<div class="form-wrapper">
						<label for="">Plot</label>
						<input type="text" class="form-control" name ="plot">
					</div>
					<div class="form-wrapper">
						<label for="">Image</label>
						<input type="file" accept="image/*" class="form-control" name ="image">
					</div>
					<div class="form-wrapper">
						<label for="">Status</label>
						<input type="text" class="form-control" name ="status">
					</div>
					<button>Add Movie</button>
				</form>
			</div>
		</div>
		
	</body> 
</html>