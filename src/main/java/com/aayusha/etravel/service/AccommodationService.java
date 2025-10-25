package com.aayusha.etravel.service;

import java.util.List;

import com.aayusha.etravel.entity.Accommodation;

public interface AccommodationService {
	
	public void saveAccommodation(Accommodation accommodation);
	
	public List<Accommodation> getAllAccommodations();
	
	public Accommodation getAccommodation(int id);
	
	public List<Accommodation> getAccommodationByType(String type);
	
	public List<Accommodation> getAccommodationByStatus(String status);
	
	public List<Accommodation> getAccommodationByLocation(String location);
	
	public List<Accommodation> getAccommodationByPriceLessThan(double price);
	
	public List<Accommodation> getAccommodationByPriceGreaterThan(double price);
	
	public List<Accommodation> getAccommodationByPriceBetween(double price1, double price2);
	
	public void updateAccommodation(Accommodation accommodation);
	
	public void deleteAccommodation(Accommodation accommodation);

}
