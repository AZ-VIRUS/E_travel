package com.aayusha.etravel.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "accommodation_booking_table")
public class AccommodationBookingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookingId;

    @ManyToOne
    @JoinColumn(name = "acc_id", nullable = false)
    private Accommodation accommodation;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserDetail userDetail;

    private LocalDate checkIn;
    private LocalDate checkOut;
    private int noOfPersons;
    private String status = "Pending";

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    public Accommodation getAccommodation() { return accommodation; }
    public void setAccommodation(Accommodation accommodation) { this.accommodation = accommodation; }
    public UserDetail getUserDetail() { return userDetail; }
    public void setUserDetail(UserDetail userDetail) { this.userDetail = userDetail; }
    public LocalDate getCheckIn() { return checkIn; }
    public void setCheckIn(LocalDate checkIn) { this.checkIn = checkIn; }
    public LocalDate getCheckOut() { return checkOut; }
    public void setCheckOut(LocalDate checkOut) { this.checkOut = checkOut; }
    public int getNoOfPersons() { return noOfPersons; }
    public void setNoOfPersons(int noOfPersons) { this.noOfPersons = noOfPersons; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
	
	
}
