package com.aayusha.etravel.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadServiceImpl implements UploadService{

	@Override
	public boolean uploadAccommodationImage(MultipartFile image) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean uploadAccommodationImages(String type_id, List<MultipartFile> images) {
		// folder to upload images in E_Travel directory in "type_id" form of name
		String uploadDir = UPLOAD_DIR+"//"+type_id;
		File dir = new File(uploadDir);
		if(!dir.exists()) {
			dir.mkdirs();  // create if directory does not exist
		}
		
		File uploadFile = null;
		for(MultipartFile file : images ) {
			if(file.isEmpty()) 
				continue;
			
				uploadFile = new File(uploadDir + File.separator + file.getOriginalFilename());
				try {
					file.transferTo(uploadFile);
				} catch (IOException e) {
					System.out.println(e);
					return false;
				}
			
		}
		return true;
	}
	

}
