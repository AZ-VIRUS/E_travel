<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hotels_style.css">
</head>
<body>
 <header>
        <h1>Accommodation Detail</h1>
    </header>
    <main>
    <div class="product-container">
        <div class="product-image">
        
        	<c:forEach items="${acc.imageNames }" var="image_name">
        		<img src="${pageContext.request.contextPath }/${acc.type}_${acc.id}/${ image_name}" 
        					alt="${ image_name}">
        	</c:forEach>
        	
        	 
        </div>
        <div class="product-details">
            <h1 class="product-title">${acc.type }</h1>
            <p class="product-description">${acc.location }</p>
            <p class="product-description">Wifi: ${acc.hasWifi }</p>
            <p class="product-description">Parking: ${acc.hasParking }</p>
            <p class="product-price">Rs ${acc.price }</p>
            <div>
            <form action="${pageContext.request.contextPath }/user/book/confirm" method="post">
            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
            <p>
            <label>Accommodation Id</label>
            <input type="text" name="accommodation" value="${acc.id}" readonly/>
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
            <button type="submit" class="buy-now-button">Confirm Booking</button>
            </p>
            </form>
            </div>
           
        </div>
    </div>
  
    </main>
</body>
</html>
