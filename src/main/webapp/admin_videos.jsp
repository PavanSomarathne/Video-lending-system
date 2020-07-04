<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.*"%>
<%@page import="com.service.*"%>
<%@page import="com.model.*"%>
<html>
<head>
<title>vidFlick</title>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
<link rel="stylesheet" href="assets/css/adminMain.css" />
<link rel="stylesheet" href="assets/css/ad_vids.css" />


</head>


<body id="top">
	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>


	<!--Administrator video management page -->
	<div id="main">
		<div class="inner">
			<br>
			<br>
			<h2>Video Library</h2>

			<!--uploaded videos library -->
			<div class="container-table-upvids pos-relative">
				<div class="wrap-table-uploaded bgwhite">
					<table class="table-uploaded">
						<tr class="table-head">
							<th class="column-1">Video</th>
							<th class="column-2">Description</th>
							<th class="column-3">Date</th>
							<th class="column-4">Uploader</th>
							<th class="column-6"></th>
							<th class="column-7"></th>
						</tr>
						<%
						videoDAO v1 = new videoDAO();
						ArrayList<videoBean> arrayList = new ArrayList<videoBean>();
						arrayList=v1.getvideoBean(); 
						for(videoBean vid:arrayList){
						%>
						<tr class="table-row"  style="text-transform: capitalize;">
							<td class="column-1">
								<div class="upvids-img-product b-rad-4 o-f-hidden">
									<img src="Output/Thumbs/<%=vid.getVidId()%>.thumb.jpg" alt="IMG-PRODUCT">
								</div>
							</td>
							<td class="column-2"><%=vid.getName() %><br></td>
							<td class="column-3"><%=vid.getDate() %></td>
							<td class="column-4"><%=vid.getUser() %></td>
							
							<form onSubmit="if(!confirm('Are you Sure,This can not be undone?')){return false;}" action="deleteVideos" method="post">
							<input type="hidden" value="<%=vid.getVidId()%>" name="vidId">
							<td class="column-7"><button  type="submit" class="btn2">Delete</button></td>
							</form>
						</tr>

						<% 
							}
							%>



						
					</table>
				</div>

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