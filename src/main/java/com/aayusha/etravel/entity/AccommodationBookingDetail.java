package com.aayusha.etravel.entity;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="accommodation_booking_table")
public class AccommodationBookingDetail implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="booking_id")
	private int id;
	@ManyToOne
	@JoinColumn(name="acc_id")
	private Accommodation accommodation;
	@ManyToOne
	@JoinColumn(name="user_id")
	private UserDetail userDetail;
	@Column(name="check_in")
	private LocalDate checkIn;
	@Column(name="check_out")
	private LocalDate checkOut;
	@Column(name="no_of_persons")
	private int noOfPersons;

	private String status;
	
	public AccommodationBookingDetail() {
		super();
	}

	public AccommodationBookingDetail(int id, Accommodation accommodation, UserDetail userDetail, LocalDate checkIn,
			LocalDate checkOut, int noOfPersons,  String status) {
		super();
		this.id = id;
		this.accommodation = accommodation;
		this.userDetail = userDetail;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.noOfPersons = noOfPersons;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Accommodation getAccommodation() {
		return accommodation;
	}

	public void setAccommodation(Accommodation accommodation) {
		this.accommodation = accommodation;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	public LocalDate getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(LocalDate checkIn) {
		this.checkIn = checkIn;
	}

	public LocalDate getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(LocalDate checkOut) {
		this.checkOut = checkOut;
	}

	public int getNoOfPersons() {
		return noOfPersons;
	}

	public void setNoOfPersons(int noOfPersons) {
		this.noOfPersons = noOfPersons;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
