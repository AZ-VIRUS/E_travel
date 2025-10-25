package com.aayusha.etravel.service;

import java.util.List;

import com.aayusha.etravel.entity.Transportation;


public interface TransportationService {
	
	public void saveTransportation(Transportation transportation);
	
	public List<Transportation> getAllTransportation();
	
	public Transportation getTransportationById(int id);
	
	public List<Transportation> getTransportationByServiceProvider(String serviceProvider);
	
	public List<Transportation> getTransportationByDepartureLocationAndDestinationLocation(String departureLocation, String destinationLocation);
	
	public List<Transportation> getTransportationByDestinationLocation(String destinationLocation);
	
	public void updateTransportation(Transportation transportation);
	
	public void deleteTransportation(Transportation transportation);

}
