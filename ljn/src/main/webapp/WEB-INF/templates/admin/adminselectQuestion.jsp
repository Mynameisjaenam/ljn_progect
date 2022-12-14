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

function adminAnswer() {
	var Id = $('#userId').val();
	var No = $('#questionNo').val();
	
	$.ajax({
		url:'adminAnswerForm.do',
		type:'GET',
		data:{
			userId:Id,
			questionNo:No
		},
		datatype:'JSON',
		
		success: function() {
			location = "adminAnswerForm.do"			
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

	<%
		String userId = (String) session.getAttribute("SessionUserId");
		String userPw = (String) session.getAttribute("SessionUserPw");
		String userName = (String) session.getAttribute("SessionUserName");
	%>

	<header class="masthead">
		<div id="con">
			<div id="rental">
				<div id="rental_form">
					<form>
						<h3 class="login" style="letter-spacing: -1px; color:white;">????????? ??????</h3>
						<input id="userId" value="${selectQuestion.userId}" type="hidden" />
        				<input id="questionNo" value="${selectQuestion.questionNo}" type="hidden" />
						<br>
						<hr>
						<br>
						<div id="mainHide">
							<table class="table" id="table" style='width: 1000px'>					                      
					            <tr>
					                <th style="padding:13px 0 0 15px; color: #FDF5DC; font-size: 17px;">??????</th>
					                <td>
					                <input id="title" name="content" type="text" class="col-md-1 form-control input-sm" value="${selectQuestion.title}" readonly />					         
					                </td>
					            </tr>
					            <tr>
					                <th style="padding:13px 0 0 15px; color: #FDF5DC; font-size: 17px;">??????</th>					                
					                <td>					              
					                <textarea id="content" name="content" class="col-md-1 form-control input-sm" maxlength="140" rows="7" style="height: 200px;" readonly>${selectQuestion.content}</textarea><span class="help-block"></span>					                
					                </td>
					            </tr>
					            
					        </table>
							<div class="pull-left">
					        
						</div>																						
						<div align="right" >						
						<!-- <input type="button" style="width:100px; height:50px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='adminAnswer.do'" value="???????????????" />	 -->
						<input type="button" style="width:80px; height:40px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="adminAnswer(${selectQuestion.questionNo})" value="???????????????" />										
						</div>
						<p></p>
						<br> <input type="button" style="width:100px; height:50px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='adminQuestionList.do'" value="????????????" />
					</form>
				</div>
			</div>
		</div>
	</header>

</body>
</html>
