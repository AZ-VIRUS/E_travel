# eTravel Management System

## Overview
eTravel is a web-based management system designed to streamline travel-related services for admins and users. It allows admins to manage accommodations, transportation, bookings, and memberships efficiently. This project is built using **Spring Boot**, **Spring MVC**, **Spring Data JPA**, **JSP**, and **Bootstrap/SB Admin 2** for frontend styling.

---

## Features

### Admin Features
- **Dashboard**: View overall metrics, recent bookings, and quick stats.
- **Accommodation Management**:
  - Add, edit, and delete accommodation details.
  - Manage accommodation availability and pricing.
- **Transportation Management**:
  - Add, edit, and delete transportation services.
  - Track departure and arrival schedules, available seats, and pricing.
- **Membership Management**:
  - Add, edit, and remove membership plans.
  - Assign memberships to users for discounts or special privileges.
- **Booking Management**:
  - View all bookings for accommodations and transportation.
  - Confirm or cancel bookings.
  - Send confirmation emails to users.

### User Features
- Browse available accommodations and transportation.
- Make bookings for accommodations and transportation.
- View booking history.
- Manage their profile and membership details.

---

## Technology Stack

- **Backend**: Spring Boot, Spring MVC, Spring Data JPA
- **Frontend**: JSP, HTML, CSS, Bootstrap 4 (SB Admin 2 template)
- **Database**: MySQL / H2 (for development)
- **Email Service**: JavaMailSender (Spring Boot)
- **Build Tool**: Maven
- **Server**: Embedded Tomcat (via Spring Boot)

---

## Project Structure

com.aayusha.etravel
│
├─ controller # Spring MVC controllers
├─ entity # JPA entities for Accommodation, Transportation, Membership, Booking, User
├─ service # Business logic layer
├─ dao # Repository interfaces for DB operations
├─ resources
│ ├─ templates # JSP views
│ └─ static # CSS, JS, Images
└─ Application.java # Main Spring Boot application

---

## Setup Instructions

1. **Clone the Repository**
```bash
git clone <repository-url>
cd eTravel
Configure Database

Update application.properties with your MySQL credentials:

spring.datasource.url=jdbc:mysql://localhost:3306/etravel_db
spring.datasource.username=root
spring.datasource.password=yourpassword
spring.jpa.hibernate.ddl-auto=update


Build & Run

mvn clean install
mvn spring-boot:run


Access the Application

Open your browser and navigate to http://localhost:8080/admin/home

Notes

File Uploads: Accommodation images are optional. You can skip uploading images if not needed.

Membership Management: Allows admins to manage subscription plans for users.

Email Service: Make sure SMTP configuration is correct in application.properties to send booking confirmation emails.

