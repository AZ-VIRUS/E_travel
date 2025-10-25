package com.aayusha.etravel.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aayusha.etravel.dao.BookingRepository;
import com.aayusha.etravel.entity.AccommodationBookingDetail;
import com.aayusha.etravel.entity.Accommodation;
import com.aayusha.etravel.entity.UserDetail;

@Service
@Transactional
public class AccommodationBookingServiceImpl implements AccommodationBookingService{

	@Autowired
	private BookingRepository bookingRepository;
	
	@Override
	public int saveAccommodationBooking(AccommodationBookingDetail bookingDetail) {
		
		return bookingRepository.save(bookingDetail).getId();
	}

	@Override
	public List<AccommodationBookingDetail> getAllBookings() {
		
		return bookingRepository.findAll();
	}
	
	@Override
	public AccommodationBookingDetail getBookingById(int id) {
		
		return bookingRepository.findById(id).get();
	}


	@Override
	public List<AccommodationBookingDetail> getAllBookingsByAccommodation(Accommodation accommodation) {
		// TODO Auto-generated method stub
		return bookingRepository.findByAccommodation(accommodation);
	}

	@Override
	public List<AccommodationBookingDetail> getAccommodationByDateBetween(Accommodation accommodation,LocalDate checkIn, LocalDate checkOut) {
		
		return bookingRepository.findByAccommodationAndCheckInBetween(accommodation,checkIn, checkOut);
	}

	@Override
	public void updateAccommodationBookingDetail(AccommodationBookingDetail bookingDetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAccommodationBookingDetail(AccommodationBookingDetail bookingDetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AccommodationBookingDetail> getAllBookingsByUserDetail(UserDetail userDetail) {
		
		return bookingRepository.findByUserDetail(userDetail);
	}

	
}
