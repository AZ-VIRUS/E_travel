<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotels</title>
    <link rel="stylesheet" href="css/hotels_style.css">
</head>
<body>
    <header>
        <h1>Hotels Gallery</h1>
    </header>
    <main>
        <div class="gallery">
        
        <c:forEach items="${accom }" var="acc">
            <div class="product">
                <img src="${pageContext.request.contextPath }/${acc.type}_${acc.id}/${ acc.imageNames[0]}" 
                		alt="${acc.type}_${acc.id}">
                <h2>${acc.type }</h2>
                <h2>${acc.location }</h2>
                <p>Rs ${acc.price }</p>
                <p><a href="${pageContext.request.contextPath }/user/accom/book/${acc.id}">Book Now</a></p>
            </div>
        </c:forEach>  
           
            
        </div>
    </main>
</body>
</html>
