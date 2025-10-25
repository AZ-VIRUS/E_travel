package com.aayusha.etravel.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.aayusha.etravel.entity.UserDetail;
import com.aayusha.etravel.service.AccommodationBookingService;
import com.aayusha.etravel.service.UserDetailService;

@Controller
public class UserController {
	
	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private AccommodationBookingService bookingService;
	

	@GetMapping("/user/profile")
	public String uerHome(Principal p, Model model) {
		String username = p.getName();
		model.addAttribute("username", username);
		UserDetail ud = userDetailService.getUserByUsername(username);
		model.addAttribute("user_detail", ud);
		// send user's booking in profile page
		model.addAttribute("bookings", bookingService.getAllBookingsByUserDetail(ud));
		return "user_profile";
	}
	
	
	
}
