<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<LINK REL="SHORTCUT ICON" HREF="${pageContext.request.contextPath}/assets/images/logo2.png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Blog it"
        />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
		function Search() {
        	var s = document.getElementById("search").value;
        	window.open('search?code='+s);
        	window.close();         	
         }
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Bootstrap css -->
	<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Main css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<link href="${pageContext.request.contextPath}/assets/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pop-up-box -->
	<link href="${pageContext.request.contextPath}/assets/css/menu.css" rel="stylesheet" type="text/css" media="all" />
	<!-- menu style -->
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->

</head>

<body>
	<jsp:include page="user/header.jsp"></jsp:include>
	
	<jsp:include page="user/menu.jsp"></jsp:include>
	
	
	<!-- top Products -->
	<div class="ads-grid py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>L</span>ập trình
				<span>/</span>
				<span>C</span>ông nghệ</h3>
			<!-- //tittle heading -->
			<div class="row">
				<!-- product left -->
				<div class="agileinfo-ads-display col-lg-9">
					<div class="wrapper">
						<!-- first section -->
						<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">
							<h3 class="heading-tittle text-center font-italic">HTML</h3>
							<div class="row">
								<c:forEach items="${hotPostList}" var="hotPost">
								
									<div class="col-md-4 product-men mt-5">
										<div class="men-pro-item simpleCart_shelfItem">
											<div class="men-thumb-item text-center">
												<a href="postDetail?code=${hotPost.postID}" >
													<img src="./Images/${hotPost.image}" alt="" width="234" height="150" >
												</a>											
											</div>
											<div class="item-info-product text-center border-top mt-4">
												<h4 class="pt-1">
													<a href="postDetail?code=${hotPost.postID}">${hotPost.title}</a>
												</h4>
											</div>
										</div>
									</div>
								</c:forEach>	
								
							
							</div>
						</div>
						<!-- //first section -->
						<!-- second section -->
						<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">
							<h3 class="heading-tittle text-center font-italic">CSS</h3>
							<div class="row">
								<c:forEach items="${cssPostList}" var="cssPost">
								
									<div class="col-md-4 product-men mt-5">
										<div class="men-pro-item simpleCart_shelfItem">
											<div class="men-thumb-item text-center">
												<a href="postDetail?code=${cssPost.postID}" >
													<img src="./Images/${cssPost.image}" alt="" width="234" height="150" >
												</a>											
											</div>
											<div class="item-info-product text-center border-top mt-4">
												<h4 class="pt-1">
													<a href="postDetail?code=${cssPost.postID}">${cssPost.title}</a>
												</h4>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
						<!-- //second section -->
						
						<!-- fourth section -->
						<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">
							<h3 class="heading-tittle text-center font-italic">JavaScript</h3>
							<div class="row">
								<c:forEach items="${javaScriptPostList}" var="javaScriptPost">
									<div class="col-md-4 product-men mt-5">
										<div class="men-pro-item simpleCart_shelfItem">
											<div class="men-thumb-item text-center">
												<a href="postDetail?code=${javaScriptPost.postID}" >
													<img src="./Images/${javaScriptPost.image}" alt="" width="234" height="150" >
												</a>											
											</div>
											<div class="item-info-product text-center border-top mt-4">
												<h4 class="pt-1">
													<a href="postDetail?code=${javaScriptPost.postID}">${javaScriptPost.title}</a>
												</h4>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- //fourth section -->
					</div>
				</div>
				<!-- //product left -->

				<!-- product right -->
				<div class="col-lg-3 mt-lg-0 mt-4 p-lg-0">
					<div class="side-bar p-sm-4 p-3">
						<div class="search-hotel border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Search Here..</h3>
							<form action="#" method="post">
								<input type="search" placeholder="..." id="search" name="search" required="">
								<input type="submit" value=" " onclick="Search();">
							</form>
						</div>
						<!-- price -->
						<div class="range border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Khóa học lập trình</h3>
							<div class="w3l-range">
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
						</div>
						<!-- //price -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Danh sách bài học</h3>
							<ul class="w3l-range">
								<c:forEach items="${hotPostList}" var="hotPost">
								
									<div >
										<div class="men-pro-item simpleCart_shelfItem">
											
											<div class="item-info-product  ">
												<h4 class="pt-1">
													<a href="postDetail?code=${hotPost.postID}">${hotPost.title}</a>
												</h4>
											</div>
										</div>
									</div>
								</c:forEach>	
								
							</ul>
						</div>
						<!-- //discounts -->
						<!-- reviews -->
						
						
						
					</div>
					<!-- //product right -->
				</div>
			</div>
		</div>
	</div>
	<!-- //top products -->

	

	<!-- footer -->
	<jsp:include page="user/footer.jsp"></jsp:include>
	<!-- //footer -->
	<!-- copyright -->
	<div class="copy-right py-3">
		<div class="container">
			<p class="text-center text-white">© 2020 
				
			</p>
		</div>
	</div>
	<!-- //copyright -->

	<!-- js-files -->
	<!-- jquery -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-2.2.3.min.js"></script>
	<!-- //jquery -->

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
	<script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>
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
	<!-- //popup modal (for location)-->

	<!-- cart-js -->
	<script src="${pageContext.request.contextPath}/assets/js/minicart.js"></script>
	<script>
		paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

		paypals.minicarts.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
	</script>

	
	<!-- scroll seller -->
	<script src="${pageContext.request.contextPath}/assets/js/scroll.js"></script>
	<!-- //scroll seller -->

	<!-- smoothscroll -->
	<script src="${pageContext.request.contextPath}/assets/js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="${pageContext.request.contextPath}/assets/js/move-top.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/easing.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
</body>

</html>