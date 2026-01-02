package com.aayusha.etravel.service;

import java.util.List;
import com.aayusha.etravel.entity.Accommodation;

public interface AccommodationService {
    
    void saveAccommodation(Accommodation accommodation);
    
    List<Accommodation> getAllAccommodations();
    
    Accommodation getAccommodation(int id);
    
    void deleteAccommodation(Accommodation accommodation);
    
    // Optional filtering
    List<Accommodation> getAccommodationByType(String type);
    List<Accommodation> getAccommodationByStatus(String status);
    List<Accommodation> getAccommodationByLocation(String location);
    List<Accommodation> getAccommodationByPriceLessThan(double price);
    List<Accommodation> getAccommodationByPriceGreaterThan(double price);
    List<Accommodation> getAccommodationByPriceBetween(double price1, double price2);
    
    void updateAccommodation(Accommodation accommodation);
}
