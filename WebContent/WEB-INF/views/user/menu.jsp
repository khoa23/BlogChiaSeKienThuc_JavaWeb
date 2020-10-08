<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content=""
        />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
    
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.css">
        <link href="${pageContext.request.contextPath}/assets/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${pageContext.request.contextPath}/assets/css/menu.css" rel="stylesheet" type="text/css" media="all" />
        <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
            rel="stylesheet">
</head>
<body>
 <!-- MENU  -->
<div class="navbar-inner">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="agileits-navi_search">
                <form action="#" method="post">
                    <select id="agileinfo-nav_search" name="forma" onchange="location = this.value;" class="border" required="">
                        <option value="">More Courses</option>
                        <c:forEach items="${categoryList}" var="category">
							<tr>		
								<li>
									<option value="postListByCategory?code=${category.categoryName}">
										${category.categoryName}
									</option>
								</li>
							</tr>
						</c:forEach>
                    </select>
                </form>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto text-center mr-xl-5">
                    <li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
                        <a class="nav-link" href="home">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <!--Web frontend  -->
                    <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                        <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Web Frontend
                        </a>
                        <div class="dropdown-menu">
                            <div class="agile_inner_drop_nav_info p-4">                              
                                <div class="row">
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=Javascript"> Learn Javascript</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=HTML">Learn HTML</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=CSS">Learn CSS</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                        	<li>
                                                <a href="postListByCategory?code=Bootstrap">Learn Bootstrap</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=AngularJS">Learn AngularJS</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=ReactJS">Learn ReactJS</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </div>	                               
                                <div class="row">	
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                        	<li>
                                                <a href="postListByCategory?code=JQuery">Learn JQuery</a>
                                            </li>
                                        </ul>
                                    </div>                            
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- end web front end -->


                    <!--Web backend  -->
                    <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                        <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Web Backend
                        </a>
                        <div class="dropdown-menu">
                            <div class="agile_inner_drop_nav_info p-4">                              
                                <div class="row">
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=PHP">Learn PHP</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=Laravel">Learn Laravel</a>
                                            </li>
                                            
                                            
                                        </ul>
                                    </div>
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            
                                            <li>
                                                <a href="postListByCategory?code=Phalcon">Learn Phalcon</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=NodeJS">Learn NodeJS</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </div>	                               
                                <div class="row">	
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=OpenCart">Learn OpenCart</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=Codeigniter">Learn Codeigniter</a>
                                            </li>
                                            
                                            
                                        </ul>
                                    </div>                                                                                           
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- end web back end -->

                    <!--Programmings -->
                    <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                        <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Programmings
                        </a>
                        <div class="dropdown-menu">
                            <div class="agile_inner_drop_nav_info p-4">
                                
                                <div class="row">
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=Python">Learn Python</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=Java">Learn Java</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=C#">Learn C#</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=C/C++">Learn C/C++</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </li>
                    <!--End Programmings -->
                    <!--Database -->
                    <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                        <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Database
                        </a>
                        <div class="dropdown-menu">
                            <div class="agile_inner_drop_nav_info p-4">
                                
                                <div class="row">
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=Basic Database">Learn Basic Database</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=SQLite">Learn SQLite</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                    <div class="col-sm-6 multi-gd-img">
                                        <ul class="multi-column-dropdown">
                                            <li>
                                                <a href="postListByCategory?code=MySQL">Learn MySQL</a>
                                            </li>
                                            <li>
                                                <a href="postListByCategory?code=SQL">Learn SQL</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </li>
                    <!--End Database -->
                    											
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact Us</a>
                    </li>
                </ul>
            </div>
        
        </nav>
    </div>
</div>
<!-- END MENU -->


<script src="${pageContext.request.contextPath}/assets/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/minicart.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/SmoothScroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<!-- nav smooth scroll -->
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            }
        );
    });
</script>
<!-- //nav smooth scroll -->

<!-- popup modal (for location)-->
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
</body>
</html>