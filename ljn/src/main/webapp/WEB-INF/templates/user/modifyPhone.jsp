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
</head>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

var checkPhone = /^[0-9]{11}$/;

function modifyPhone(){
    var phone = $('#userPhone').val();
    if(phone==""){
       alert("변경할 전화번호를 입력하세요.")
    } else if(!checkPhone.test(phone)) {
		alert("전화번호 형식이 올바르지 않습니다.")
		return false;
	} else{
          $.ajax({
             url:"updatePhone.do",
             type:"POST",
             data:{
              userId:$("#userId").val(),
              userPhone:$("#userPhone").val()
          },
             dataType:"text",
             success:function(data){
             alert("변경되었습니다.")
             opener.parent.location="http://localhost:8800/ljn/myPage.do";
             self.close();
          },
             error:function(){
             alert("변경실패.");
       }
    })
 }
}

</script>

<body id="page-top">


	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">

					<section class="page-section" id="contact">
						<div class="container px-4 px-lg-5">
							<div class="row gx-4 gx-lg-5 justify-content-center">
								<div class="col-lg-8 col-xl-6 text-center">
									<h2 class="mt-0" style="color:white">전화번호 변경</h2>
									<hr class="divider" />
								</div>
							</div>
							<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
								<div class="col-lg-6">
									<form id="contactForm" data-sb-form-api-token="API_TOKEN">
										
										<input class="form-control" id="userId" name="userId" type="hidden" value="${SessionUserId}" />
										<input class="form-control" id="userPw" name="userPw" type="hidden" value="${SessionUserPw}" />
										
										<div class="form-floating mb-3">											
											<input class="form-control" id="userPhone" name="userPhone" type="text" value="${SessionUserPhone}" />
											<label for="userPhone">변경할 전화번호</label>																																		
										</div>																				
																														
										<div style="text-align: right">										
											<input type="button" style="width:80px; height:40px;" onclick="modifyPhone()" class="btn btn-primary btn-sm" value="변경" />
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
