package com.aayusha.etravel.service;

import java.time.LocalDate;
import java.util.List;

import com.aayusha.etravel.entity.AccommodationBookingDetail;
import com.aayusha.etravel.entity.Accommodation;
import com.aayusha.etravel.entity.UserDetail;

public interface AccommodationBookingService {

	public int saveAccommodationBooking(AccommodationBookingDetail bookingDetail);
	
	public List<AccommodationBookingDetail> getAllBookings();
	
	public AccommodationBookingDetail getBookingById(int id);
	
	public List<AccommodationBookingDetail> 
				getAllBookingsByAccommodation(Accommodation accommodation);
	
	public List<AccommodationBookingDetail> 
				getAllBookingsByUserDetail(UserDetail userDetail);

	public List<AccommodationBookingDetail> 
				getAccommodationByDateBetween(Accommodation accommodation,LocalDate checkIn, LocalDate checkOut);
	
	public void updateAccommodationBookingDetail(AccommodationBookingDetail bookingDetail);
	
	public void deleteAccommodationBookingDetail(AccommodationBookingDetail bookingDetail);
	

}
