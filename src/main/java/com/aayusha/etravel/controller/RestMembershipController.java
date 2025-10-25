package com.aayusha.etravel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aayusha.etravel.entity.Membership;
import com.aayusha.etravel.service.MembershipService;

@RestController 
@RequestMapping("/api/etravel")
public class RestMembershipController {
	
	@Autowired
	private MembershipService membershipService;
	
	
	@GetMapping("/membership")
	public ResponseEntity<List<Membership>> getAllMemberships(){
		List<Membership> memberships = membershipService.getAllMembership();
		
		return new ResponseEntity<>(memberships, HttpStatus.OK);
	}
	
	@GetMapping("/membership/{id}")
	public ResponseEntity<Membership> getMembershipById(@PathVariable int id){
		Membership membership = membershipService.getMembershipById(id);
		if(membership != null && membership.getId() != 0) {
			return ResponseEntity.ok(membership);
		}
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	@PostMapping("/membership")   // save
	public ResponseEntity<Membership> addMembership(@RequestBody Membership membership){
		Membership membershipSaved = membershipService.saveMembership(membership);
		return ResponseEntity.ok(membershipSaved);
	}
	
	
	@PutMapping("/membership/{id}")  // update
	public ResponseEntity<Membership> updateMembership(@RequestBody Membership membership, @PathVariable int id){
		Membership membershipUpdate = membershipService.getMembershipById(id);
		membershipUpdate.setTitle(membership.getTitle());
		membershipUpdate.setDescription(membership.getDescription());
		membershipUpdate.setPlan(membership.getPlan());
		
		membershipService.updateMembership(membershipUpdate);
		if(membershipUpdate != null && membershipUpdate.getId() != 0) {
			return ResponseEntity.ok(membership);
		}
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	@DeleteMapping("/membership/{id}")  // delete resource
	public ResponseEntity<Object> deleteMembership(@PathVariable int id) {
		Membership membershipDelete = membershipService.getMembershipById(id);
		if(membershipDelete != null && membershipDelete.getId() != 0) {
			membershipService.deleteMembership(membershipDelete);
			return ResponseEntity.ok(membershipDelete);
		}
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
}
