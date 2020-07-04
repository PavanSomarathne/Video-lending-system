<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Sign-Up/Login Form</title>
<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="assets/css/main.css">


</head>

<body>

	<div class="form">

		<ul class="tab-group">
			<li class="tab active"><a href="#signup">Sign Up</a></li>
			<li class="tab"><a href="#login">Log In</a></li>
		</ul>
		

		<div class="tab-content">
			
			<div id="signup">
				<h1 style="color: red;">${userInvalid}</h1>
				<h1>Sign Up</h1>

				<form action="loginServ" method="post">

					<div class="top-row">
						<div class="field-wrap">
							<label> First Name<span class="req">*</span>
							</label> <input type="text" required autocomplete="off" name="fName"/>
						</div>

						<div class="field-wrap">
							<label> Last Name<span class="req">*</span>
							</label> <input type="text" required autocomplete="off" name="lName" />
						</div>
					</div>

					<div class="field-wrap">
						<label> Email Address<span class="req">*</span>
						</label> <input type="email" required autocomplete="off" name="un"/>
					</div>

					<div class="field-wrap">
						<label> Set A Password<span class="req">*</span>
						</label> <input type="password" required autocomplete="off" name="pw"/>
					</div>
					<div class="field-wrap">
						<label> Confirm Your Password<span class="req">*</span>
						</label> <input type="password" required autocomplete="off"/>
					</div>
					

					<button type="submit" class="button button-block" value="Register" name="Submit">Get Started</button>

				</form>

			</div>
			<div id="login">
				<h1>Welcome Back!</h1>

				<form action="loginServ" method="post">

					<div class="field-wrap">
						<label> Email Address<span class="req">*</span>
						</label> <input type="text" required  name="un"/>
					</div>

					<div class="field-wrap">
						<label> Password<span class="req">*</span>
						</label> <input type="password" required  name="pw"/>
					</div>
					

					<p class="forgot">
						<a href="#">Forgot Password?</a>
					</p>

					<button class="button button-block" value="Login" name="Submit">Log In</button>

				</form>

			</div>

			

		</div>
		<!-- tab-content -->

	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



	<script src="assets/js/login.js"></script>




</body>

</html>
