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

function insertBoard() {
    var id = $('#userId').val();
    var tit = $('#title').val();
    var con = $('#content').val();
    var type = $('#boardType').val();
     
    if (tit == "") {
       alert("제목을 입력해주세요.");
    } else if (con == "") {
       alert("내용을 입력해주세요.");
    } else {
	    $.ajax({
	       url:'boardInsert.do',
	       type:'GET',
	       data:{
	          title:tit,
	          content:con,
	          boardType:type
	       },         
	       datatype:'JSON',   
	       success: function(data) {
	          alert("게시글이 등록 되었습니다.");
	          location = "boardList.do"
	       }       
	    });
    }
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
		String userPhone = (String) session.getAttribute("SessionUserPhone");
		String userEmail = (String) session.getAttribute("SessionUserEmail");
	%>

	<header class="masthead">
		<div id="con">
			<div id="rental">
				<div id="rental_form">
					<form>
						<h3 class="login" style="letter-spacing: -1px; color:white;">게시글 작성</h3>
						<br>
						<hr>
						<br>
						<div id="mainHide">
							<table class="table" id="table" style='width: 1000px'>

					            <tr>
					                <th style="padding:13px 0 0 15px; color: #FDF5DC; font-size: 17px;">게시판 선택</th>
					                <td>
					                    <div class="pull-left">
					                        <select class="form-control input-sm" id="boardType">
					                            <option>--분류--</option>
					                            <%
					                            	if(userId.equals("ADMIN")) {
					                            %>
					                            <option value="공지사항" selected="${board.boardType == '공지사항'}">공지사항</option>                       
					                            <option value="자유게시판" selected="${board.boardType == '자유게시판'}">자유게시판</option>
					                            <%
					                            	} else {
					                            %>
					                            <option value="자유게시판" selected="${board.boardType == '자유게시판'}">자유게시판</option>
					                            <%
					                            	}
					                            %>
					                        </select>
					                    </div>
					                </td>
					            </tr>            
					            <tr>
					                <th style="padding:13px 0 0 15px; color: #FDF5DC; font-size: 17px;">제목</th>
					                <td><input id="title" type="text" class="col-md-1 form-control input-sm" required="required" placeholder="제목을 입력하세요"/></td>
					            </tr>
					            <tr>
					                <th style="padding:13px 0 0 15px; color: #FDF5DC; font-size: 17px;">내용</th>
					                <td><textarea id="content" class="col-md-1 form-control input-sm" maxlength="140" rows="7" style="height: 200px;" required="required" placeholder="내용을 입력하세요"></textarea><span class="help-block"></span>
					                </td>
					            </tr>
					            
					        </table>
							<div class="pull-left">
					        
						</div>																
						<div align="right" >
							<input type="button" style="width:100px; height:50px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="insertBoard()" value="등록" />
						</div>							
						<p></p>
						<br> <input type="button" style="width:100px; height:50px; background-color: #CC9966;" class="btn btn-primary btn-sm" onclick="location.href='boardList.do'" value="목록으로" />
					</form>
				</div>
			</div>
		</div>
	</header>

</body>
</html>
