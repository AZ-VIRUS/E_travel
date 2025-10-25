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

<title>eTravel - Accommodation MGMT</title>

<!-- Custom fonts for this template-->
<link href="${cp}/backend/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${cp}/backend/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

<div id="wrapper">
    <%@ include file="sidebar.jsp"%>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <%@ include file="topbar.jsp"%>
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Accommodation Management</h1>
                </div>

                <div class="row">
                    <div class="col col-lg-12">
                        <c:choose>
                            <c:when test="${edit ne true}">
                                <!-- Add Card -->
                                <div class="card">
                                    <div class="card-heading">Add New Accommodation</div>
                                    <div class="card-body">
                                        <form method="post" action="${cp}/admin/accommodation/add" enctype="multipart/form-data">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                                            <div class="form-group">
                                                <label>Type</label>
                                                <input class="form-control" type="text" name="type" placeholder="Enter Type" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Location</label>
                                                <input class="form-control" type="text" name="location" placeholder="Enter Location" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Price</label>
                                                <input class="form-control" type="number" step="0.01" name="price" placeholder="Enter Price" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Facilities</label><br>
                                                <input type="checkbox" name="hasWifi" value="true"> WiFi<br>
                                                <input type="checkbox" name="hasParking" value="true"> Parking
                                            </div>

                                            <div class="form-group">
                                                <label>Images</label>
                                                <input class="form-control" type="file" name="images" required><br>
                                                <input class="form-control" type="file" name="images"><br>
                                                <input class="form-control" type="file" name="images"><br>
                                                <input class="form-control" type="file" name="images"><br>
                                            </div>

                                            <div class="form-group">
                                                <input class="btn btn-info" type="submit" value="Save">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- Edit Card -->
                                <div class="card">
                                    <div class="card-heading">Edit Accommodation</div>
                                    <div class="card-body">
                                        <form method="post" action="${cp}/admin/accommodation/edit" enctype="multipart/form-data">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <input type="hidden" name="id" value="${accommodation.id}">

                                            <div class="form-group">
                                                <label>Type</label>
                                                <input class="form-control" type="text" name="type" value="${accommodation.type}" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Location</label>
                                                <input class="form-control" type="text" name="location" value="${accommodation.location}" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Price</label>
                                                <input class="form-control" type="number" step="0.01" name="price" value="${accommodation.price}" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Facilities</label><br>
                                                <input type="checkbox" name="hasWifi" value="true" <c:if test="${accommodation.hasWifi}">checked</c:if>> WiFi<br>
                                                <input type="checkbox" name="hasParking" value="true" <c:if test="${accommodation.hasParking}">checked</c:if>> Parking
                                            </div>

                                            <div class="form-group">
                                                <label>Images</label>
                                                <input class="form-control" type="file" name="images"><br>
                                                <input class="form-control" type="file" name="images"><br>
                                            </div>

                                            <div class="form-group">
                                                <input class="btn btn-info" type="submit" value="Update">
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
                            <div class="card-heading">All Accommodations</div>
                            <div class="card-body">
                                <table class="table table-striped table-responsive">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Type</th>
                                            <th>Location</th>
                                            <th>Price</th>
                                            <th>Facilities</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${accommodation_list}" var="accommodation">
                                            <tr>
                                                <td>${accommodation.id}</td>
                                                <td>${accommodation.type}</td>
                                                <td>${accommodation.location}</td>
                                                <td>${accommodation.price}</td>
                                                <td>
                                                    <c:if test="${accommodation.hasWifi}">WiFi </c:if>
                                                    <c:if test="${accommodation.hasParking}">Parking</c:if>
                                                </td>
                                                <td>${accommodation.status}</td>
                                                <td>
                                                    <a class="btn btn-warning" href="${cp}/admin/accommodation/edit/${accommodation.id}"><i class="fa fa-edit"></i></a>
                                                    <a class="btn btn-danger" href="${cp}/admin/accommodation/delete/${accommodation.id}"><i class="fa fa-trash"></i></a>
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

<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
<%@ include file="logout_model.jsp"%>
<script src="${cp}/backend/vendor/jquery/jquery.min.js"></script>
<script src="${cp}/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${cp}/backend/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${cp}/backend/js/sb-admin-2.min.js"></script>

</body>
</html>
