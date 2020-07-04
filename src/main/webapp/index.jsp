<!DOCTYPE HTML>

<%@page import="java.util.ArrayList"%>
<%@page import="com.service.*"%>
<%@page import="com.model.*"%>

<html>
<head>
<title>vidFlick</title>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body id="top">
	<jsp:include page="header.jsp"></jsp:include>



	<!-- Banner -->



	<section id="banner">
		<video class="banVid" autoplay muted loop src="images/banner.mp4">
			<source id="banner" class="banVid" src="images/banner.mp4"
				type="video/mp4">
		</video>
		<div class="inner">
			<header>
				<h1>VidFlick</h1>
				<p>
					A responsive video gallery with a huge latest video collection<br />
					more
				</p>
			</header>
			<a href="#main" class="more">Learn More</a>
		</div>
	</section>


	<!-- Main -->
	<div id="main">

		<div class="inner">
			<br>
			<h3>Latest Uploads</h3>
			<!-- Boxes -->
			<div class="thumbnails">
				<%
					videoDAO v1 = new videoDAO();
					ArrayList<videoBean> arrayList = new ArrayList<videoBean>();
					arrayList = v1.getvideoBean();

					//for(videoBean video: arrayList){
					for (int i = 0; i < 12; i++) {
				%>
				<div class="box">
					<a class="image"><img style="width: 100%; height: 150px;object-fit: cover;"
						src="Output/Thumbs/<%=arrayList.get(i).getVidId()%>.thumb.jpg"
						alt="Output/Thumbs/default.jpg" /></a>
					<div class="inner">
						<h3><%=arrayList.get(i).getName()%></h3>
						<p>
							<span class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</p>
						<form action="video_page_single.jsp" method="post">
							<input type="hidden" value="<%=arrayList.get(i).getVidId()%>"
								name="vidId">
							<div id="watchbut">
								<input type="submit" class="button fit" value="Watch">
							</div>
						</form>
					</div>
				</div>

				<%
					}
				%>


			</div>

		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.scrolly.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.poptrox.min.js" type="text/javascript"></script>
	<script src="assets/js/skel.min.js" type="text/javascript"></script>
	<script src="assets/js/util.js" type="text/javascript"></script>
	<script src="assets/js/main.js" type="text/javascript"></script>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/skel.min.js" type="text/javascript"></script>
	<script src="assets/js/util.js" type="text/javascript"></script>
	<script src="assets/js/mainHead.js" type="text/javascript"></script>
</body>
</html>