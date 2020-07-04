<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet"
	href="htt://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="assets/css/up.css">

<link rel="stylesheet" href="assets/css/main.css">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						function bs_input_file() {
							$(".input-file")
									.before(
											function() {
												if (!$(this).prev().hasClass(
														'input-ghost')) {
													var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
													element
															.attr("name", $(
																	this).attr(
																	"name"));
													element
															.change(function() {
																element
																		.next(
																				element)
																		.find(
																				'input')
																		.val(
																				(element
																						.val())
																						.split(
																								'\\')
																						.pop());
															});
													$(this)
															.find(
																	"button.btn-choose")
															.click(
																	function() {
																		element
																				.click();
																	});
													$(this)
															.find(
																	"button.btn-reset")
															.click(
																	function() {
																		element
																				.val(null);
																		$(this)
																				.parents(
																						".input-file")
																				.find(
																						'input')
																				.val(
																						'');
																	});
													$(this).find('input')
															.css("cursor",
																	"pointer");
													$(this)
															.find('input')
															.mousedown(
																	function() {
																		$(this)
																				.parents(
																						'.input-file')
																				.prev()
																				.click();
																		return false;
																	});
													return element;
												}
											});
						}

						bs_input_file();
						

						$("#uploadBtn")
								.on(
										"click",
										function() {
											var url = "accImgUp";
											var form = $("#sampleUploadFrm")[0];
											var data = new FormData(form);
											/* var data = {};
											data['key1'] = 'value1';
											data['key2'] = 'value2'; */
											$
													.ajax({
														type : "POST",
														encType : "multipart/form-data",
														url : url,
														cache : false,
														processData : false,
														contentType : false,
														data : data,
														success : function(msg) {
															var response = JSON
																	.parse(msg);
															var status = response.status;
															if (status == 1) {
																alert("File has been uploaded successfully");
															} else {
																alert("Couldn't upload file");
															}
														},
														error : function(msg) {
															alert("Couldn't upload file");
														}
													});
										});
					});
	//pp

	
</script>


</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="form-style-5">
		<fieldset>
			<legend>
				<span></span> Change Profile Picture
			</legend>
		</fieldset>
		<fieldset>
			<legend>
				<span class="number">1</span> Upload Your Profile Picture
			</legend>
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<form id="sampleUploadFrm"  method="POST" action="account.jsp"
						enctype="multipart/form-data">
						<!-- COMPONENT START -->
						<div class="form-group">
							<div class="input-group input-file" name="file">
								<span class="input-group-btn">
									<button class="btn btn-default btn-choose" type="button">Choose</button>
									
								</span> <input type="text" class="form-control"
									placeholder='Choose a file...' /> <span
									class="input-group-btn">
									<button class="btn btn-warning btn-reset" type="button">Reset</button>
								</span>
								<br><br>
							</div>
						</div>
					
						<!-- COMPONENT END -->
						<div class="form-group">
							<button type="button" class="btn btn-primary pull-right"
								id="uploadBtn" value="thumb" name="submit">Submit</button>

						</div>
					</form>
				</div>
			</div>
			<a href="account.jsp"><button class="btn btn-warning btn-reset" type="button">Back To account Page</button><a>
		</fieldset>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
