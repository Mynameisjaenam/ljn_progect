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
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
    
		<%
		String userId = (String) session.getAttribute("SessionUserId");
		String userPw = (String) session.getAttribute("SessionUserPw");
		String userName = (String) session.getAttribute("SessionUserName");
		String userPhone = (String) session.getAttribute("SessionUserPhone");
		String userEmail = (String) session.getAttribute("SessionUserEmail");
		%>
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-black fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.do">Nam's Drone Rental</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    
                    	<%
                    		if(userId != null && userPw != null && (userId.equals("ADMIN"))) {
                    	%>
                    
                    	<li class="nav-item"><a class="nav-link" href="main.do">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.do">회사소개</a></li>                        
                        <li class="nav-item"><a class="nav-link" href="boardList.do">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="adminQuestionList.do">문의내역</a></li>
                        <li class="nav-item"><a class="nav-link" href="adminConfirm.do">대여전체조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="insertDroneForm.do">드론등록</a></li>
                        <li class="nav-item"><a class="nav-link" href="droneList.do">드론목록조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
                        
                        <%
                    		} else if(userId != null && userPw != null) {
                        %>
                        
                        <li class="nav-item"><a class="nav-link" href="main.do">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.do">소개</a></li>                        
                        <li class="nav-item"><a class="nav-link" href="boardList.do">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="rentalDate.do">드론대여</a></li>
                        <li class="nav-item"><a class="nav-link" href="questionForm.do">문의하기</a></li>
                        <li class="nav-item"><a class="nav-link" href="myPage.do">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
                        
                        <%
                    		} else {
                        %>
                        
                        <li class="nav-item"><a class="nav-link" href="main.do">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.do">소개</a></li>                        
                        <li class="nav-item"><a class="nav-link" href="boardList.do">자유게시판</a></li>                        
                        <li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
                        
                        <%
                    		}
                        %>
                        
                    </ul>
                </div>
            </div>
        </nav>

</body>
</html>