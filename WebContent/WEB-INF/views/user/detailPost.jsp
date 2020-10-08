<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>${post.title}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
        <meta name="keywords" content=""/>
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
    
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
            
        </script>
          
         </script> 
      	<div id="fb-root"></div>
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=648009942365094&autoLogAppEvents=1" nonce="ojZQCAdJ"></script>
         <link href="${pageContext.request.contextPath}/assets/css/bootstrap1.css" rel='stylesheet' type='text/css' />
	     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/single.css">
	     <link href="${pageContext.request.contextPath}/assets/css/style1.css" rel='stylesheet' type='text/css' />
		 <link href="${pageContext.request.contextPath}/assets/css/fontawesome-all1.css" rel="stylesheet">
		 <link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800"
		 rel="stylesheet">

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
	
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>

<ol class="breadcrumb">
  <li class="breadcrumb-item">
    <a href="home">Home</a>
  </li>
  <li class="breadcrumb-item active">Single</li>
</ol>
<!--//banner-->
<section class="banner-bottom">
  
  <!--/blog-->
  <div class="container">
    <div class="row">
      <!--left-->
      <div class="col-lg-8 left-blog-info-w3layouts-agileits text-left">
        <div class="blog-grid-top">
          <div class="b-grid-top">
            <div class="blog_info_left_grid">
              <a >
                <img src="./Images/${post.image}" class="img-fluid" alt="" >
              </a>
            </div>
            <div class="blog-info-middle">
              <ul>
                <li>
                  <a href="#">
                    <i class="far fa-calendar-alt"></i>${post.date}</a>
                </li>
                <li class="mx-2">
                  <a href="#">
                    <i class="far fa-thumbs-up"></i> 201 Likes</a>
                </li>
                <li>
                  <a href="#">
                    <i class="far fa-comment"></i> 15 Comments</a>
                </li>
                
              </ul>
            </div>
          </div>

          <h3>
            <a>${post.title} </a>
          </h3>
          <p>${post.content}</p>
          
        </div>
	<div class="fb-comments" data-href="http://localhost:8080/MockProject/postDetail?code=${post.postID}" data-numposts="5" data-width=""></div>
     
        
      </div>

      <!--//left-->
      <!--right-->
      <aside class="col-lg-4 agileits-w3ls-right-blog-con text-right">
        <div class="right-blog-info text-left">
          <div class="tech-btm">           
          </div>
         	<div class="left-side border-bottom py-2">
				<h3 class="agileits-sear-head mb-3">Danh sách bài học</h3>
					<ul class="w3l-range">
					
						<c:forEach items="${postCate}" var="postbycategory">
							<tr>
								<li >
									<a href="postDetail?code=${postbycategory.postID}">${postbycategory.title}</a>
								</li>
							</tr>
						</c:forEach>									
					</ul>
			</div>
          <div class="tech-btm">
            <h4>Categories</h4>
            <ul class="list-group single">
           		<c:forEach items="${categoryList}" var="category">
					<tr>
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<a href="postListByCategory?code=${category.categoryName}">${category.categoryName}</a>
						</li>
					</tr>
				</c:forEach>	
                
                
            </ul>
          </div>
          
          </div>
          <div class="single-gd tech-btm">
            <h4>Recent Post</h4>
            <div class="blog-grids">
              <div class="blog-grid-left">
                <a href="postDetail?code=${recentpost.postID}">
                  <img src="./Images/${recentpost.image}" class="img-fluid" alt="" width="330" height="150">
                </a>
              </div>
              <div class="blog-grid-right">

                <h5>
                  <a href="postDetail?code=${recentpost.postID}">${recentpost.title}</a>
                </h5>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
        </div>

      </aside>
      <!--//right-->
    </div>
  </div>
</section>
<!--//main-->
<!-- end register -->

<jsp:include page="footer.jsp"></jsp:include>





<script src="${pageContext.request.contextPath}/assets/js/jquery-2.2.3.min1.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/move-top1.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/easing1.js"></script>
<script>
  jQuery(document).ready(function ($) {
    $(".scroll").click(function (event) {
      event.preventDefault();
      $('html,body').animate({
        scrollTop: $(this.hash).offset().top
      }, 900);
    });
  });
</script>
<!--// end-smoth-scrolling -->
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
<script src="${pageContext.request.contextPath}/assets/js/bootstrap1.js"></script>



</body>
    





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

<!-- //password-script -->

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


</html>