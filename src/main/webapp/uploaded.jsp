<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.*"%>
<%@page import="com.util.*"%>
<%@page import="com.model.*"%>
<html>
	<head>
		<title>Uploaded Videos</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<link rel="stylesheet" href="assets/css/uploaded.css" />
		<link rel="stylesheet" href="assets/css/uploadedMain.css" />

	</head>
	<body id="top">
			<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
 
               <div id="main">
					
					<div class="inner">

        			
                <h2>Uploaded Videos</h2>
				
	    <!-- upvids item -->
      <div class="container-table-upvids pos-relative" style="text-transform: capitalize;">
        <div class="wrap-table-uploaded bgwhite">
          <table class="table-uploaded">
            <tr class="table-head">
              <th class="column-1">Video</th>
              <th class="column-2">Description</th>
              <th class="column-3">Date Time</th>
              <th class="column-4"></th>
              <th class="column-5"></th>
            </tr>
			<%
			 	HttpSession s1=request.getSession();
           		String str=s1.getAttribute("cUserName").toString();
           		videoDAO v1 = new videoDAO();
				ArrayList<videoBean> arrayList = new ArrayList<videoBean>();
				arrayList=v1.getVideoByUser(str);
			
				for(videoBean vid: arrayList){
					%>
            <tr class="table-row">
              <td class="column-1">
                <div class="upvids-img-product b-rad-4 o-f-hidden">
                  <img style="object-fit: fill;" src="Output/Thumbs/<%=vid.getVidId()%>.thumb.jpg" alt="IMG-PRODUCT">
                </div>
              </td>
              <td class="column-2"><%=vid.getName() %></td>
              <td class="column-3"><%=vid.getDate() %></td>

              <td class="column-4"><button class="btn1">Edit</button></td>
              <form onSubmit="if(!confirm('Are you Sure,This can not e undone?')){return false;}" action="deleteVideos" method="post">
              <input type="hidden" value="<%=vid.getVidId()%>" name="vidId">
              <td class="column-5"><button type="submit"  class="btn2">x</button></td>
              </form>
             
            </tr>
             

           	<%
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