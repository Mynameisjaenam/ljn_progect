<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Nam's Drone Rental</title>
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />

<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<script type="text/javascript">

$(function() {
    $("#rentalSDate").datepicker({ minDate: 0});
    $("#rentalEDate").datepicker({ minDate: 0});
} );

</script>

<body id="page-top">

	<jsp:include page="/WEB-INF/templates/header.jsp"></jsp:include>	

	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">

					<section class="page-section" id="contact">
						<div class="container px-4 px-lg-5">
							<div class="row gx-4 gx-lg-5 justify-content-center">
								<div class="col-lg-8 col-xl-6 text-center">
									<h2 class="mt-0" style="color:white">대여 날짜 검색</h2>
									<hr class="divider" />
								</div>
							</div>
							<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
								<div class="col-lg-6">
									<form id="contactForm" data-sb-form-api-token="API_TOKEN" action="searchDrone.do" method="POST">																										
										
										<div class="form-floating mb-3">											
											<input type="text" class="form-control" id="rentalSDate" name="rentalSDate" autocomplete="off">
											<label for="rentalSDate">대여시작일</label>
										</div>
										
										<div class="form-floating mb-3">											
											<input type="text" class="form-control" id="rentalEDate" name="rentalEDate" autocomplete="off">
											<label for="rentalEDate">대여종료일</label>
										</div>										
										
										<div style="text-align: right">
											<input type="submit" style="width:80px; height:40px;" class="btn btn-primary btn-sm" value="조회하기" />
											<!-- <input type="button" style="width:80px; height:40px;" onclick="dateCheck()" class="btn btn-primary btn-sm" value="조회하기" /> -->
											<input type="button" style="width:80px; height:40px;" onclick="location.href='main.do'" class="btn btn-primary btn-sm" value="취소" />
										</div>
									</form>
								</div>
							</div>

						</div>
					</section>

				</div>
				<div class="col-lg-8 align-self-baseline"></div>
			</div>
		</div>
	</header>

</body>
</html>
