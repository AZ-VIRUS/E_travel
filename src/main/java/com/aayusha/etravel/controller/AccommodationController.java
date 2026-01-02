package com.aayusha.etravel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aayusha.etravel.entity.Accommodation;
import com.aayusha.etravel.service.AccommodationService;

@Controller
public class AccommodationController {

    @Autowired
    private AccommodationService accommodationService;

    // Show Add Accommodation Page
    @GetMapping("/admin/accommodation/add")
    public String addAccommodation(org.springframework.ui.Model model) {
        model.addAttribute("accommodation_list", accommodationService.getAllAccommodations());
        return "admin/accommodation"; // JSP file
    }

    // Save Accommodation
    @PostMapping("/admin/accommodation/save")
    public String saveAccommodation(@ModelAttribute Accommodation accommodation) {
        accommodation.setStatus("AVAILABLE"); // default
        accommodationService.saveAccommodation(accommodation);
        return "redirect:/admin/accommodation/add?upload=success";
    }

    // Delete Accommodation by ID
    @GetMapping("/admin/accommodation/delete/{id}")
    public String deleteAccommodation(@PathVariable int id) {
        Accommodation accommodation = accommodationService.getAccommodation(id);
        if (accommodation != null) {
            accommodationService.deleteAccommodation(accommodation);
        }
        return "redirect:/admin/accommodation/add?delete=success";
    }
}
