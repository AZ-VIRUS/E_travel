<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accommodation Booking</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hotels_style.css">
</head>
<body>
<header>
    <h1>Accommodation Detail</h1>
</header>

<main>
<div class="product-container">
    <div class="product-image">
        <c:forEach items="${acc.imageNames}" var="image_name">
            <img src="${pageContext.request.contextPath}/${acc.type}_${acc.id}/${image_name}" 
                 alt="${image_name}" />
        </c:forEach>
    </div>

    <div class="product-details">
        <h2 class="product-title">${acc.type}</h2>
        <p class="product-description">${acc.location}</p>
        <p class="product-description">Wifi: ${acc.hasWifi}</p>
        <p class="product-description">Parking: ${acc.hasParking}</p>
        <p class="product-price">Rs ${acc.price}</p>

        <!-- Booking Form -->
        <form action="${pageContext.request.contextPath}/user/book/confirm" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <!-- Send accommodationId so controller fetches the entity -->
            <input type="hidden" name="accommodationId" value="${acc.id}" />

            <div class="form-group">
                <label>Check-in Date</label>
                <input type="date" name="checkIn" min="${today}" required/>
            </div>

            <div class="form-group">
                <label>Check-out Date</label>
                <input type="date" name="checkOut" min="${today}" required/>
            </div>

            <div class="form-group">
                <label>Number of Persons</label>
                <input type="number" name="noOfPersons" min="1" value="1" required/>
            </div>

            <div class="form-group">
                <button type="submit" class="buy-now-button">Confirm Booking</button>
            </div>
        </form>
    </div>
</div>
</main>

</body>
</html>
