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

function signUp() {

	var id = $("#userId").val();
	var pw1 = $("#userPw").val();
	var pw2 = $("#userPw2").val();
	var name = $("#userName").val();
	var phone = $("#userPhone").val();
	var email = $("#userEmail").val();
	
	var checkPhone = /^[0-9]{11}$/;
	
	if(id == "") {
		alert("아이디를 입력하세요.");
	} else if(pw1 == "") {
		alert("비밀번호를 입력하세요.")
	} else if(pw2 == "") {
		alert("비밀번호 확인을 입력하세요.")
	} else if(($("#userPw").val()).length < 6) {
		alert("비밀번호는 6자 이상으로 입력해 주세요.")
	} else if(name == "") {
		alert("이름을 입력하세요.")
	} else if(phone == "") {
		alert("전화번호를 입력하세요.")
	} else if(!checkPhone.test(phone)) {
		alert("전화번호 형식이 올바르지 않습니다.")
		return false;
	} else if(email == "") {
		alert("이메일을 입력하세요.")
	} else {
		$.ajax({
            url:'signUp.do',
            type:'POST',
            data:{
               userId:id,
               userPw:pw1,
               userPw2:pw2,
               userName:name,
               userPhone:phone,
               userEmail:email               
            },
            datatype:'JSON',
            
            success: function(data) {
               if(data == "ok") {
                  alert("회원가입이 완료되었습니다.");               
                  location = "login.do"
               } else if(data == "fail") {
            	  alert("아이디 중복확인을 해주세요.");      
               }
            }
         });
	}	
}

function signUpCount() {
    $.ajax({
       url : "signUpCount.do",
       type : "POST",
       dataType : "text",
       data : {
          userId : $("#userId").val()
       },
       success : function(data) {
          if (data == "fail") {
             alert("이미 사용중인 아이디입니다.");
          } else if (data == "ok") {
             alert("사용가능한 아이디입니다.")
          }
       }
    });
 };
 
$(function(){
     $('#userPw').keyup(function(){
           $('#userPw2').html('');
     });
        $('#userPw2').keyup(function(){
         if($('#userPw').val() != $('#userPw2').val()){
             $('#password_check').html('비밀번호 일치하지 않음<br>');
             $('#password_check').attr('color', '#f82a2aa3');                 
          } else{
              $('#password_check').html('비밀번호 일치함<br>');
              $('#password_check').attr('color', '#199894b3'); 
          }
     });
});

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
									<h2 class="mt-0" style="color:white">회원가입</h2>
									<hr class="divider" />
								</div>
							</div>
							<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
								<div class="col-lg-6">
									<form id="contactForm" data-sb-form-api-token="API_TOKEN">

										<div class="form-floating mb-3">
											<input class="form-control" id="userId" name="userId" type="text" placeholder="아이디" data-sb-validations="required" />
											<label for="userId">아이디</label>
											<br>
											<!-- <input type="button" onclick="signUpCount()" class="btn btn-primary btn-xl" value="아이디 중복확인" /> -->
											<input type="button" style="width:120px; height:40px;" onclick="signUpCount()" class="btn btn-primary btn-sm" value="아이디 중복확인" />
										</div>

										<div class="form-floating mb-3">
											<input class="form-control" id="userPw" name="userPw" type="password" placeholder="비밀번호" data-sb-validations="required" /> 
											<label for="userPw">비밀번호</label>
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userPw2" name="userPw2" type="password" placeholder="비밀번호" data-sb-validations="required" /> 
											<label for="userPw2">비밀번호 확인</label>
											<font id="password_check" size="2"></font>
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userName" name="userName" type="text" placeholder="이름" data-sb-validations="required" /> 
											<label for="userName">이름</label>
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userPhone" name="userPhone" type="text" placeholder="전화번호" data-sb-validations="required" /> 
											<label for="userPhone">전화번호</label>
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="userEmail" name="userEmail" type="email" placeholder="이메일" data-sb-validations="required" /> 
											<label for="userEmail">이메일</label>
										</div>
										
										<div style="text-align: right">
											<!-- <input type="button" onclick="signUp()" class="btn btn-primary btn-xl" value="회원가입" />											
											<input type="button" onclick="location.href='main.do'" class="btn btn-primary btn-xl" value="취소" /> -->
											<input type="button" style="width:80px; height:40px;" onclick="signUp()" class="btn btn-primary btn-sm" value="회원가입" />
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

		<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Contact 053-123-1234</div></div>
        </footer>

</body>
</html>
