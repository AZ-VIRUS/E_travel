package com.aayusha.etravel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aayusha.etravel.entity.Membership;
import com.aayusha.etravel.service.MembershipService;


@Controller
public class MembershipController {
	
	@Autowired
	private MembershipService membershipService;
	
	@GetMapping({"admin/membership/add", "admin/membership/show"})
	public String addMembership(Model model) {
		List<Membership> membershipList = membershipService.getAllMembership();
		model.addAttribute("membership_list", membershipList);
		return "admin/membership";
	}
	
	@PostMapping("admin/membership/add")
	public String addMembership(@ModelAttribute Membership membership) {
		membershipService.saveMembership(membership);
		return "redirect:/admin/membership/add?action=added";
	}
	
	@GetMapping("admin/membership/edit/{id}")
	public String editMembership(Model model, @PathVariable int id) {
		model.addAttribute("membership", membershipService.getMembershipById(id));
		model.addAttribute("edit", true);
		model.addAttribute("membership_list", membershipService.getAllMembership());
		return "admin/membership";
	}
	
	@PostMapping("admin/membership/edit")
	public String updateMembership(@ModelAttribute Membership membership) {
		membershipService.updateMembership(membership);
		return "redirect:/admin/membership/show#data_table";
	}
	
	@GetMapping("admin/membership/delete/{id}")
	public String deleteMembership(@PathVariable int id) {
		Membership membership = membershipService.getMembershipById(id);
		if(membership != null && membership.getId() != 0) {
			membershipService.deleteMembership(membership);
			return "redirect:/admin/membership/show#data_table?delete=success";
		}
		return "redirect:/admin/membership/show#data_table?delete=failure";
	}
	
}
