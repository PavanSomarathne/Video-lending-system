<!DOCTYPE HTML>
<%@page import="com.util.*"%>

<%@page import="java.sql.*"%>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>VidFlick Videos</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/mainBrowse.css" />

</head>
<body id="top">
	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>
	<%
		String query = request.getParameter("query");
		String quality = request.getParameter("Quality");
		String rating = request.getParameter("Rating");
		String category = request.getParameter("category");
		String orderby = request.getParameter("orderBy");
	%>

	<!--	<section id="banner">	-->
	<div class="row">
	<br>
	<br>
		<form method="post" action="SearchPage.jsp">
			<div class="Search">
				<div class="Search Bar">
					<input type="text" name="query" id="query" value=""
						placeholder="Search" />
				</div>
				<div class="Search Btn">
					<input type="submit" value="Search" class="fit" />
				</div>
			</div>
			<div class="search">
				<div class="search1 Year">
					<div class="select-wrapper">
						<select name="Quality" id="category">
							<option value="0">- Quality -</option>
							<option value="720p">720p</option>
							<option value="1080p">1080p</option>

						</select>
					</div>
				</div>
				<div class="search1 Cat">
					<div class="select-wrapper">
						<select name="Rating" id="category">
							<option value="0">- Rating -</option>
							<option value="2">1+</option>
							<option value="3">2+</option>
							<option value="4">3+</option>
							<option value="5">4+</option>
						</select>
					</div>
				</div>
				<div class="search1 rate">
					<div class="select-wrapper">
						<select name="category" id="category">
							<option value="0">-Category --</option>
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
						</select>
					</div>
				</div>
				<div class="search1 order ">
					<div class="select-wrapper">
						<select name="orderBy" id="category">
							<option value="0">- Order By -</option>
							<option value="Latest">Latest</option>
							<option value="Oldest">Oldest</option>
							<option value="Year">Year</option>
							<option value="Rating">Rating</option>
						</select>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--</section>	-->

   
	<!-- Main -->
	<div id="main">

		<div class="inner">
			
			<!-- Boxes -->
			<div class="thumbnails">
				<%
					try {
						Connection currentCon = null;
						Statement statement = null;
						ResultSet resultSet = null;
						PreparedStatement preparedStatement;
						currentCon = ConnectionManager.getConnection();
						if (quality.equals("0") && rating.equals("0") && category.equals("0") && orderby.equals("0")) {
							preparedStatement = currentCon.prepareStatement("select * from videos where name like ? order by vidId DESC");
							preparedStatement.setString(1, "%" + query + "%");
							
						} else {
							
							if (orderby.equals("Latest")) {
								preparedStatement = currentCon.prepareStatement(
										"select * from videos where name like ? and category=? and quality=? order by vidId DESC");
								preparedStatement.setString(1, "%" + query + "%");
								preparedStatement.setString(2, category);
								preparedStatement.setString(3, quality);
							} else if (orderby.equals("Oldest")) {
								preparedStatement = currentCon.prepareStatement(
										"select * from videos where name like ? and category=? and quality=? order by vidId ");
								preparedStatement.setString(1, "%" + query + "%");
								preparedStatement.setString(2, category);
								preparedStatement.setString(3, quality);
							} else if (orderby.equals("Rating")) {
								preparedStatement = currentCon.prepareStatement(
										"select * from videos where name like ? and category=? and quality=? order by ? DESC");
								preparedStatement.setString(1, "%" + query + "%");
								preparedStatement.setString(2, category);
								preparedStatement.setString(3, quality);
								preparedStatement.setString(4, "rating");
							} else {
								preparedStatement = currentCon.prepareStatement(
										"select * from videos where name like ? and category=? and quality=? order by ? DESC");
								preparedStatement.setString(1, "%" + query + "%");
								preparedStatement.setString(2, category);
								preparedStatement.setString(3, quality);
								preparedStatement.setString(4, "year");
							}
						}

						statement = currentCon.createStatement();

						resultSet = preparedStatement.executeQuery();
						for (int i = 0; i < 12; i++)//while (resultSet.next())
						{
							if (resultSet.next()) {
				%>


				<div class="box">
					<a class="image"><img style="width: 100%; height: 150px;"
						src="Output/Thumbs/<%=resultSet.getString("vidId")%>.thumb.jpg"
						alt="Output/Thumbs/default.jpg" /></a>
					<div class="inner">
						<h3><%=resultSet.getString("name")%></h3>
						<p>
							<span class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</p>
						<form action="video_page.jsp" method="post">
							<input type="hidden" value="<%=resultSet.getString("VidId")%>"
								name="vidId">
							<div id="watchbut">
								<input type="submit" class="button fit" value="Watch">
							</div>
						</form>
					</div>
				</div>


				<%
					}
						}
						currentCon.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>



			</div>

		</div>
	</div>
	<div class="search">
		<div class="nextBut">
			<ul>
				<li><a href="#" class="button back"> &laquo;Back </a></li>
				<li><a href="#" class="button next"> Next&raquo; </a></li>

			</ul>
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
	<script src="assets/js/main.js"></script>
</body>
</html>