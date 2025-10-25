<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Detail</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/hotels_style.css">
</head>
<body>
	<header>
		<h1>Esewa Payment Service</h1>
	</header>
	<main>
		<div class="product-container">
			<div class="product-image"></div>
			<div class="product-details">
				<h1 class="product-title"></h1>
				<p class="product-description"></p>
				<p class="product-price"></p>
				<div>

					
						<form action="https://rc-epay.esewa.com.np/api/epay/main/v2/form" method="POST">
							<input type="text" id="amount" name="amount" value="${payment.amount }" required><br/>
							<input type="text" id="tax_amount" name="tax_amount" value="${payment.taxAmount }" required> <br/>
							<input type="text" id="total_amount" name="total_amount" value="${payment.totalAmount }" required> <br/>
							<input type="text" id="transaction_uuid" name="transaction_uuid" value="${payment.transaction_uuid }" required> <br/>
							<input type="text" id="product_code" name="product_code"value="${payment.productCode }" required> <br/>
							<input type="text" id="product_service_charge" name="product_service_charge" value="${payment.psc }" required>  <br/>
							<input type="text" id="product_delivery_charge" name="product_delivery_charge" value="${payment.pdc }" required> <br/>
							<input type="text" id="success_url" name="success_url" value="${payment.success_url }" required> <br/>
							<input type="text" id="failure_url" name="failure_url" value="${payment.failure_url }" required> <br/>
							<input type="text" id="signed_field_names" name="signed_field_names" value="${payment.signedFiledNames }" required> <br/>
							<input type="text" id="signature" name="signature" value="${payment.signature }" required> <br/>
							<input value="Submit" type="submit"> <br/>
						</form>
				

				</div>

			</div>
		</div>

	</main>
</body>
</html>
