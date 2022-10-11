<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Nam's Book Rental</title>
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
</head>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

function modifyPw(){
    var pass = $('#userPw').val(); 
    var sePass = $("#userPw2").val();
      
      if(pass == ""){
          alert("비밀번호를 입력하세요.");
          
       }else if(pass != sePass){
          alert("비밀번호가 일치하지 않습니다.")
       }else{
         var width = 420;
         var height = 700;
         
         var left = (window.screen.width/2) - (width/2);  
         var top = (window.screen.height/4);
           
         var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
         const url = "http://localhost:8800/ljn/modifyPw.do";
         window.open(url, "변경", windowStatus);
       }
 }
 
function modifyPhone(){
    var pass = $('#userPw').val(); 
    var sePass = $("#userPw2").val();
      
      if(pass == ""){
          alert("비밀번호를 입력하세요.");
          
       }else if(pass != sePass){
          alert("비밀번호가 일치하지 않습니다.")
       }else{
         var width = 420;
         var height = 700;
         
         var left = (window.screen.width/2) - (width/2);  
         var top = (window.screen.height/4);
           
         var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
         const url = "http://localhost:8800/ljn/modifyPhone.do";
         window.open(url, "변경", windowStatus);
       }
 }
 
function modifyEmail(){
    var pass = $('#userPw').val(); 
    var sePass = $("#userPw2").val();
      
      if(pass == ""){
          alert("비밀번호를 입력하세요.");
          
       }else if(pass != sePass){
          alert("비밀번호가 일치하지 않습니다.")
       }else{
         var width = 420;
         var height = 700;
         
         var left = (window.screen.width/2) - (width/2);  
         var top = (window.screen.height/4);
           
         var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
         const url = "http://localhost:8800/ljn/modifyEmail.do";
         window.open(url, "변경", windowStatus);
       }
 }

</script>

<style>

.pull-right {
	float: right !important
}

.pull-left {
	float: left !important
}

.btn7 {
	width: 50px;
}

</style>

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
									<h2 class="mt-0" style="color:white">마이페이지</h2>
									<hr class="divider" />
								</div>
							</div>
							<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
								<div class="col-lg-6">
									<form id="contactForm" data-sb-form-api-token="API_TOKEN">

										<div class="form-floating mb-3">
											<input class="form-control" id="userId" name="userId" type="text" value="${SessionUserId}" readonly />
											<label for="userId">아이디</label>											
										</div>
										
										<div class="form-floating mb-3" >
											<input class="form-control" id="userPw" name="userPw" type="hidden" value="${SessionUserPw}" readonly />
											<input class="form-control" id="userPw2" name="userPw2" type="password" value="${SessionUserPw}" readonly />
											<label for="userPw">비밀번호</label>
										</div>				
										<div style="text-align: right">
										<input type="button" style="width:80px; height:40px;" onclick="modifyPw()" class="btn btn-primary btn-sm" value="변경" />		
										</div>
										<br>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userName" name="userName" type="text" value="${SessionUserName}" readonly /> 
											<label for="userName">이름</label>
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userPhone" name="userPhone" type="text" value="${SessionUserPhone}" readonly /> 
											<label for="userPhone">전화번호</label>
										</div>
										<div style="text-align: right">				
										
										<input type="button" style="width:80px; height:40px;" onclick="modifyPhone()" class="btn btn-primary btn-sm" value="변경" />	
										</div>
										<br>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userEmail" name="userEmail" type="email" value="${SessionUserEmail}" readonly /> 
											<label for="userEmail">이메일</label>
										</div>
										<div style="text-align: right">														
										<input type="button" style="width:80px; height:40px;" onclick="modifyEmail()" class="btn btn-primary btn-sm" value="변경" />		
										</div>
										<br>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userAddressNum" name="userAddressNum" type="text" value="${SessionUseruserAddressNum}" readonly /> 
											<label for="userEmail">우편번호</label>
										</div>
										<br>
										
										<div class="form-floating mb-3">
											<input class="form-control" style="width:450px" id="userAddress" name="userAddress" type="text" value="${SessionUseruserAddress}" readonly /> 
											<label for="userEmail">주소</label>
										</div>
										<br>
										
										<div style="text-align: right">
											<input type="button" style="width:80px; height:40px;" onclick="location.href='rentalConfirm.do'" class="btn btn-primary btn-sm" value="대여조회" />
											<input type="button" style="width:110px; height:40px;" onclick="location.href='myBoardList.do'" class="btn btn-primary btn-sm" value="나의게시글조회" />
											<input type="button" style="width:110px; height:40px;" onclick="location.href='selectQuestionList.do'" class="btn btn-primary btn-sm" value="나의문의글조회" />											
										</div>
										<br>
										<div style="text-align: right">											
											<input type="button" style="width:80px; height:40px;" onclick="location.href='main.do'" class="btn btn-primary btn-sm" value="홈으로" />
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

		<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Contact 053-123-1234</div></div>
        </footer>

</body>
</html>
