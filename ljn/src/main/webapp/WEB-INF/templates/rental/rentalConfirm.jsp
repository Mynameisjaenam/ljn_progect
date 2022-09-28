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

function rentaldelete(a) {
    var renNo = a
   
   $.ajax({
      url:'rentalDeleteConfirm.do',
      type:'POST',
      data:{         
         rentalNo:renNo
      },
      datatype:'JSON',         
      success: function(data) {
         if(data == "ok"){
            var width = 420;
            var height = 700;
            
            var left = (window.screen.width/2) - (width/2);  
            var top = (window.screen.height/4);
              
            var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
            const url = "http://localhost:8800/ljn/rentalDelete.do";
            window.open(url, "변경", windowStatus);
         }
         
      }
   });
}

</script>

<style>
#rental {
	width: 600px;
	height: 600px;
	margin: 0 auto;
	/* position: relative; */
	/* background:#ddd; */
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
</style>
<body id="page-top">

	<jsp:include page="/WEB-INF/templates/header.jsp"></jsp:include>

	<header class="masthead">
		<div id="con">
			<div id="rental">
				<div id="rental_form">
					<form>
						<h3 class="login" style="letter-spacing: -1px; color:white;">나의 대여내역 조회</h3>
						<br>
						<hr>
						<br>
						<div id="mainHide">
							<table class="table" id="table" style='width: 1000px'>
								<thead style="background-color: #CC9966">
									<tr>
										<th scope="col">대여번호</th>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">연락처</th>
										<th scope="col">드론번호</th>
										<th scope="col">예약시간날짜</th>
										<th scope="col">예약종료날짜</th>
										<th scope="col">드론종류</th>
										<th scope="col">대여금액</th>
										<th scope="col">취소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="rental" items="${rentalList}">
										<tr style="color:white">
											<td>${rental.rentalNo}</td>
											<td>${rental.userId}</td>
											<td>${rental.userName}</td>
											<td>${rental.userPhone}</td>
											<td>${rental.droneNo}</td>
											<td><fmt:formatDate value="${rental.rentalSDate}" pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${rental.rentalEDate}" pattern="yyyy-MM-dd" /></td>
											<td>${rental.droneName}</td>
											<td>${rental.price}원</td>
											<td><input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="rentaldelete(${rental.rentalNo})" value="취소" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>																
						<br/>
						
						<div class="text-center">
				            <nav aria-label="Page navigation" style="text-align: center;">         
				               <ul class="pagination justify-content-center">
				                  <c:if test="${firstPage > pageList }">
				                     <li><a class="page-link" href="rentalConfirm.do?viewPage=${firstPage - pageList}">이전</a></li>
				                  </c:if>   
				                  <c:forEach var="i" begin="${firstPage}" end="${lastPage}">                                                
				                     <li><a class="page-link" href="rentalConfirm.do?viewPage=${i}">${i}</a></li>
				                  </c:forEach>
				                  <c:if test="${lastPage < totalPage}">
				                     <li><a class="page-link" href="rentalConfirm.do?viewPage=${firstPage + pageList}">다음</a></li>
				                  </c:if>
				               </ul>      
				            </nav> 
				         </div>
						
						<p></p>
						<br> <input type="button" style="width:100px; height:50px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='main.do'" value="확인" />
					</form>
				</div>
			</div>
		</div>
	</header>

</body>
</html>
