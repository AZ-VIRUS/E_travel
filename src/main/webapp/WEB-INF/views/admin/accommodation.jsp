<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>eTravel - Accommodation Management</title>
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

                <h1 class="h3 mb-4 text-gray-800">Accommodation Management</h1>

                <!-- Success Messages -->
                <c:if test="${param.upload == 'success'}">
                    <div class="alert alert-success">Accommodation saved successfully!</div>
                </c:if>
                <c:if test="${param.delete == 'success'}">
                    <div class="alert alert-success">Accommodation deleted successfully!</div>
                </c:if>

                <!-- Add Form -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card mb-4">
                            <div class="card-header">Add New Accommodation</div>
                            <div class="card-body">
                                <form method="post" action="${cp}/admin/accommodation/save">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                    <div class="form-group">
                                        <label>Type</label>
                                        <input class="form-control" type="text" name="type" placeholder="Accommodation Type" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Location</label>
                                        <input class="form-control" type="text" name="location" placeholder="Location" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Price</label>
                                        <input class="form-control" type="number" name="price" placeholder="Price" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Facility</label><br/>
                                        <input type="checkbox" name="hasWifi" value="true"> WiFi<br/>
                                        <input type="checkbox" name="hasParking" value="true"> Parking
                                    </div>

                                    <button type="submit" class="btn btn-primary">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- List all accommodations -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" id="data_table">
                            <div class="card-header">All Accommodations</div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Type</th>
                                        <th>Location</th>
                                        <th>Price</th>
                                        <th>WiFi</th>
                                        <th>Parking</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="accommodation" items="${accommodation_list}">
                                        <tr>
                                            <td>${accommodation.id}</td>
                                            <td>${accommodation.type}</td>
                                            <td>${accommodation.location}</td>
                                            <td>${accommodation.price}</td>
                                            <td>${accommodation.hasWifi}</td>
                                            <td>${accommodation.hasParking}</td>
                                            <td>
                                                <a class="btn btn-danger" href="${cp}/admin/accommodation/delete/${accommodation.id}" 
                                                   onclick="return confirm('Are you sure you want to delete this accommodation?');">
                                                   <i class="fa fa-trash"></i> Delete
                                                </a>
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
            <%@ include file="footer.jsp"%>
        </div>
    </div>
</div>

<script src="${cp}/backend/vendor/jquery/jquery.min.js"></script>
<script src="${cp}/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${cp}/backend/js/sb-admin-2.min.js"></script>
</body>
</html>
