<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.*"%>
<%@page import="com.util.*"%>
<%@page import="com.model.*"%>


<html>
<head>
<title>vidFlick</title>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

<link rel="stylesheet" href="assets/css/account.css" />


</head>


<body id="top">
	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>

	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<%
		HttpSession s1 = request.getSession();
		String user = s1.getAttribute("cUserName").toString();
		String str;
		if(user.equals("ADMIN")){
			 str=request.getParameter("userId");
		}
		else{
			 str=user;
		}
	%>

	<!--Account homepage-->
	<div id="main">

		<div class="inner">
			<%
				UserDAO d1 = new UserDAO();
				ArrayList<UserBean> arrayList = new ArrayList<UserBean>();
				arrayList = d1.getUser(str);

				for (UserBean usr : arrayList) {
			%>
			<div style="height: 200px; padding-left: 100px;">
				<a  href="uploadImg.jsp"><img id="accimage"
					style="float: right; margin-right: 100px; padding: 5px; border-width: 1px; border-style: groove;object-fit: cover;"
					src="Output/accImg/<%=usr.getAccImg()%>" height="300" width="300;"></a>
				<h1 style="font-size: 50px; text-transform: capitalize;"><%=usr.getFirstName()%></h1>


			</div>


			<a href="uploadInf.jsp"><button "class="button style3 fit">Upload
					your new videos here</button></a> <br>
			<br>

			<div>
				<h3>Account Details</h3>
				<div>
					<table class="inner">
						<tr>
							<th>Name</th>
							<th style="text-transform: capitalize;"><%=usr.getFirstName()%>
								<%=usr.getLastName()%></th>

						</tr>
						<tr>
							<td>Mail</td>
							<td><%=usr.getUsername()%></td>

						</tr>
						<tr>
							<td>Videos Uploaded</td>
							<td>0</td>

						</tr>
						
					</table>
				</div>

				<br> <br> <a href="uploaded.jsp"><button
						style="margin-left: 250px" "class="button style3 fit">See
						your uploaded videos here</button></a>

				<a href="subscribed.jsp"><button style="float: right; margin-right: 250px"
					"class="button style3 fit">See your subscribed videos here</button></a>
				</br>

				<form action="loginServ" method="POST">
					<input type="hidden" name="Submit" value="Logout">
					<input type="button" value="LogOut" onclick="show_alert()" style="float: right; padding: 10px 50px">
				</form>
				<script>
				function show_alert() {
					  if(confirm("Do you really want to Log Off?"))
					    document.forms[0].submit();
					  else
					    return false;
					}
				</script>

				<%
					}
				%>
				</BR>
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