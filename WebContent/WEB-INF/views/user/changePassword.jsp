<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change password</title>
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
        <h4 class="card-title mt-3 text-center">Change password</h4>
        <h4 style="color: red;">${errorString}</h4>
        <form method="POST" action="${pageContext.request.contextPath}/changePassword">
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
	            </div>
	            <input name="oldpassword" class="form-control" placeholder="Old password" type="password" value="${user.password}">
	        </div> <!-- form-group// -->
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
	             </div>
	            <input name="createpassword" class="form-control" placeholder="New password" type="password" value="${user.newpassword}">
	        </div> <!-- form-group// -->
	        
	        <div class="form-group input-group">
	            <div class="input-group-prepend">
	                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
	            </div>
	            <input name="repeatpassword" class="form-control" placeholder="Re-enter new password" type="password" value="${user.repeatpassword}">
	        </div> <!-- form-group// -->
	                                          
	        <div class="form-group">
	            <button type="submit" class="btn btn-primary btn-block"> Change  </button>
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