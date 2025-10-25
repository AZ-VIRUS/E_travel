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
	href="${cp }/backend/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${cp }/backend/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Side bar -->
		<%@ include file="sidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Top bar -->
				<%@ include file="topbar.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Booking Management</h1>
					</div>
					
					<!-- page content here -->
					<div class="row">
						<div class="col">
						 <div>
            <form action="${pageContext.request.contextPath }/admin/booking/add" method="post">
            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
            <p>
            <label>Accommodation</label>
            <select name="accommodation"  required>
            <c:forEach items="${accommodation_list }" var="accommodation">
            	<option value="${accommodation.id }">${accommodation.id }: ${accommodation.type }, ${accommodation.location }</option>
            </c:forEach>
            </select>
            </p>
            <p>
            <label>Check-in Date</label>
            <input type="date" placeholder="Enter checkin date" name="checkIn"/>
            </p>
            <p>
            <label>Check-out Date</label>
            <input type="date" placeholder="Enter checkout date" name="checkOut"/>
            </p>
            
            <p>
            <label>No of Persons</label>
            <input type="number" min="1" placeholder="Enter checkin date" name="noOfPersons"/>
            </p>
            <p>
            <button type="submit" class="buy-now-button">Add Booking</button>
            </p>
            </form>
            </div>
						</div>
					</div>
					
					
					<div class="row">
					<div class="col">
					<div class="card">
					<div class="card-heading">All Bookings..</div>
					<div class="card-body">
					<table class="table table-responsive table-striped">
					<thead>
					<tr>
						<th>Booking Id</th>
						<th>Accommodation</th>
						<th>Check-in Date</th>
						<th>Check-out Date</th>
						<th>No of Persons</th>
						<th>User name</th>
						<th>Email
						<th>Confirm Status</th>
						<th>Edit</th>
						<th>Delete</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${booking_list }" var="booking">
							<tr>
							<td>${booking.id }</td>
							<td>${booking.accommodation.type } / ${booking.accommodation.location } </td>
							<td>${booking.checkIn }</td>
							<td>${booking.checkOut }</td>
							<td>${booking.noOfPersons }</td>
							<td>${booking.userDetail.username }</td>
							<td>${booking.userDetail.email }</td>
							<td><a class="btn btn-info" href="${cp}/admin/booking/confirm-message/${booking.id }">Send Confirm</a></td>
							<td><a class="btn btn-warning" href="#" >Edit</a></td>
							<td><a class="btn btn-danger" href="#" >Delete</a></td>
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

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="footer.jsp"%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<%@ include file="logout_model.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${cp }/backend/vendor/jquery/jquery.min.js"></script>
	<script
		src="${cp }/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${cp }/backend/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${cp }/backend/js/sb-admin-2.min.js"></script>

</body>

</html>