package com.aayusha.etravel.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.aayusha.etravel.entity.Accommodation;
import com.aayusha.etravel.service.AccommodationService;
import com.aayusha.etravel.service.UploadService;

@Controller
public class AccommodationController {

    @Autowired
    private AccommodationService accommodationService;
    
    @Autowired
    private UploadService uploadService;
    
    // Show Add Accommodation Page
    @GetMapping("/admin/accommodation/add")
    public String addAccommodation() {
        return "admin/accommodation"; // this JSP contains the add form
    }
    
    // Save Accommodation
    @PostMapping("/admin/accommodation/save")
    public String saveAccommodation(@ModelAttribute Accommodation accommodation) {
        
        // Save accommodation detail
        List<String> imageNames = new ArrayList<>();
        if (accommodation.getImages() != null) {
            for (MultipartFile imageFile : accommodation.getImages()) {
                imageNames.add(imageFile.getOriginalFilename());
            }
        }
        accommodation.setImageNames(imageNames);
        accommodation.setStatus("AVAILABLE");

        accommodationService.saveAccommodation(accommodation);

        // Upload images
        String typeId = accommodation.getType() + "_" + accommodation.getId();
        if (uploadService.uploadAccommodationImages(typeId, accommodation.getImages())) {
            return "redirect:/admin/accommodation/add?upload=success";
        }
        return "redirect:/admin/accommodation/add?upload=failure";
    }
    
    
    
}
