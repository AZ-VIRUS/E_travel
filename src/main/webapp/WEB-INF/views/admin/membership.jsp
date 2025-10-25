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

<title>eTravel - Membership MGMT</title>

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
						<h1 class="h3 mb-0 text-gray-800">Membership Management</h1>
					</div>

					<!-- page content here -->
					<div class="row">
						<div class="col col-lg-9 col-md-12">
						<c:choose>
							<c:when test="${edit ne true }">
								<!-- add card appears here -->
								<div class="card">
								<div class="card-heading">Add New Membership Type</div>
								<div class="card-body">
									<form class="form form-responsive" method=post
										action="${cp }/admin/membership/add">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
										<div class="form-group">
											<label>Title</label> <input class="form-control" name="title"
												type="text" placeHolder="Enter Membership Title" required>
										</div>

										<div class="form-group">
											<label>Description</label>
											<textarea class="form-control" name="description" rows="5"
												cols="100" placeHolder="Enter Description" required></textarea>
										</div>

										<div class="form-group">
											<label>Plan</label> <select class="form-control" name="plan"
												required>
												<option value="LIFETIME">Lifetime Membership</option>
												<option value="YEARLY">Yearly Membership</option>
												<option value="MONTHLY">Monthly Membership</option>
												<option value="GUEST">Guest</option>
											</select>
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
								<div class="card-heading">Update Membership Type</div>
								<div class="card-body">
									<form class="form form-responsive" method=post
										action="${cp }/admin/membership/edit">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
										<div class="form-group">
											<label>Membership Id</label>
											<input class="form-control" name="id" type="text" value="${membership.id }" required readonly>
										</div>
										
										<div class="form-group">
											<label>Title</label>
											<input class="form-control" name="title" type="text" value="${membership.title }" required>
										</div>

										<div class="form-group">
											<label>Description</label>
											<textarea class="form-control" name="description" rows="5" cols="100"
											placeHolder="Enter Description" required>${membership.description }</textarea>
										</div>

										<div class="form-group">
											<label>Plan</label>
											<select class="form-control" name="plan" required>
												<option value="LIFETIME" ${membership.plan eq "LIFETIME" ? "selected" : "" }>Lifetime Membership</option>
												<option value="YEARLY" ${membership.plan eq "YEARLY" ? "selected" : "" }>Yearly Membership</option>
												<option value="MONTHLY" ${membership.plan eq "MONTHLY" ? "selected" : "" }>Monthly Membership</option>
												<option value="GUEST" ${membership.plan eq "GUEST" ? "selected" : "" }>Guest</option>
											</select>
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

						<div class="col col-lg-3 col-md-6 col-sm-12">
							<ul>
								<li>Membership Types</li>
								<li>Membership Period</li>
								<li>Membership Services</li>
								<li>Membership Fees</li>
								<li>Loyalty Program</li>
							</ul>
						</div>

					</div>
					
					<div class="row">
						<div class="col col-lg-9">
							<div class="card" id="data_table">
								<div class="card-heading">All Membership Types</div>
								<div class="card-body">
									<table class="table table-responsive table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Title</th>
												<th>Description</th>
												<th>Plan</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${membership_list }" var="membership">
												<tr>
													<td>${membership.id }</td>
													<td>${membership.title }</td>
													<td>${membership.description }</td>
													<td>${membership.plan }</td>
													<td>
														<a class="btn btn-warning" href="${cp }/admin/membership/edit/${membership.id}"><i class="fa fa-edit"></i></a>
														<a class="btn btn-warning" href="${cp }/admin/membership/delete/${membership.id}"><i class="fa fa-trash"></i></a>
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