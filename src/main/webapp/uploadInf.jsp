<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet"
	href="htt://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="assets/css/up.css">

<link rel="stylesheet" href="assets/css/main.css">

	

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="form-style-5">
		<form  method="POST" action="videoServlet">
			<fieldset>
				<legend>
					<span class="number">1</span> Video Info
				</legend>
				<input type="text" name="name" placeholder="Video Name *">
				<input type="text" name="year" placeholder="Year *">
				<textarea name="description" placeholder="Description"></textarea>

				<select id="job" name="category">
					<option value="">Category</option>
					<option value="Action">Action</option>
					<option value="Adventure">Adventure</option>
					<option value="Animation">Animation</option>
					<option value="Comedy">Comedy</option>
					<option value="Family">Family</option>
					<option value="Horror">Horror</option>
					<option value="Musical">Musical</option>
					<option value="Thriller">Thriller</option>
					<option value="Mystery">Mystery</option>
					<option value="Documentary">Documentary</option>
				</select> <select id="job" name="quality">
					<option value="">Quality</option>
					<option value="720p">720p</option>
					<option value="1080p">1080p</option>
				</select>
			</fieldset>
			
		
			<input type="submit" value="Upload" name="submit"/>
		</form>
		
		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
