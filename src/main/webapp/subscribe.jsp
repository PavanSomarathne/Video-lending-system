<!DOCTYPE HTML>
<html>
    <head>
        <title>vidFlick</title>
		<meta charset="utf-8" />
	    
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		 
		 
		<link rel="stylesheet" href="assets/css/subscribe.css" />
    </head>
    
    <body>
    <%
		String vId = request.getParameter("vidId");
		
	%>

        <!-- Header -->
          <jsp:include page="header.jsp"></jsp:include>
        			
                    

        <div id="main">
            <div class="inner">
                        <br>

        <h1>Choose the plan that's right for you!</h1>
        <h4 style="text-align: center; ">Downgrade or upgrade at any time</h4>
        
        <table height="450px">
          <tr>
              <th><img src="images/become.png" alt="Snow" width="auto" height="150" align="middle"></th>
            <th><div class="container">
                 <a href="#popup1" class="image fit"><input type="image" src="images/gold.png" alt="Submit" width=45% height=45% ></a>
                </div></th>
            <th><div class="container">
                <a href="#popup2" class="image fit"><input type="image" src="images/silver.png" alt="Submit" width=45% height=45%></a>
                </div></th>
            <th><div class="container">
                <a href="#popup3" class="image fit"><input type="image" src="images/bronze.png" alt="Submit" width=45% height=45%></a>
                </div></th>
          </tr>
          <tr>
            <td style="border-left-color: #202024; border-right-color: #202024"><b>Price</b></td>
            <td style="border-right-color: #202024"><b>US $ 99.99</b></td>
            <td style="border-right-color:#202024"><b>US $ 9.99</b></td>
            <td style="border-right-color: #202024"><b>US $ 2.99</b></td> 
          </tr>
          
            <tr>
            <td style="border-left-color: #202024; border-right-color: #202024"><b>Subscription</b></td>
            <td style="border-right-color: #202024"><b>Yearly</b></td>
            <td style="border-right-color: #202024"><b>Monthly</b></td>
            <td style="border-right-color: #202024"><b>Weekly</b></td>
          </tr>

            <tr >
                <th><b>Subscribe as a</b></th>
            <th><div class="container">
                 <a href="#popup1" class="image fit"><img src="images/g1.jpg" alt=""></a>
                </div></th>
            <th><div class="container">
                <a href="#popup2" class="image fit"><img src="images/s1.jpg" alt=""></a>
                </div></th>
            <th><div class="container">
                <a href="#popup3" class="image fit"><img src="images/b1.jpg" alt=""></a>
                </div></th>
          </tr>

        </table>
        


            <div id="popup1" class="overlay">
                <div class="popup">
                    <br><br>
                    <img  style="margin-left:40%;" src="images/gold.png" width=110 height=140 >
                    <br><br>
                    <h2 style="text-align: center">Thank You for choosing GOLD PACK</h2>
                    <br>
                    <a class="close" href="#">&times;</a>
                    <div class="content">
                       

                              <table class="inner">
                              <tr class="second" style="background-color: white; color: black;">
                                <th><strong>Description</strong></th>
                                <th>Gold Pack</a></th>
                            
                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Renewal</strong></td>
                                <td>Every 1 Year</td>

                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Duration</strong></td>
                                <td>1 Year</td>
                
                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Discount</strong></td>
                                <td>5%</td>
                              </tr>

                               <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Total</strong></td>
                                <td>US $ 99.99</td>
                              </tr>

                            </table>

                    </div>
                    <br><br><br>
                     <a href="#" style="text-decoration: none; color:white;"><button class="button5" style="vertical-align:middle; float: left; margin-left: 45px;margin-bottom: 15px;"><span>Cancel</span></button></a>
                     <form action="payment.jsp" method="post">
                     <input type="hidden" value="Gold" name="subPlan">
                     <input type="hidden" value="<%=vId %>" name="vidId">
                    <button type="submit" class="button5" style="vertical-align:middle; float: right; margin-right: 45px;"><span>Proceed </span></button></a>
                    </form>
                </div>
            </div>
            <br><br>


                    <div id="popup2" class="overlay">
                <div class="popup">
                    <br><br>
                    <img style="margin-left:40%;" src="images/silver.png" width=110 height=150 >
                    <br><br>
                    <h2 style="text-align: center">Thank You for choosing SILVER PACK</h2>
                    <br>
                    <a class="close" href="#">&times;</a>
                    <div class="content">
                        <table class="inner">
                              <tr class="second" style="background-color: white; color: black;">
                                <th><strong>Description</strong></th>
                                <th>Silver Pack</a></th>
                            
                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Renewal</strong></td>
                                <td>Every 6 Month</td>

                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Duration</strong></td>
                                <td>6 Months</td>
                
                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Discount</strong></td>
                                <td>3%</td>
                              </tr>

                               <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Total</strong></td>
                                <td>US $ 9.99</td>
                              </tr>

                            </table>

                    </div>
                    <br><br><br>
                     <a href="#" style="text-decoration: none; color:white;"><button class="button5" style="vertical-align:middle; float: left; margin-left: 45px;margin-bottom: 15px;"><span>Cancel</span></button></a>
                    <form action="payment.jsp" method="post">
                     <input type="hidden" value="Silver" name="subPlan">
                     
                     <input type="hidden" value="<%=vId %>" name="vidId">
                   <button type="submit" class="button5" style="vertical-align:middle; float: right; margin-right: 45px;"><span>Proceed </span></button></a>
                    </form>
                </div>
            </div>
               <div id="popup3" class="overlay">
                <div class="popup">
                     <br><br>
                    <img style="margin-left:40%;" src="images/bronze.png" width=110 height=150 >
                    <br><br>
                    <h2 style="text-align: center">Thank You for choosing BRONZE PACK</h2>
                    <br>
                    <a class="close" href="#">&times;</a>
                    <div class="content">
                       
                        <table class="inner">
                              <tr class="second" style="background-color: white; color: black;">
                                <th><strong>Description</strong></th>
                                <th>Bronze Pack</a></th>
                            
                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Renewal</strong></td>
                                <td>Every 3 months</td>

                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Duration</strong></td>
                                <td> 3 Months</td>
                
                              </tr>
                              <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Discount</strong></td>
                                <td>0%</td>
                              </tr>

                               <tr style="background-color: white; color: black;border: none;">
                                <td><strong>Total</strong></td>
                                <td>US $ 2.99</td>
                              </tr>

                            </table>

                    </div>
                    <br><br><br>
                     <a href="#" style="text-decoration: none; color:white;"><button class="button5" style="vertical-align:middle; float: left; margin-left: 45px;margin-bottom: 15px;"><span>Cancel</span></button></a>
                     <form action="payment.jsp" method="post">
                     <input type="hidden" value="Bronze" name="subPlan">
                     <input type="hidden" value="<%=vId%>" name="vidId">
                    <button type="submit" class="button5" style="vertical-align:middle; float: right; margin-right: 45px;"><span>Proceed </span></button></a>
                    </form>
                </div>
            </div>
         </div>
        </div>
        
    </body>

</html>