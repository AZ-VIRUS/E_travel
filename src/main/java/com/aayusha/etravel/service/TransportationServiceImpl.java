package com.aayusha.etravel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aayusha.etravel.dao.TransportationRepository;
import com.aayusha.etravel.entity.Transportation;


@Service @Transactional
public class TransportationServiceImpl implements TransportationService {

	@Autowired
	private TransportationRepository transportationRepository;
	
	@Override
	public void saveTransportation(Transportation transportation) {
		transportationRepository.save(transportation);
	}

	@Override
	public List<Transportation> getAllTransportation() {
		return transportationRepository.findAll();
	}

	@Override
	public Transportation getTransportationById(int id) {
		return transportationRepository.findById(id).get();
	}

	@Override
	public List<Transportation> getTransportationByServiceProvider(String serviceProvider) {
		return transportationRepository.findByServiceProvider(serviceProvider);
	}

	@Override
	public List<Transportation> getTransportationByDepartureLocationAndDestinationLocation(String departureLocation,
			String destinationLocation) {
		return transportationRepository.findByDepartureLocationAndDestinationLocation(departureLocation, destinationLocation);
	}

	@Override
	public List<Transportation> getTransportationByDestinationLocation(String destinationLocation) {
		return transportationRepository.findByDestinationLocation(destinationLocation);
	}

	@Override
	public void updateTransportation(Transportation transportation) {
		transportationRepository.save(transportation);
	}

	@Override
	public void deleteTransportation(Transportation transportation) {
		transportationRepository.delete(transportation);
	}
}
