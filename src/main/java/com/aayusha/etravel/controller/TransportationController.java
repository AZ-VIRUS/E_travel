package com.aayusha.etravel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aayusha.etravel.entity.Transportation;
import com.aayusha.etravel.service.TransportationService;


@Controller
public class TransportationController {
	
	@Autowired
	private TransportationService transportationService;
	
	@GetMapping("admin/transportation/add")
	public String transportation() {
		return "admin/transportation";
	}
	
	@GetMapping("admin/transportation/show")
	public String showTransportation(Model model) {
		List<Transportation> transportations = transportationService.getAllTransportation();
		model.addAttribute("transportation_list", transportations);
		return "admin/transportation";
	}
	
	@PostMapping("admin/transportation/add")
	public String addTransportation(@ModelAttribute Transportation transportation) {
		transportationService.saveTransportation(transportation);
		return "redirect:/admin/transportation/add?action=added";
	}
	
	@GetMapping("admin/transportation/edit/{id}")
	public String editTransportation(Model model, @PathVariable int id) {
		model.addAttribute("transportation", transportationService.getTransportationById(id));
		model.addAttribute("edit", true);
		model.addAttribute("transportation_list", transportationService.getAllTransportation());
		return "admin/transportation";
	}
	
	@PostMapping("admin/transportation/edit")
	public String updateTransportation(@ModelAttribute Transportation transportation) {
		transportationService.updateTransportation(transportation);
		return "redirect:/admin/transportation/show#data_table";
	}
	
	@GetMapping("admin/transportation/delete/{id}")
	public String deleteTransportaion(@PathVariable int id) {
		Transportation transportation = transportationService.getTransportationById(id);
		if(transportation != null && transportation.getId() != 0) {
			transportationService.deleteTransportation(transportation);
			return "redirect:/admin/transportation/show#data_table?delete=success";
		}
		return "redirect:/admin/transportation/show#data_table?delete=failure";
	}
	
}
