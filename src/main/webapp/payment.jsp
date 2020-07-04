<!DOCTYPE HTML>

<html>
	<head>
		<title>vidFlick</title>
		<meta charset="utf-8" />
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<link rel="stylesheet" href="assets/css/payMain.css" />
		 <link rel="stylesheet" href="assets/css/pay.css" />

	</head>
	
	<body id="top">
			<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>

      <!-- Main -->
      <%
      String vId = request.getParameter("vidId");
      String sPlan = request.getParameter("subPlan");
    %>
				<div id="main">
					 
					<div class="inner">
<h1 style="align:middle;color: red;position:relative;">${subValid}</h1>
			<!--Payment Page-->
			<h2> Payment Options</h2>
			
		<div class = "paybox">
		
		<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="/action_page.php">

        <div class="row">
          <div class="col-50">
          	<br>
            <h3>Bill Address </h3></br><br>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="Enter Name">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="email@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="address">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="city">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="Enter the State">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="00000">
              </div>
            </div>
          </div>

          <div class="col-50">
             
            <br>
            <h3>Payment</h3></br>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i style="color:navy;"><a href="#"><img src="images/payment/visa.png" height="40px" width="70px"></i>
              <i style="color:blue;"><a href="#"><img src="images/payment/mCard.png" height="40px" width="70px"></i>
              <i  style="color:red;"><a href="#"><img src="images/payment/aE.png " height="40px" width="70px"></i>
            
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="Enter the Name on Card">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="0000-0000-0000-0000">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="month">

            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="0000">
              </div>
              
            </div>
          </div>

        </div>

        </form>
        <form action="subscribeServ" method="post">
        <input type="hidden" value="<%=sPlan %>" name="subPlan">
        <input type="hidden" value="<%=vId %>" name="vidId">
        <button type="button" onclick="show_alert()" style="margin-left: 850px; padding: 25px 90px; font-size: 16px" >Continue</button> 
        </form>
         <script>
				function show_alert() {
					  if(confirm("This is the final step,This can not be undone,Are you sure?"))
					    document.forms[1].submit();
					  else
					    return false;
					}
			</script>
      
    </div>
  </div>
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