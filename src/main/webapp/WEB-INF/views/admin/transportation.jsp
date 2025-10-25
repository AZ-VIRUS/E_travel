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

<title>eTravel - Transportation MGMT</title>

<!-- Custom fonts for this template-->
<link
	href="${cp}/backend/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${cp}/backend/css/sb-admin-2.min.css"
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
						<h1 class="h3 mb-0 text-gray-800">Transportation Management</h1>
					</div>

					<!-- page content here -->
					<div class="row">
						<div class="col col-lg-12">
						<c:choose>
							<c:when test="${edit ne true }">
								<!-- add card appears here -->
								<div class="card">
								<div class="card-heading">Add New Transportation</div>
								<div class="card-body">
									<form class="form form-responsive" method=post
										action="${cp }/admin/transportation/add">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
										<div class="form-group">
											<label>Service Provider</label> <input class="form-control" name="serviceProvider"
												type="text" placeHolder="Enter Service Provider" required>
										</div>

										<div class="form-group">
											<label>Departure Location</label> <input class="form-control" name="departureLocation"
												type="text" placeHolder="Enter Departure Location" required>
										</div>
										
										<div class="form-group">
											<label>Destination Location</label> <input class="form-control" name="destinationLocation"
												type="text" placeHolder="Enter Destination Location" required>
										</div>
										
										<div class="form-group">
											<label>Departure Date and Time</label>
											<input class="form-control" name="departureDateTime" type="datetime-local" required>
										</div>
										
										<div class="form-group">
											<label>Arrival Date and Time</label>
											<input class="form-control" name="arrivalDateTime" type="datetime-local" required>
										</div>
										
										<div class="form-group">
    										<label>Available Seats</label> 
    										<input class="form-control" name="availableSeats" type="number" min="1" placeholder="Enter Number of Available Seats" required>
    									</div>
    									
    									<div class="form-group">
    										<label>Price</label>
    										<input class="form-control" name="price" type="number" step="0.01" required>
										</div>

										<div class="form-group">
											<input class="btn btn-info" type="submit" value="Save">
										</div>

									</form>
								</div>
							</div>
							</c:when>
							<c:otherwise>
								<!-- edit card appears here -->
								<div class="card">
								<div class="card-heading">Update Transportation</div>
								<div class="card-body">
									<form class="form form-responsive" method=post
										action="${cp }/admin/transportation/edit">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
										<div class="form-group">
											<label>Transportation Id</label>
											<input class="form-control" name="id" type="text" value="${transportation.id }" required readonly>
										</div>
										
										<div class="form-group">
											<label>Service Provider</label>
											<input class="form-control" name="serviceProvider" type="text" value="${transportation.serviceProvider }" required>
										</div>

										<div class="form-group">
											<label>Departure Location</label>
											<input class="form-control" name="departureLocation" type="text" value="${transportation.departureLocation }" required>
										</div>
										
										<div class="form-group">
											<label>Destination Location</label> 
											<input class="form-control" name="destinationLocation" type="text" value="${transportation.destinationLocation }" required>
										</div>
										
										<div class="form-group">
											<label>Departure Date and Time</label>
											<input class="form-control" name="departureDateTime" type="datetime-local" value="${transportation.departureDateTime }" required>
										</div>
										
										<div class="form-group">
											<label>Arrival Date and Time</label>
											<input class="form-control" name="arrivalDateTime" type="datetime-local" value="${transportation.arrivalDateTime }" required>
										</div>
										
										<div class="form-group">
    										<label>Available Seats</label> 
    										<input class="form-control" name="availableSeats" type="number" min="1" value="${transportation.availableSeats }" required>
    									</div>
    									
    									<div class="form-group">
    										<label>Price</label>
    										<input class="form-control" name="price" type="number" step="0.01" value="${transportation.price }" required>
										</div>

										<div class="form-group">
											<input class="btn btn-info" type="submit" value="Save">
										</div>

									</form>
								</div>
							</div>
							</c:otherwise>
						</c:choose>
							
							
							
						</div>

					</div>
					
					<div class="row">
						<div class="col col-lg-12">
							<div class="card" id="data_table">
								<div class="card-heading">All Transportations</div>
								<div class="card-body">
									<table class="table table-responsive table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Service Provider</th>
												<th>Departure Location</th>
												<th>Destination Location</th>
												<th>Departure DateTime</th>
												<th>Arrival DateTime</th>
												<th>Available Seats</th>
												<th>Price</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${transportation_list }" var="transportation">
												<tr>
													<td>${transportation.id }</td>
													<td>${transportation.serviceProvider }</td>
													<td>${transportation.departureLocation }</td>
													<td>${transportation.destinationLocation }</td>
													<td>${transportation.departureDateTime }</td>
													<td>${transportation.arrivalDateTime }</td>
													<td>${transportation.availableSeats }</td>
													<td>${transportation.price }</td>
													<td>
														<a class="btn btn-warning" href="${cp }/admin/transportation/edit/${transportation.id}"><i class="fa fa-edit"></i></a>
														<a class="btn btn-warning" href="${cp }/admin/transportation/delete/${transportation.id}"><i class="fa fa-trash"></i></a>
													</td>
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