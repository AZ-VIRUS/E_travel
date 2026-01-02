<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>eTravel - Booking Management</title>
    <link href="${cp}/backend/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${cp}/backend/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <%@ include file="sidebar.jsp"%>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <%@ include file="topbar.jsp"%>
            <div class="container-fluid">

                <h1 class="h3 mb-4 text-gray-800">Booking Management</h1>

                <!-- Success/Failure Messages -->
                <c:if test="${param.booking == 'success'}">
                    <div class="alert alert-success">Booking saved successfully!</div>
                </c:if>
                <c:if test="${param.booking == 'failure'}">
                    <div class="alert alert-danger">Booking failed! Please check dates or availability.</div>
                </c:if>
                <c:if test="${param.checkin_checkout_date_invalid == 'true'}">
                    <div class="alert alert-warning">Check-in date must not be before today and check-out must be after check-in!</div>
                </c:if>

                <!-- Add Booking Form -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card mb-4">
                            <div class="card-header">Add New Booking</div>
                            <div class="card-body">
                                <form method="post" action="${cp}/admin/booking/add">
                                    <!-- CSRF Token -->
                                    <c:if test="${not empty _csrf}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </c:if>

                                    <!-- Accommodation Type -->
                                    <div class="form-group">
                                        <label>Accommodation Type</label>
                                        <input type="text" class="form-control" name="accommodationType" placeholder="e.g., Single Room" required>
                                    </div>

                                    <!-- Check-in Date -->
                                    <div class="form-group">
                                        <label>Check-in Date</label>
                                        <input type="date" class="form-control" name="checkIn" min="${today}" required />
                                    </div>

                                    <!-- Check-out Date -->
                                    <div class="form-group">
                                        <label>Check-out Date</label>
                                        <input type="date" class="form-control" name="checkOut" min="${tomorrow}" required />
                                    </div>

                                    <!-- Number of Persons -->
                                    <div class="form-group">
                                        <label>Number of Persons</label>
                                        <input type="number" class="form-control" name="noOfPersons" min="1" required />
                                    </div>

                                    <!-- Status -->
                                   
                                    <button type="submit" class="btn btn-primary">Save Booking</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <%@ include file="footer.jsp"%>
        </div>
    </div>
</div>

<script src="${cp}/backend/vendor/jquery/jquery.min.js"></script>
<script src="${cp}/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${cp}/backend/js/sb-admin-2.min.js"></script>
</body>
</html>
