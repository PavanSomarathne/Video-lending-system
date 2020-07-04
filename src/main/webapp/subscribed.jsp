<!DOCTYPE HTML>
<%@page import="com.service.*"%>
<%@page import="com.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<title>Uploaded Videos</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/subsUploaded.css" />

	</head>
	<body id="top">
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
        			
                
                <br>
                <br>
 
                <div id="main">
					
					<div class="inner">

        			
                <h2>Subscribed Videos</h2>
				<br>
	    <!-- subscribed vids item -->
	    
		      <div class="container-table-upvids pos-relative">
		        <div class="wrap-table-uploaded bgwhite">
		          <table class="table-uploaded">
		            <tr class="table-head">
		              <th class="column-1">Video</th>
		              <th class="column-2">Name</th>
		              <th class="column-3">Details</th>
		              <th class="column-4"></th>
		              <th class="column-5"></th>
		            </tr>
			<%
					try {
						Connection currentCon = null;
						Statement statement = null;
						ResultSet resultSet = null;
						PreparedStatement preparedStatement;
						currentCon = ConnectionManager.getConnection();
						HttpSession s1=request.getSession();
						String str=s1.getAttribute("cUserName").toString();
						
							preparedStatement = currentCon.prepareStatement("select * from videos v inner join subscribed s on v.vidId=s.vidId where s.user=? ");
							preparedStatement.setString(1,str);
						

						statement = currentCon.createStatement();

						resultSet = preparedStatement.executeQuery();
							while (resultSet.next()) {
				%>
            <tr class="table-row">
              <td class="column-1">
                  	<div class="subs" >
			            <video width="350" height="200" controls>
			               <source src="Output/Vids/<%=resultSet.getString(1)%>.vid.mp4" type="video/mp4">
			                <source src="Output/Vids/<%=resultSet.getString(1)%>.vid.mp4" type="video/ogg">
			            </video>
        			</div>
              </td>
              <td class="column-2">
              	<div class="subs"><%=resultSet.getString("name")%></td></div>
              <td class="column-3">Date : <%=resultSet.getDate(10)%><br>Plan : <%=resultSet.getString("subPlan") %></td>
              <form onSubmit="if(!confirm('Are you Sure,This can not e undone?')){return false;}" action="deleteSubscription" method="post">
              <input type="hidden" value="<%=resultSet.getString(1)%>" name="vidId">
              <td class="column-5"><button type="submit"  class="btn2">Unsubscribe</button></td>
              </form>
            </tr>
            
			<%
							}
							
							currentCon.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
			%>
			</div>
		</div>
	</table>
</div>
</div>
</div>
	

						<br>

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