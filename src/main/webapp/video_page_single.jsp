<!DOCTYPE HTML>
<%@page import="com.service.*"%>
<%@page import="com.util.*"%>
<%@page import="com.model.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<title>vidFlick</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
		<link rel="stylesheet" href="assets/css/main.css" />
		 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<link href="assets/css/bootstrapVidP.css" rel='stylesheet' type='text/css' />
		<link href="assets/css/styleVid.css" rel="stylesheet" type="text/css" media="all" />
		<!-- start plugins -->
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>


	<body id="top">
	<%
		String vId = request.getParameter("vidId");
		
	%>
			<!-- Header -->
		<jsp:include page="header.jsp"></jsp:include>

			<!-- Main -->
				<div id="main">
					<div class="inner">
						<br>

						<div class="container">
		<%
					try {
						Connection currentCon = null;
						Statement statement = null;
						ResultSet resultSet = null;
						PreparedStatement preparedStatement;
						currentCon = ConnectionManager.getConnection();
						
							preparedStatement = currentCon.prepareStatement("select * from videos where vidId=? ");
							preparedStatement.setString(1,vId);
						

						statement = currentCon.createStatement();

						resultSet = preparedStatement.executeQuery();
							while (resultSet.next()) {
		%>
	   <div class="content">
      	   <div class="movie_top">
                        <div class="grid images_3_of_2">
                        	<div class="movie_image">
                                <span class="movie_rating"><%=resultSet.getString("rating") %></span>
                               <img src="Output/Thumbs/<%=resultSet.getString(1)%>.thumb.jpg" class="img-responsive" alt=""/>
                            </div>
                            <div class="movie_rate">
                            
						  	   <div class="clearfix"> </div>
                            </div>
                        </div>

                       
						<h3 style="margin-left: 20px;"><%=resultSet.getString("name") %></h3>
                        <div style="padding: 10px;" class="desc1 span_3_of_2">
                            
                            <table class="inner">
							
							  <tr>
							    <td><strong>Year</strong></td>
							    <td><%=resultSet.getString("year") %></td>

							  </tr>
							  <tr>
							    <td><strong>Category</strong></td>
							    <td><%=resultSet.getString("category") %></td>
				
							  </tr>
							   <tr>
							    <td><strong>Uploaded date</strong></td>
							    <td><%=resultSet.getDate(10)%></td>
							  </tr>

							  <tr>
							    <td><strong>Owner</strong></td>
							    <td><%=resultSet.getString("upBy") %></td>
							  </tr>

							   <tr>
							    <td><strong>Ratings</strong></td>
							    <td><%=resultSet.getString("rating") %></td>
							  </tr>
							   <tr>
							    <td><strong>Available Quality</strong></td>
							    <td><%=resultSet.getString("quality") %></td>
							  </tr>
							</table>

                            <div class="down_btn">
                            	<form action="subscribe.jsp" method="post">
                            	<input type="hidden" name="vidId" value="<%=resultSet.getString("vidId") %>">
                            	<button class="btn1" type="submit" value="Subscribe">Subscribe</button>
                            	</form>
                          	</div>

                         </div>
                          
                         <div class="clearfix"> </div>
                        <h4>Description  :  <%=resultSet.getString("description") %></h4>
                        
		         
		         		
                      </div>
                    </div>
                   </div>
                  </div>  
				<h4 style="text-align: center">New released video. Watch the trailer!</h4>
				<div style="margin-left: 22%">
						<video  width="820" height="420" controls>
 							 <source src="Output/Trails/<%=resultSet.getString(1)%>.trail.mp4" type="video/mp4">
							  <source src="Output/Trails/<%=resultSet.getString(1)%>.trail.mp4" type="video/ogg">
							  <p>Your browser does not support HTML5 video.</p>
						</video>
						<br><br>
						<h4 style="margin-left: 20%">Press the subscribe button above to subscribe for this video</h4>
				</div>


					</div>
				</div>	


				<%
					}
						
						currentCon.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
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