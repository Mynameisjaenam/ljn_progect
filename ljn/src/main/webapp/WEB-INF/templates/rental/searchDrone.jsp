<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Nam's Drone Rental</title>
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />

<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

function rentaldrone(a) {
    var dNo = a
   
   $.ajax({
      url:'rental.do',
      type:'GET',
      data:{         
         droneNo:dNo
      },
      datatype:'JSON',         
      success: function(data) {
    	  location = "rental.do"
      }
   });
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

<style>
#rental {
	width: 600px;
	height: 600px;
	margin: 0 auto;
}

#rental_form {
	/* text-align:center; */
	border-radius: 10px;
	padding: 50px;
	background-color: rgba(051, 051, 051, 0.9);
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top:0%;
	width:100%;
	height:100%;
	background-color: gray; 
	z-index: 100;
	background:rgba(255,255,255,0.5);
}

.bigPicture {
	position: relative;
	display:flex;
	justify-content: center;
	align-items: center;
}
		
.bigPicture img {
	width:600px;
}

</style>
<body id="page-top">

	<jsp:include page="/WEB-INF/templates/header.jsp"></jsp:include>
<br><br><br>
	<header class="masthead">
		<div id="con">
			<div id="rental">			
				<div id="rental_form">				
					<form>
					<!-- <br><br><br><br><br><br>
					<br><br><br><br><br><br> -->
						<h3 class="login" style="letter-spacing: -1px; color:white;">대여가능한 드론</h3>		
						<input type="hidden" class="form-control" id="rentalSDate" name="rentalSDate" value="${SessionrentalSDate}">
						<input type="hidden" class="form-control" id="rentalEDate" name="rentalEDate" value="${SessionrentalEDate}">				
						<br>
						<hr>
						<br>
						<div id="mainHide">
							<table class="table" id="table" style='width: 1000px'>
								<thead style="background-color: #CC9966">
									<tr>
										<th scope="col">드론번호</th>
										<th scope="col">드론종류</th>
										<th scope="col">드론정보</th>
										<th scope="col">대여</th>
									</tr>
								</thead>
								<tbody>
								
								<c:forEach var="drone" items="${sDrone}">
										<tr style="color:white">
											<td>${drone.droneNo}</td>
											<td>${drone.droneName}</td>
											<td>
											<div style="float: left; width: 50%;">
							                	<img class="img-fluid" style="width:200px; height:100px;" src="${pageContext.request.contextPath}/resources/upload/${drone.droneImage}" alt="..." />
							                </div>
							                <div style="float: left; width: 50%;">
							                	드론명:${drone.droneName}<br>
							                	용도:${drone.droneUsing}<br>
							                	1일대여료:<fmt:formatNumber value="${drone.price}" pattern="#,###원"/>
							                </div>
							                <div class='bigPictureWrapper'>
											<div class='bigPicture'>
											</div>
											</div>											
											</td>								
											
											<td>
											<c:set var="dno" value="${drone.droneNo}" />
											<c:if test="${dno eq 1}">																							
							                    <input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='rentaldrone1.do'" value="대여하기" />																			
											</c:if>
											<c:if test="${dno eq 2}">
												<input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='rentaldrone2.do'" value="대여하기" />											
											</c:if>
											<c:if test="${dno eq 3}">
												<input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='rentaldrone3.do'" value="대여하기" />											
											</c:if>
											<c:if test="${dno eq 4}">
												<input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='rentaldrone4.do'" value="대여하기" />											
											</c:if>
											<c:if test="${dno eq 5}">
												<input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='rentaldrone5.do'" value="대여하기" />											
											</c:if>
											<c:if test="${dno eq 6}">
												<input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='rentaldrone6.do'" value="대여하기" />																							
											</c:if>
											</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>																
						<br/>
						
						
						<p></p>
						<br> <input type="button" style="width:100px; height:50px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='main.do'" value="확인" />
					</form>
				</div>
			</div>
		</div>
	</header>

</body>
</html>
