<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
        <meta name="keywords" content=""
        />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
    
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
            
            function Redirect() {
            	var s = document.getElementById("myInput").value;
            	window.open('search?code='+s);
            	window.close();         	
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
<div class="agile-main-top">
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-4 header-most-top">
					
				</div>
				<div class="col-lg-8 header-right mt-lg-0 mt-2">
					<!-- header lists -->
					<ul>
						
						<li class="text-center  border-right text-white">
							<a  data-toggle="modal" data-target="#exampleModal" class="text-white">Contact</a>
							
						</li>

						<%
			                String username = (String) session.getAttribute("userName");                     
			                if (username == null) {
			            %>
				            <li id="login" class="text-center border-right login">
								<a href="login" class="text-white">
									<i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
							</li>
							<li id="register" class="text-center register">
								<a href="register" class="text-white">
									<i class="fas fa-sign-out-alt mr-2"></i>Register </a>
							</li>
				
				        <% } else {
				         %>
				            
				             <li  class="text-center border-right login">
								<a class="text-white">
									<i ></i> Hi, <%=username %> </a>
							</li>
							<li  class="text-center border-right login">
								<a href="edituser" class="text-white">
									<i ></i> Change information </a>
							</li>
							<li  class="text-center border-right login">
								<a href="changePassword" class="text-white">
									<i ></i> Change Password </a>
							</li>
				            <li id="logout" class="text-center" >
								<a href="logout" class="text-white">
									<i class="fas fa-sign-in-alt mr-2"></i> Log Out </a>
							</li>
				        <% }%>
						
						
					</ul>
					<!-- //header lists -->
				</div>
			</div>
		</div>
    </div>
    <div class="header-bot">
		<div class="container">
			<div class="row header-bot_inner_wthreeinfo_header_mid">
					<!-- logo -->
				<div class="col-md-3 logo_agile">
					<h1 class="text-center">
						<a href="home" class="font-weight-bold font-italic">
							<img src="${pageContext.request.contextPath}/assets/images/logo2.png" alt=" " class="img-fluid">BLOG IT
						</a>
					</h1>
				</div>
					<!-- //logo -->
					<!-- header-bot -->
				<div class="col-md-9 header mt-4 mb-md-0 mb-4">
				    <div class="row">
							<!-- search -->
						<div class="col-10 agileits_search">
							<form class="form-inline" action="" method="post" >
								<input id="myInput" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" required>
								<button id="myBtn" class="btn my-2 my-sm-0" type="submit" onclick="Redirect();">Search</button>
							</form>
						</div>
							<!-- //search -->
							
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>