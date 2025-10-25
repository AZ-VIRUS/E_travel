package com.aayusha.etravel.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aayusha.etravel.entity.Accommodation;

public interface AccommodationRepository extends JpaRepository<Accommodation, Integer>{

	public List<Accommodation> findByType(String type);
	
	public List<Accommodation> findByStatus(String status);
	
	public List<Accommodation> findByLocationLike(String location);
	
	public List<Accommodation> findByPriceLessThanEqual(double price);
	
	public List<Accommodation> findByPriceGreaterThanEqual(double price);
	
	public List<Accommodation> findByPriceBetween(double price1, double price2);
	
	
}
