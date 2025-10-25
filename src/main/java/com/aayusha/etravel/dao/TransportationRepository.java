package com.aayusha.etravel.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aayusha.etravel.entity.Transportation;

@Repository
public interface TransportationRepository extends JpaRepository<Transportation, Integer> {

	public List<Transportation> findByServiceProvider(String serviceProvider);
	
	public List<Transportation> findByDepartureLocationAndDestinationLocation(String departureLocation, String destinationLocation);
	
	public List<Transportation> findByDestinationLocation(String destinationLocation);
}
