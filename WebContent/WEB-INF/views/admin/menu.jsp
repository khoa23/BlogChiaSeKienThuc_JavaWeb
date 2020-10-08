<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Posts</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<title>Admin Management</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/4.2.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />		
		<script src="assets/js/ace-extra.min.js"></script>
</head>

<body>
	<div id="sidebar" class="sidebar responsive">
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
		</script>

		<div class="sidebar-shortcuts" id="sidebar-shortcuts">
			<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
				<button class="btn btn-success">
					<i class="ace-icon fa fa-signal"></i>
				</button>

				<button class="btn btn-info">
					<i class="ace-icon fa fa-pencil"></i>
				</button>

				<button class="btn btn-warning">
					<i class="ace-icon fa fa-users"></i>
				</button>

				<button class="btn btn-danger">
					<i class="ace-icon fa fa-cogs"></i>
				</button>
			</div>

			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span>

				<span class="btn btn-info"></span>

				<span class="btn btn-warning"></span>

				<span class="btn btn-danger"></span>
			</div>
		</div><!-- /.sidebar-shortcuts -->

				
		<ul class="nav nav-list">

			<li class="">
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-book"></i>
						<span class="menu-text">Posts</span>
							<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>

				<ul class="submenu">							
					<li>
						<a href="postAdd">
							<i class="menu-icon fa fa-caret-right"></i>
											Create Post
						</a>
		
						<b class="arrow"></b>
					</li>
	                <li>
						<a href="postList">
							<i class="menu-icon fa fa-caret-right"></i>
										Show Posts
						</a>
	
						<b class="arrow"></b>
					</li>		
				</ul>
			</li>
		</ul><!-- /.nav-list -->
		
		<ul class="nav nav-list">

			<li class="">
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-list-ol"></i>
						<span class="menu-text">Category</span>
							<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>

				<ul class="submenu">							
					<li>
						<a href="categoryAdd">
							<i class="menu-icon fa fa-caret-right"></i>
											Create Category
						</a>
		
						<b class="arrow"></b>
					</li>	                	
				</ul>
			</li>
		</ul><!-- /.nav-list -->
		
		<ul class="nav nav-list">
			<li>
				<a href="#" class="dropdown-toggle">
					<i class="menu-icon fa fa-user"></i>
						<span class="menu-text">
								Users
						</span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="userList">
							<i class="menu-icon fa fa-caret-right"></i>
									Show user
						</a>

						<b class="arrow"></b>
					</li>
							
				</ul>
			</li>
		</ul>
		<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
		</div>
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
		</script>
	</div>
</body>
</html>