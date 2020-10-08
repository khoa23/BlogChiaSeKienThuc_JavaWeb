<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
        </script>
        
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${pageContext.request.contextPath}/assets/css/fontawesome-all.css" rel="stylesheet" >
        <link href="${pageContext.request.contextPath}/assets/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${pageContext.request.contextPath}/assets/css/menu.css" rel="stylesheet" type="text/css" media="all" />
        <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
            rel="stylesheet">
</head>
<%
	String username = (String)session.getAttribute("userName");
	if(username != null){
		response.sendRedirect(request.getContextPath() +"/");
	}
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	
<!-- register here  -->

<form method="POST" action="${pageContext.request.contextPath}/login">
<div class="container" >  
    <div class="row">
<aside class="col-sm-4" style="margin-left: 35%;">
<div class="card">
    <article class="card-body" >
        <h4 class="card-title text-center mb-4 mt-3">Sign in</h4>
        <hr>
        <h4 style="color: red;">${errorString}</h4>
        <form>
        <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
             </div>
            <input name="userName" class="form-control" placeholder="Email or username" type="email" value="${user.userName}">
        </div> <!-- input-group.// -->
        </div> <!-- form-group// -->
        <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
             </div>
            <input name="password" class="form-control" placeholder="******" type="password" value="${user.password}">
        </div> <!-- input-group.// -->
        </div> <!-- form-group// -->
        <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Login  </button>
        </div> <!-- form-group// -->
        <p class="text-center"><a href="#" class="btn">Forgot password?</a></p>
        </form>
    </article>
    </div> <!-- card.// -->
</aside>
    </div>
</div>

<!-- end register -->
	<jsp:include page="footer.jsp"></jsp:include>
</form>
</body>
</html>