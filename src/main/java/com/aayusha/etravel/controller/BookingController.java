package com.aayusha.etravel.controller;
import java.security.Principal;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aayusha.etravel.entity.AccommodationBookingDetail;
import com.aayusha.etravel.entity.UserDetail;
import com.aayusha.etravel.service.AccommodationBookingService;
import com.aayusha.etravel.service.AccommodationService;

import com.aayusha.etravel.service.UserDetailService;

@Controller
public class BookingController {

	

	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private AccommodationService accommodationService;
	
	@Autowired
	private AccommodationBookingService bookingService;
	
	
	
	@GetMapping("/user/accom/book/{id}")
	public String bookingProcess(Model model, @PathVariable("id") int id) {
		model.addAttribute("acc", accommodationService.getAccommodation(id));
		return "hotels_booking";
	}
	
	
	
	@PostMapping("/user/book/confirm")
	public String saveBooking(@ModelAttribute AccommodationBookingDetail bookingDetail, Principal p) {
		// process payment
		
		
		
		// after successful payment add new booking
		UserDetail userDetail = userDetailService.getUserByUsername(p.getName());
		//	System.out.println(userDetail.getId());
		bookingDetail.setUserDetail(userDetail);
		if( bookingDetail.getCheckIn().isBefore(LocalDate.now()) 
						|| bookingDetail.getCheckOut().compareTo(bookingDetail.getCheckIn())<0) {
			return "redirect:/accommodations?booking=failure&checkin_checkout_date_invalid=true";
		}
		else if(bookingService
				.getAccommodationByDateBetween( bookingDetail.getAccommodation(),
												bookingDetail.getCheckIn(), 
												bookingDetail.getCheckOut()).size()==0) {
			int id = bookingService.saveAccommodationBooking(bookingDetail);
			return "redirect:/user/booking/e-pay/"+id;
		}
		else {
			return "redirect:/accommodations?booking=failure";
		}
	}
	
	
	
	
	
	@GetMapping("/admin/booking/add")
	public String addBooking(Model model) {
		model.addAttribute("accommodation_list", 
							accommodationService.getAccommodationByStatus("AVAILABLE"));
		return "admin/booking_add";
	}
	
	
	@PostMapping("/admin/booking/add")
	public String addBooking(@ModelAttribute AccommodationBookingDetail bookingDetail, Principal p) {
		UserDetail userDetail = userDetailService.getUserByUsername(p.getName());
		//	System.out.println(userDetail.getId());
		bookingDetail.setUserDetail(userDetail);  
		// set admin as a user who books the room for customers from mail or phone
		if( bookingDetail.getCheckIn().isBefore(LocalDate.now()) 
						|| bookingDetail.getCheckOut().compareTo(bookingDetail.getCheckIn())<0) {
			return "redirect:/admin/booking/add?booking=failure&checkin_checkout_date_invalid=true";
		}
		else if(bookingService
				.getAccommodationByDateBetween( bookingDetail.getAccommodation(),
												bookingDetail.getCheckIn(), 
												bookingDetail.getCheckOut()).size()==0) {
			bookingService.saveAccommodationBooking(bookingDetail);
			return "redirect:/admin/booking/show?booking=success";
		}
		else {
			return "redirect:/admin/booking/add?booking=failure";
		}
	}
	
	@GetMapping("/admin/booking/show")
	public String showBookings(Model model) {
		model.addAttribute("booking_list", bookingService.getAllBookings());
		return "admin/booking_add";
	}
	
	
}
