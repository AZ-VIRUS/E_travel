<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }" />

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

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${cp}/backend/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body>

    <div class="container mt-4">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Welcome, <c:out value="${username}"/>!</h1>
        </div>

        <!-- User Profile Card -->
        <div class="row justify-content-center mb-4">
            <div class="col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header">User Profile</div>
                    <div class="card-body">
                        <table class="table table-bordered mb-3">
                            <tr>
                                <th>Fullname</th>
                                <td><c:out value="${user_detail.firstname}"/> <c:out value="${user_detail.lastname}"/></td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td><c:out value="${user_detail.address}"/></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td><c:out value="${user_detail.email}"/></td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td><c:out value="${user_detail.phoneNo}"/></td>
                            </tr>
                            <tr>
                                <th>Authority</th>
                                <td><c:out value="${user_detail.userRole.role}"/></td>
                            </tr>
                        </table>
                        <a class="btn btn-warning" href="${cp}/user/profile/edit/${user_detail.id}">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bookings Table -->
        <div class="row">
            <div class="col">
                <div class="card shadow-sm m-4 p-4">
                    <div class="card-header">My Bookings</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-hover">
                                <thead class="thead-light">
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
                                    <c:forEach items="${bookings}" var="booking">
                                        <tr>
                                            <td><c:out value="${booking.id}"/></td>
                                            <td><c:out value="${booking.accommodation.type}"/> / <c:out value="${booking.accommodation.location}"/></td>
                                            <td><c:out value="${booking.checkIn}"/></td>
                                            <td><c:out value="${booking.checkOut}"/></td>
                                            <td><c:out value="${booking.noOfPersons}"/></td>
                                            <td><c:out value="${booking.status != null ? booking.status : 'Pending'}"/></td>
                                            <td><a href="${cp}/bookings/edit/${booking.id}" class="btn btn-sm btn-primary">Edit</a></td>
                                            <td><a href="${cp}/bookings/delete/${booking.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this booking?');">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="${cp}/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for all pages -->
    <script src="${cp}/backend/js/sb-admin-2.min.js"></script>

</body>

</html>
