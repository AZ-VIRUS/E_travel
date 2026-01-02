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
        <h1>About us..</h1>
        <p>"E-Travel is your trusted companion for 
        seamless and unforgettable travel experiences. 
        We specialize in providing a wide range of accommodations, 
        from cozy rooms to luxurious suites, tailored to your comfort and budget.
         Our mission is to make booking simple, transparent, and stress-free, so you can 
         focus on creating memories that last a lifetime. At E-Travel, we believe that every journey matters, 
         and we are dedicated to helping you explore the world with confidence and ease."<br> <br>
         
         "YOUR COMFORT IS OUR PRIORITY"
         
         
         
         </p>
    
</body>
</html>
