package com.aayusha.etravel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.aayusha.etravel.entity.Accommodation;
import com.aayusha.etravel.entity.UserDetail;
import com.aayusha.etravel.entity.UserRole;
import com.aayusha.etravel.service.AccommodationService;
import com.aayusha.etravel.service.UserDetailService;

@Controller
public class HomeController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private AccommodationService accommodationService;
	
	@GetMapping({"/", "/home"})
	public String openHome(Model model) {
		model.addAttribute("title", "E-Travel");
		List<Accommodation> accommodations = accommodationService.getAccommodationByStatus("AVAILABLE");
		model.addAttribute("accom", accommodations);
		return "index";
	}
	
	@GetMapping("/about")
    public String openAbout(Model model) {
        model.addAttribute("title", "About");
        return "about";
    }
	
	@GetMapping("/services")
    public String openServices(Model model) {
        model.addAttribute("title", "Services");
        List<Accommodation> accommodations = accommodationService.getAccommodationByStatus("AVAILABLE");
		model.addAttribute("accom", accommodations);
        return "services";
    }
	
	@GetMapping("/contact")
    public String openContact(Model model) {
        model.addAttribute("title", "Contact");
        return "contact";
    }
	
	@GetMapping("/register")
	public String userRegistration() {
		return "register";
	}
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute UserDetail userDetail) {
		// check password / confirm password and encode
		if(userDetail.getPassword().equals(userDetail.getConfirmPassword())) {
			// encode password
			userDetail.setPassword(passwordEncoder.encode(userDetail.getPassword()));
		}
		
		UserRole userRole = new UserRole();
		
		if(userDetail.getAuthority().equals("ADMIN")) {
			userDetail.setActive("0");
			userRole.setRole("ROLE_ADMIN");
		}else if(userDetail.getAuthority().equals("USER")) {
			userDetail.setActive("1");
			userRole.setRole("ROLE_USER");
		}else {
			userDetail.setActive("1");
			userRole.setRole("ROLE_GUEST");
		}
		
		// save user_detail and user_role by saving single entity of user_detail
		userRole.setUserDetail(userDetail);
		userDetail.setUserRole(userRole);
		
		userDetailService.saveUserDetail(userDetail);
		return "redirect:/login";
	}
	
	
	@GetMapping("/welcome")
	public String welcomeuser(Authentication auth) {
		String role = auth.getAuthorities().toString();
		if(role.contains("ADMIN")) {
			return "redirect:/admin/home";
		}else if(role.contains("USER")) {
			return "redirect:/user/profile";
		}
		return "index";
	}
	
	
	@GetMapping("/accommodations")
	public String viewAvailableAccommodations(Model model) {
		List<Accommodation> accommodations = accommodationService.getAccommodationByStatus("AVAILABLE");
		model.addAttribute("accom", accommodations);
		return "hotels";
	}
	
	
}
