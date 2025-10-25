package com.aayusha.etravel.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity @Table(name="transportation_table")
public class Transportation implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY) @Column(name="transport_id")
	private int id;
	
	@Column(name="service_provider")
	private String serviceProvider;
	
	@Column(name="departure_location")
	private String departureLocation;
	
	@Column(name="destination_location")
	private String destinationLocation;
	
	@Column(name="departure_datetime")
	private LocalDateTime departureDateTime;
	
	@Column(name="arrival_datetime")
	private LocalDateTime arrivalDateTime;
	
	@Column(name="available_seats")
	private int availableSeats;
	
	private double price;

	public Transportation() {
		super();
	}

	public Transportation(int id, String serviceProvider, String departureLocation, String destinationLocation,
			LocalDateTime departureDateTime, LocalDateTime arrivalDateTime, int availableSeats, double price) {
		super();
		this.id = id;
		this.serviceProvider = serviceProvider;
		this.departureLocation = departureLocation;
		this.destinationLocation = destinationLocation;
		this.departureDateTime = departureDateTime;
		this.arrivalDateTime = arrivalDateTime;
		this.availableSeats = availableSeats;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServiceProvider() {
		return serviceProvider;
	}

	public void setServiceProvider(String serviceProvider) {
		this.serviceProvider = serviceProvider;
	}

	public String getDepartureLocation() {
		return departureLocation;
	}

	public void setDepartureLocation(String departureLocation) {
		this.departureLocation = departureLocation;
	}

	public String getDestinationLocation() {
		return destinationLocation;
	}

	public void setDestinationLocation(String destinationLocation) {
		this.destinationLocation = destinationLocation;
	}

	public LocalDateTime getDepartureDateTime() {
		return departureDateTime;
	}

	public void setDepartureDateTime(LocalDateTime departureDateTime) {
		this.departureDateTime = departureDateTime;
	}

	public LocalDateTime getArrivalDateTime() {
		return arrivalDateTime;
	}

	public void setArrivalDateTime(LocalDateTime arrivalDateTime) {
		this.arrivalDateTime = arrivalDateTime;
	}

	public int getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Transportation [id=" + id + ", serviceProvider=" + serviceProvider + ", departureLocation="
				+ departureLocation + ", destinationLocation=" + destinationLocation + ", departureDateTime="
				+ departureDateTime + ", arrivalDateTime=" + arrivalDateTime + ", availableSeats=" + availableSeats
				+ ", price=" + price + "]";
	}
	
}
