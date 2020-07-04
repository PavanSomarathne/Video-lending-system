
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.service.*"%>
<%@page import="com.util.*"%>
<%@page import="com.model.*"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/mainHead.css" />
</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="index.jsp" class="logo"><img src="images/Logo.png"
				height="60" width="180" alt=""></a>



			<nav id="nav">
				<a href="index.jsp">Home</a> <a href="SearchPage.jsp">Browse
					Videos</a>

				<%
					if (session.getAttribute("currentSessionUser") == null) {
				%>
				<a href="login.jsp"><Img class="accImg" src="images/accImg.png"
					height="40" width="50" alt=""> &verbar;&nbsp;&nbsp;Login</a>
				<%
					} else {
						HttpSession s1 = request.getSession();
						String str = s1.getAttribute("cUserName").toString();
						if (str.equals("ADMIN")) {
				%>
				<a href="admin.jsp"><Img class="accImg" src="images/accImg.png"
					height="40" width="50" alt=""> &verbar;&nbsp;&nbsp;ADMIN</a>

				<%
					} else {

							UserDAO d1 = new UserDAO();
							ArrayList<UserBean> arrayList = new ArrayList<UserBean>();
							arrayList = d1.getUser(str);

							for (UserBean usr : arrayList) {
				%>

				<a href="account.jsp" style="text-transform: capitalize;"><Img
					style="object-fit: cover;" class="accImg"
					src="Output/accImg/<%=usr.getAccImg()%>" height="40" width="45"
					alt=""> &nbsp;&verbar;&nbsp;&nbsp;Hi'&nbsp;<%=usr.getFirstName()%></a>
				<%
					}
						}
					}
				%>






			</nav>

		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/skel.min.js" type="text/javascript"></script>
	<script src="assets/js/util.js" type="text/javascript"></script>
	<script src="assets/js/main.js" type="text/javascript"></script>
</body>
</html>