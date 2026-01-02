<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Reset default margins */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .contact-card {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 40px 50px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 35px rgba(0,0,0,0.3);
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
            font-size: 2em;
        }

        p {
            color: #555555;
            font-size: 1.1em;
            margin: 10px 0;
        }

        a {
            color: #2575fc;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        a:hover {
            color: #6a11cb;
        }

        .icon {
            margin-right: 8px;
            color: #2575fc;
        }
    </style>
</head>
<body>
    <div class="contact-card">
        <h1>Contact Us</h1>
        <p><span class="icon">&#9993;</span>Email: <a href="mailto:info@example.com">info@example.com</a></p>
        <p><span class="icon">&#128222;</span>Phone: +1 (555) 123-4567</p>
        <p><span class="icon">&#128424;</span>Fax: +1 (555) 987-6543</p>
    </div>
</body>
</html>
