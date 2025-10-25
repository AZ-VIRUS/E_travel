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
						<h1 class="h3 mb-0 text-gray-800">Welcome user ${username }!</h1>
					</div>
					
					<!-- page content here -->
					<div class="row justify-content-center">
					<div class="col col-lg-6">
					<div class="card">
					<div class="card-heading">User Profile</div>
					<div class="card-body">
						
						<table>
						<tr>
						<th>Fullname</th> <td> ${user_detail.firstname } ${user_detail.lastname } </td>
						</tr>
						<tr>
						<th>Address</th> <td> ${user_detail.address } </td>
						</tr>
						<tr>
						<th>Email</th> <td> ${user_detail.email } </td>
						</tr>
						
						<tr>
						<th>Phone</th> <td> ${user_detail.phoneNo } </td>
						</tr>
						
						<tr>
						<th>Authority</th> <td> ${user_detail.userRole.role } </td>
						</tr>
						
						</table>
						<a class="btn btn-warning" href="${cp }/user/profile/edit/${user_detail.id }">Edit Profile</a>
					</div>
					</div>
					</div>
					</div>
					
					
					<div class="row">
					<div class="col">
					<div class="card m-4 p-4">
					<div class="card-heading">My Bookings</div>
					<div class="card-body">
					<table class="table table-responsive table-striped">
					<thead>
					<tr>
						<th>Booking Id</th>
						<th>Accommodation</th>
						<th>Check-in Date</th>
						<th>Check-out Date</th>
						<th>No of Persons</th>
						<th>Status</th>
						<th>Edit</th>
						<th>Delete</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${bookings }" var="booking">
							<tr>
							<td>${booking.id }</td>
							<td>${booking.accommodation.type } / ${booking.accommodation.location } </td>
							<td>${booking.checkIn }</td>
							<td>${booking.checkOut }</td>
							<td>${booking.noOfPersons }</td>
							<td>Confirm/Not-Confirm</td>
							<td><a href="#" >Edit</a></td>
							<td><a href="#" >Delete</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
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