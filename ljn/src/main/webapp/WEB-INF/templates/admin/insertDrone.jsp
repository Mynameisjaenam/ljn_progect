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

function insertDrone() {
	
    var dNo = $("#droneNo").val();
    var dName = $("#droneName").val();
    var pri = $("#price").val();
    var dimage = document.getElementById("droneImage").files[0].name;
    
    alert(dimage)
    
    if(dName == ""){
       alert("드론종류를 입력하세요.")
    } else if(pri == ""){
       alert("가격을 입력하세요.")
    } else{
       $.ajax({
          url:'insertDrone.do',
          type:'POST',
          data:{
        	 droneNo:dNo,
        	 droneName:dName,
        	 price:pri,
        	 droneImage:dimage
          },
          datatype:'JSON',
          
          success: function(data) {
             if(data == "ok") {
				alert("등록이 완료되었습니다.");               
                location = "main.do"
             } else if (data == "fail") {
				alert("이미 존재하는 드론 이름입니다.");
             }
          }
       });
    }
 }
 
$(document).ready(function (e){
    
    $(document).on("click","img",function(){
       var path = $(this).attr('src')
       showImage(path);
    });
    
    function showImage(fileCallPath){
        
        $(".bigPictureWrapper").css("display","flex").show();
        
        $(".bigPicture")
        .html("<img src='"+fileCallPath+"' >")
        .animate({width:'100%', height: '100%'}, 1000);
        
      }
      
    $(".bigPictureWrapper").on("click", function(e){
        $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
        setTimeout(function(){
          $('.bigPictureWrapper').hide();
        }, 1000);
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
									<h2 class="mt-0" style="color:white">드론등록</h2>
									<hr class="divider" />
								</div>
							</div>
							<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
								<div class="col-lg-6">
									<form enctype="multipart/form-data" id="contactForm" action="insertDrone.do" method="POST" data-sb-form-api-token="API_TOKEN">

										<div class="form-floating mb-3">
											<input class="form-control" id="droneName" name="droneName" type="text" />
											<label for="droneName">드론이름</label>											
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="price" name="price" type="text" />
											<label for="price">1일대여료</label>											
										</div>
										
										<div class="form-floating mb-3">
											<input class="form-control" id="file" name="file" type="file" accept="image/png, image/jpeg"  />
											<label for="file">이미지</label>
										</div>																					
										
										<div class="form-floating mb-3">
											<input class="form-control" id="droneUsing" name="droneUsing" type="text" />
											<label for="droneUsing">드론용도</label>											
										</div>				
										
										<div style="text-align: right">
											<!-- <input type="button" style="width:80px; height:40px;" onclick="insertDrone()" class="btn btn-primary btn-sm" value="등록하기" /> -->
											<input type="submit" style="width:80px; height:40px;" onclick="insertDrone()" class="btn btn-primary btn-sm" value="등록하기" />
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
