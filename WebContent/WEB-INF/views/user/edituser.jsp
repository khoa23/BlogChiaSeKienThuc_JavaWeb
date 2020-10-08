<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit profile</title>
<meta>    

<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<jsp:include page="menu.jsp"></jsp:include>
	
<!-- register here  -->
<div class="container">
    <div class="card bg-light">
    <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">Change information</h4>
        <h4 style="color: red;">${errorString}</h4>
        <form method="POST" action="${pageContext.request.contextPath}/edituser">
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
	            </div>
	            <input name="fullname" class="form-control" placeholder="Full name" type="text" value="${user.fullname}">
	        </div> <!-- form-group// -->
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
	             </div>
	            <input readonly name="email" class="form-control" placeholder="Email address" type="email" value="${loginedUser.userName}">
	        </div> <!-- form-group// -->
	        
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
	            </div>
	            <input name="phone" class="form-control" placeholder="Phone number" type="text" value="${user.phone}">
	        </div> <!-- form-group// -->
	    
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-home"></i> </span>
	            </div>
	            <input name="address" class="form-control" placeholder="Address" type="text" value="${user.address}">
	        </div> <!-- form-group// -->
	                                          
	        <div class="form-group">
	            <button type="submit" class="btn btn-primary btn-block"> Update My Profile  </button>
	        </div> <!-- form-group// -->      
	                                                                        
    </form>
    </article>
    </div> <!-- card.// -->
    
    </div> 
    <!--container end.//-->

<!-- end register -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>