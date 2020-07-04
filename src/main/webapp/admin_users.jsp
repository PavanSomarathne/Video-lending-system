<!DOCTYPE HTML>
<%@page import="com.service.*"%>
<%@page import="com.util.*"%>
<%@page import="com.model.*"%>
<%@page import="java.util.ArrayList"%>
<html>
	<head>
		<title>vidFlick</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
		<link rel="stylesheet" href="assets/css/adminMain.css" />
		<link rel="stylesheet" href="assets/css/aduser.css" />
		 
		 
</head>


	<body id="top">
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
        			
		  <%
		HttpSession s1 = request.getSession();
		String str = s1.getAttribute("cUserName").toString();
	%>
		<!--Administrator video management page -->
			<div id="main">					
				<div class="inner">
		<br><br>
		<h2>Video Library</h2>
				
	    <!--uploaded videos library -->
      <div class="container-table-upvids pos-relative">
        <div class="wrap-table-uploaded bgwhite">
          <table class="table-uploaded">
            <tr class="table-head">
              <th class="column-1"></th>
              <th class="column-2">User</th>
              <th class="column-3"></th>
              <th class="column-3"></th>
            </tr>
<%
				UserDAO d1 = new UserDAO();
				ArrayList<UserBean> arrayList = new ArrayList<UserBean>();
				arrayList = d1.getAllUsers();

				for(int i = 0; i <arrayList.size() ; i++){
			%>
            <tr class="table-row" style="text-transform: capitalize;">
              <td class="column-1">
                <div class="upvids-img-product b-rad-4 o-f-hidden">
                  <img src="images/asd.jpg" alt="IMG-PRODUCT">
                </div>
              </td>
              <td class="column-2"><%=arrayList.get(i).getUsername()%></td>
              <form action="account1.jsp" method="post">
              <input type="hidden" value="<%=arrayList.get(i).getUsername()%>" name="userId">
              <td class="column-3"><button class="btn2">More Details</button></td>
              </form>
              <form onSubmit="if(!confirm('Are you Sure,This can not be undone?')){return false;}" action="deleteUsers" method="post">
              <input type="hidden" value="<%=arrayList.get(i).getUsername()%>" name="userId">
       		  <td class="column-4"><button  type="submit" class="btn2">Delete</button></td>
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