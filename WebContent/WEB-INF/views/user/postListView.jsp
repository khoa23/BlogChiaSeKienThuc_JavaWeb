<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Posts</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" >
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<nav class="navbar navbar-light bg-light">
		<div class="col">
			<h1>Posts</h1>
			
			<p style="color: red;">${errorString}</p>
		</div>
		</nav>
		<form method="POST" action="${pageContext.request.contextPath}/postList">
        <div class="row d-flex justify-content-start">
			<c:forEach items="${postList}" var="post">
				<div class="card" style="width: 18rem; margin-left:1.8%;margin-right:1.5%;" >
					<div class="card-body">
						<h4 class="card-title">
							<td><a href="postDetail?code=${post.postID}">${post.title}</a></td>
						</h4>
					</div>
					<td>
						<a href="postDetail?code=${post.postID}">
							<img class= "card-img-top"  style="height: 10em" src="./Images/${post.getImage()}" alt="images" width="200" height="250" >
						</a>
						
					</td>
					<div class="card-body">
						<div class="card-text">
							<p>${post.getDate()}  </p>				
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		</form>
</body>
</html>