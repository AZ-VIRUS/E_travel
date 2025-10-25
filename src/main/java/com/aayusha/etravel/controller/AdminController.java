package com.aayusha.etravel.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aayusha.etravel.entity.AccommodationBookingDetail;
import com.aayusha.etravel.entity.UserDetail;
import com.aayusha.etravel.service.AccommodationBookingService;
import com.aayusha.etravel.service.EmailService;
import com.aayusha.etravel.service.UserDetailService;

@Controller
public class AdminController {
	
	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private AccommodationBookingService bookingService;
	
	@Autowired
	private EmailService emailService;
	
	
	@GetMapping("admin/home")
	public String adminDashboard(Principal p, Model model) {
		String username = p.getName();
		model.addAttribute("username", username);
		UserDetail ud = userDetailService.getUserByUsername(username);
		model.addAttribute("user_detail", ud);
		return "admin/dashboard";
	}
	
	@GetMapping("/admin/booking/confirm-message/{id}")
	public String bookingComfirm(@PathVariable int id, Model model) {
		AccommodationBookingDetail bookingDetail = bookingService.getBookingById(id);
		UserDetail ud = bookingDetail.getUserDetail();
		String to = null;
		String subject = null;
		StringBuilder message = new StringBuilder();
		if(ud!=null && ud.getUserRole().getRole().contains("USER")){
			to = bookingDetail.getUserDetail().getEmail();
			subject = String.format("%s your booking has been confirmed!", ud.getFirstname() ) ;
			
			model.addAttribute("mail_to", to);
			model.addAttribute("mail_subject", subject);
			
		}
		
		message.append("Dear Sir/Madam\r\n");
		message.append("your booking has been confirmed.\r\n");
		message.append("Booking details:\r\n");
		message.append("Accommodation: "+ bookingDetail.getAccommodation().getType() +"\r\n");
		message.append("Check-in: "+ bookingDetail.getCheckIn() +"\r\n");
		message.append("Check-out: "+ bookingDetail.getCheckOut() +"\r\n");
		model.addAttribute("mail_message", message);
		
		return "admin/mailer";
	}
	
	@PostMapping("/admin/booking/confirm-message")
	public String sendConfirmMail(@RequestParam String to,
									@RequestParam String subject,
									@RequestParam String message) {
		emailService.sendEmail(to, subject, message);
		return "redirect:/admin/booking/show?confirmation_send=true";
	}
	
	
}
