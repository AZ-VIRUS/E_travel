package com.aayusha.etravel.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aayusha.etravel.entity.AccommodationBookingDetail;
import com.aayusha.etravel.entity.Accommodation;
import com.aayusha.etravel.entity.UserDetail;

public interface BookingRepository extends JpaRepository<AccommodationBookingDetail, Integer>{

	
	
	public List<AccommodationBookingDetail> findByAccommodation(Accommodation accommodation);
	
	public List<AccommodationBookingDetail> findByUserDetail(UserDetail userDetail);
	
	public List<AccommodationBookingDetail> 
				findByAccommodationAndCheckInBetween(Accommodation accommodation, LocalDate checkIn, LocalDate checkOut);
	
	
}
