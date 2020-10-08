<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Footer</title>
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
<body>
    <footer>
        <div class="w3l-middlefooter-sec">
            <div class="container py-md-5 py-sm-4 py-3">
                <div class="row footer-info w3-agileits-info">
                    <!-- footer categories -->
                    <div class="col-md-3 col-sm-6 footer-grids">
                        <h3 class="text-white font-weight-bold mb-3">Categories</h3>
                        <ul>
                            <c:forEach items="${categoryList}" var="category">
								<tr>
											
									<li>
										<a href="postListByCategory?code=${category.categoryName}">${category.categoryName}</a>
									</li>
								</tr>
							</c:forEach>
                            
                        </ul>
                    </div>
                    <!-- //footer categories -->
                    <!-- quick links -->
                    <div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
                        <h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
                        <ul>
                            <li class="mb-3">
                                <a href="about.html">About Us</a>
                            </li>
                            <li class="mb-3">
                                <a href="contact.html">Contact Us</a>
                            </li>
                            <li class="mb-3">
                                <a href="help.html">Help</a>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
                        <h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
                        <ul>
                            <li class="mb-3">
                                <i class="fas fa-map-marker"></i> 123 Quan Thu Duc, HCM.</li>
                            <li class="mb-3">
                                <i class="fas fa-mobile"></i> 333 222 3333 </li>
                            <li class="mb-3">
                                <i class="fas fa-phone"></i> +222 11 4444 </li>
                            <li class="mb-3">
                                <i class="fas fa-envelope-open"></i>
                                <a href="mailto:example@mail.com"> mail@example.com</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-grids w3l-agileits mt-md-0 mt-4">
                        <!-- newsletter -->
                        <h3 class="text-white font-weight-bold mb-3">Newsletter</h3>
                        
                        <form action="#" method="post">
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email" name="email" required="">
                                <input type="submit" value="Go">
                            </div>
                        </form>
                        <!-- //newsletter -->
                        <!-- social icons -->
                        <div class="footer-grids  w3l-socialmk mt-3">
                            <h3 class="text-white font-weight-bold mb-3">Follow Us on</h3>
                            <div class="social">
                                <ul>
                                    <li>
                                        <a class="icon fb" href="#">
                                            <i class="fab fa-facebook-f"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="icon tw" href="#">
                                            <i class="fab fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="icon gp" href="#">
                                            <i class="fab fa-google-plus-g"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- //social icons -->
                    </div>
                </div>
                <!-- //quick links -->
            </div>
        </div>       
    </footer>
</body>
</body>
</html>