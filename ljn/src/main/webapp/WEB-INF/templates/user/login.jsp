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

   function login(){
      var id = $("#userId").val();
      var pw = $("#userPw").val();
      if(id == ""){
         alert("아이디를 입력하세요.");
      }else if(pw == ""){
         alert("비밀번호를 입력하세요.");
      }else{
         $.ajax({
            url : "login.do",
            type : "POST",
            data :{
               userId : id,
               userPw : pw
            },
            datatype:"text",
            
            success : function(data){               
               if(data == "ok"){
                  alert("반갑습니다.");
                  location.href = "main.do";
               }else{
                  alert("존재하지 않는 정보입니다.")
               }
         }
      })
   }      
}
   
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
									<h2 class="mt-0" style="color:white">로그인</h2>
									<hr class="divider" />
								</div>
							</div>
							<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
								<div class="col-lg-6">
									<form id="contactForm" data-sb-form-api-token="API_TOKEN">

										<div class="form-floating mb-3">
											<input class="form-control" id="userId" name="userId" type="text" placeholder="아이디" data-sb-validations="required" />
											<label for="userId">아이디</label>
										</div>

										<div class="form-floating mb-3">
											<input class="form-control" id="userPw" name="userPw"
												type="password" placeholder="비밀번호" data-sb-validations="required" /> 
											<label for="userPw">비밀번호</label>
										</div>
										<div style="text-align: right">																						
											<input type="button" style="width:80px; height:40px;" onclick="login()" class="btn btn-primary btn-sm" value="로그인" />											
											<input type="button" style="width:80px; height:40px;" onclick="location.href='signUpform.do'" class="btn btn-primary btn-sm" value="회원가입" />																				
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
