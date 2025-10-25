package com.aayusha.etravel.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
	
	
	public String UPLOAD_DIR = "D:\\e_travel";
	
	public boolean uploadAccommodationImage(MultipartFile image);
	
	public boolean uploadAccommodationImages(String type_id, List<MultipartFile> images);
	
	

}
