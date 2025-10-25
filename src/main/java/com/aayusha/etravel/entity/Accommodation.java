package com.aayusha.etravel.entity;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name="accommodation_table")
public class Accommodation implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="acc_id")
	private int id;
	
	private String type;
	
	private String location;
	
	private String status;
	
	private double price;
	
	private boolean hasWifi;
	
	private boolean hasParking;
	
	@OneToMany(mappedBy="accommodation")
	private List<AccommodationBookingDetail> bookingDetails;
	
	@Transient
	private List<MultipartFile> images;
	
	private List<String> imageNames;

	public Accommodation() {
		super();
	}

	
	
	public Accommodation(int id, String type, String location, String status, double price, boolean hasWifi,
			boolean hasParking, List<MultipartFile> images, List<String> imageNames, List<AccommodationBookingDetail> bookingDetails) {
		super();
		this.id = id;
		this.type = type;
		this.location = location;
		this.status = status;
		this.price = price;
		this.hasWifi = hasWifi;
		this.hasParking = hasParking;
		this.images = images;
		this.imageNames = imageNames;
		this.bookingDetails= bookingDetails;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isHasWifi() {
		return hasWifi;
	}

	public void setHasWifi(boolean hasWifi) {
		this.hasWifi = hasWifi;
	}

	public boolean isHasParking() {
		return hasParking;
	}

	public void setHasParking(boolean hasParking) {
		this.hasParking = hasParking;
	}



	public List<MultipartFile> getImages() {
		return images;
	}



	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}



	public List<String> getImageNames() {
		return imageNames;
	}



	public void setImageNames(List<String> imageNames) {
		this.imageNames = imageNames;
	}



	public List<AccommodationBookingDetail> getBookingDetails() {
		return bookingDetails;
	}



	public void setBookingDetails(List<AccommodationBookingDetail> bookingDetails) {
		this.bookingDetails = bookingDetails;
	}



	@Override
	public String toString() {
		return "Accommodation [id=" + id + ", type=" + type + ", location=" + location + ", status=" + status
				+ ", price=" + price + ", hasWifi=" + hasWifi + ", hasParking=" + hasParking + ", images=" + images
				+ ", imageNames=" + imageNames + "]";
	}
	
	

}
