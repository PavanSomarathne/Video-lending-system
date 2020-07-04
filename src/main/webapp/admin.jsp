<!DOCTYPE HTML>

<html>
	<head>
		<title>vidFlick</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="assets/css/adminMain.css" />
		
		 
		 
</head>


	<body id="top">
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
        			
		  
		<!--Account homepage-->
			<div id="main">					
					<div class="inner">
						<br><br>
						<div style="text-align: center">
						<h1 style="font-size:50px">Administrator Logged In</h1>
	    				<h3>Manage videos and users from the following links</h3>
	    				</div>				
				
						<br><br><br>
						<button style="margin-left: 250px" "class="button style3 fit"><a href="admin_videos.jsp">Manage Videos</a></button>

						<button style="float: right;  margin-right: 250px" "class="button style3 fit"><a href="admin_users.jsp">Manage Users</a></button>
						
						</br>
						<br><br>
				<form onSubmit="if(!confirm('Do you really want to log off ?')){return false;}" action="loginServ" method="POST">
					<input type="hidden" name="Submit" value="Logout">
					<input type="submit" value="LogOut"  style="float: right; padding: 10px 50px">
				</form>
				
						<br><br><br>
					</div>
			</div>


			<!-- Footer -->
				<jsp:include page="footer.jsp"></jsp:include>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.poptrox.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/mainHead.js"></script>		
	</body>
</html>