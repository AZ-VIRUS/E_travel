package com.aayusha.etravel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayusha.etravel.dao.AccommodationRepository;
import com.aayusha.etravel.entity.Accommodation;

import jakarta.transaction.Transactional;

@Service
@Transactional 
public class AccommodationServiceImpl implements AccommodationService{
	
	@Autowired
	private AccommodationRepository accommodationRepository;

	@Override
	public void saveAccommodation(Accommodation accommodation) {
		accommodationRepository.save(accommodation);
	}

	@Override
	public List<Accommodation> getAllAccommodations() {
		
		return accommodationRepository.findAll();
	}

	@Override
	public Accommodation getAccommodation(int id) {
		
		return accommodationRepository.findById(id).get();
	}

	@Override
	public List<Accommodation> getAccommodationByType(String type) {
		
		return accommodationRepository.findByType(type);
	}

	@Override
	public List<Accommodation> getAccommodationByStatus(String status) {
		
		return accommodationRepository.findByStatus(status);
	}

	@Override
	public List<Accommodation> getAccommodationByLocation(String location) {
		
		return accommodationRepository.findByLocationLike(location);
	}

	@Override
	public List<Accommodation> getAccommodationByPriceLessThan(double price) {
		
		return accommodationRepository.findByPriceLessThanEqual(price);
	}

	@Override
	public List<Accommodation> getAccommodationByPriceGreaterThan(double price) {
		
		return accommodationRepository.findByPriceGreaterThanEqual(price);
	}

	@Override
	public List<Accommodation> getAccommodationByPriceBetween(double price1, double price2) {
		
		return accommodationRepository.findByPriceBetween(price1, price2);
	}

	@Override
	public void updateAccommodation(Accommodation accommodation) {
		accommodationRepository.save(accommodation);
	}

	@Override
	public void deleteAccommodation(Accommodation accommodation) {
		accommodationRepository.delete(accommodation);
	}

}
