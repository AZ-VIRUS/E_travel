<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Our Services - eTravel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .header {
            text-align: center;
            padding: 50px 20px;
            background-color: #004080;
            color: white;
        }

        .header h1 {
            margin: 0;
        }

        .services-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 50px 20px;
            gap: 30px;
        }

        .service-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 300px;
            text-align: center;
            padding: 20px;
            transition: transform 0.2s;
        }

        .service-card:hover {
            transform: translateY(-5px);
        }

        .service-card img {
            width: 100%;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .service-card h3 {
            margin: 10px 0;
            color: #004080;
        }

        .service-card p {
            font-size: 14px;
            color: #555;
        }

        /* Responsive for small screens */
        @media (max-width: 650px) {
            .services-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Our Services</h1>
        <p>Explore the wide range of services eTravel offers to make your journey unforgettable.</p>
    </div>

    <div class="services-container">
        <!-- Service 1 -->
        <div class="service-card">
            
            <h3>Accommodation Booking</h3>
            <p>We offer a variety of hotels, resorts, and homestays to suit your budget and preferences, all available for instant booking online.</p>
        </div>

        <!-- Service 2 -->
        <div class="service-card">
            
            <h3>Travel Packages</h3>
            <p>Customized travel packages for solo travelers, families, and groups, including sightseeing, adventure tours, and luxury experiences.</p>
        </div>

        <!-- Service 3 -->
        <div class="service-card">
            
            <h3>Easy Transportation</h3>
            <p>Our platform ensures safe and quick transportation options so that your travel is comfortable.</p>
        </div>

        <!-- Service 4 -->
        <div class="service-card">
            
            <h3>24/7 Customer Support</h3>
            <p>Our dedicated support team is available round-the-clock to help you with bookings, cancellations, and travel guidance.</p>
        </div>
    </div>
</body>
</html>
