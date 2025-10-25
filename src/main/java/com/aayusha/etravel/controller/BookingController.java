package com.aayusha.etravel.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aayusha.etravel.entity.AccommodationBookingDetail;
import com.aayusha.etravel.entity.PaymentModel;
import com.aayusha.etravel.entity.UserDetail;
import com.aayusha.etravel.service.AccommodationBookingService;
import com.aayusha.etravel.service.AccommodationService;
import com.aayusha.etravel.service.EsewaSecretGenerator;
import com.aayusha.etravel.service.UserDetailService;

@Controller
public class BookingController {

	

	@Autowired
	private UserDetailService userDetailService;
	
	@Autowired
	private AccommodationService accommodationService;
	
	@Autowired
	private AccommodationBookingService bookingService;
	
	@Autowired
	private EsewaSecretGenerator secretGenerator;
	
	
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
	
	@GetMapping("/user/booking/e-pay/{id}")
	public String bookingPayment(Model model, @PathVariable int id) {
		AccommodationBookingDetail bookingDetail = bookingService.getBookingById(id);
		double amount = 0;
		double acc_rate = bookingDetail.getAccommodation().getPrice();
		int duration = 
				bookingDetail.getCheckOut().getDayOfYear()-bookingDetail.getCheckIn().getDayOfYear();
		// System.out.println(duration);
		
		amount = duration * acc_rate;
		PaymentModel paymentModel = new PaymentModel();
		paymentModel.setAmount(amount);
		paymentModel.setPsc(0);
		paymentModel.setPdc(0);
		paymentModel.setTaxAmount((amount+0+0)*0.1);
		paymentModel.setTotalAmount((amount+0+0)*1.1);
		paymentModel.setProductCode("EPAYTEST");
		paymentModel.setTransaction_uuid("ETRVL_"+UUID.randomUUID());
		paymentModel.setSignedFiledNames("total_amount,transaction_uuid,product_code");
		String message = "total_amount="+paymentModel.getTotalAmount()
							+",transaction_uuid="+paymentModel.getTransaction_uuid()
							+",product_code="+paymentModel.getProductCode();
		paymentModel.setSignature(secretGenerator.generateSignature("8gBm/:&EnhH.1/q", message));
		paymentModel.setSuccess_url("http://localhost:9090/user/epay/success?booking="+id);
		paymentModel.setFailure_url("http://localhost:9090/user/epay/failure?booking="+id);
		model.addAttribute("payment", paymentModel);
		
		return "esewa_payment";
	}
	
	@GetMapping("/user/epay/success?booking=19")
	public String paymentSuceess(@RequestParam("booking") int id, Model model) {
		AccommodationBookingDetail bookingDetail = 
							bookingService.getBookingById(id);
		bookingDetail.setStatus("Paid via eSewa");
		bookingService.updateAccommodationBookingDetail(bookingDetail);
		
		model.addAttribute(bookingDetail);
		return "booking_success";
	}
	
	
	@GetMapping("/admin/booking/add")
	public String addBooking(Model model) {
		model.addAttribute("accommodation_list", 
							accommodationService.getAccommodationByStatus("AVAILABLE"));
		return "admin/booking";
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
		return "admin/booking";
	}
	
	
}
