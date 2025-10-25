<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>eTravel Admin - Dashboard</title>

<!-- Custom fonts for this template-->

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${cp }/backend/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body>

    <div class="container">


					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">User Registration</h1>
					</div>
					
					<!-- page content here -->
					<div class="row justify-content-center">
					<div class="col col-lg-6">
					<div class="card">
					<div class="card-heading">New user registration</div>
					<div class="card-body">
						<form action="${cp }/register" method="post" class="form form-responsive">
							
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							
							<div class="row">
							<div class="col col-lg-6">
							<div class="form-group">
							<label>First name:</label>
							<input class="form-control" type="text" name="firstname" placeholder="Enter first name" required/>
							</div>
							</div>
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Last name:</label>
							<input class="form-control" type="text" name="lastname" placeholder="Enter last name" required/>
							</div>
							</div>
							</div>
							
							<div class="row">
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Address:</label>
							<input class="form-control" type="text" name="address" placeholder="Enter address" required/>
							</div>
							</div>
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Gender:</label>
							<select  class="form-control" name="gender" required>
								<option value="MALE">Male</option>
								<option value="FEMALE">Female</option>
							</select>
							</div>
							</div>
							</div>
							
							<div class="row">
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Email:</label>
							<input class="form-control" type="text" name="email" placeholder="Enter address" required/>
							</div>
							</div>
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Phone No:</label>
							<input class="form-control" type="text" name="phoneNo" placeholder="Enter phone no." required/>
							</div>
							</div>
							</div>
							
							<div class="row">
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Date of Birth:</label>
							<input class="form-control" type="text" name="dob" placeholder="Enter date of birth" required/>
							</div>
							</div>
							<div class="col col-lg-6">
							<div class="form-group">
							<label>Authority:</label>
							<select  class="form-control" name="authority" required>
								<option value="ADMIN">Admin</option>
								<option value="USER">USER</option>
							</select>
							</div>
							</div>
							</div>
							
							<div class="row">
							<div class="col col-lg-4">
							<div class="form-group">
							<label>Username:</label>
							<input class="form-control" type="text" name="username" placeholder="Enter username" required/>
							</div>
							</div>
							<div class="col col-lg-4">
							<div class="form-group">
							<label>Password:</label>
							<input class="form-control" type="password" name="password" placeholder="Enter password" required/>
							</div>
							</div>
							<div class="col col-lg-4">
							<div class="form-group">
							<label>Confirm Password:</label>
							<input class="form-control" type="password" name="confirmPassword" placeholder="Enter password" required/>
							</div>
							</div>
							</div>
							
							<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Register">
							<input type="reset" class="btn btn-warning" value="Reset form">
							</div>
						</form>
					</div>
					</div>
					</div>
					</div>
					

				</div>
				<!-- /.container-fluid -->



	<!-- Bootstrap core JavaScript-->
	
	<script
		src="${cp }/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	
	<!-- Custom scripts for all pages-->
	<script
		src="${cp }/backend/js/sb-admin-2.min.js"></script>

</body>

</html>