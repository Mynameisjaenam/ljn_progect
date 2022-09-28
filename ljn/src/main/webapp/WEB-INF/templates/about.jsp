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
        
		<jsp:include page="header.jsp"></jsp:include>
		
		<%
		String userId = (String) session.getAttribute("SessionUserId");
		String userPw = (String) session.getAttribute("SessionUserPw");
		String userName = (String) session.getAttribute("SessionUserName");
		String userPhone = (String) session.getAttribute("SessionUserPhone");
		String userEmail = (String) session.getAttribute("SessionUserEmail");
		%>
		
        <!-- Masthead-->
        <!-- <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold">최상의 서비스를</h1>
                        <h1 class="text-white font-weight-bold">제공해 드립니다.</h1>
                        <hr class="divider" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 mb-5">Nam's Drone Rental에서 제공하는 서비스를 통해 드론을 마음껏 이용해 보세요!</p>
                        <a class="btn btn-primary btn-xl" href="about.do">회사소개</a>
                    </div>
                </div>
            </div>
        </header> -->
        <!-- About-->
        <!-- <section class="page-section bg-primary" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">We've got what you need!</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4">Start Bootstrap has everything you need to get your new website up and running in no time! Choose one of our open source, free to download, and easy to use themes! No strings attached!</p>
                        <a class="btn btn-light btn-xl" href="#services">Get Started!</a>
                    </div>
                </div>
            </div>
        </section> -->
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">Nam's Drone Rental 서비스는</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">고객 맞춤형</h3>
                            <p class="text-muted mb-0">상담을 통해 맞춤형으로</p>
                            <p class="text-muted mb-0">선택하여 드립니다!</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">쉬운 대여</h3>
                            <p class="text-muted mb-0">Nam's Rental을 통해</p>
                            <p class="text-muted mb-0">쉽고 편리하게 대여하세요!</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">전국 어디든</h3>
                            <p class="text-muted mb-0">전국 어디든 가능합니다!</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">고객을 위한</h3>
                            <p class="text-muted mb-0">고객이 최우선인 Nam's Drone</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">대여 절차</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <h3 class="h4 mb-2">1. 드론선택</h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <h3 class="h4 mb-2">2. 대여여부 조회</h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <h3 class="h4 mb-2">3. 대여하기</h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <h3 class="h4 mb-2">4. 반납</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Call to action-->
        <section class="page-section bg-dark text-white">
            <div class="container px-4 px-lg-5 text-center">
                <h2 class="mb-4">드론 비행시 주의 사항</h2>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/k4B0S9ENK0Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/9fEYhZEIwYs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>               
            </div>
        </section>                
        
        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Contact 053-123-1234</div></div>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
