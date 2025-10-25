package com.aayusha.etravel.service;

import java.util.List;

import com.aayusha.etravel.entity.Membership;

public interface MembershipService {
	
	public Membership saveMembership(Membership membership);
	
	public List<Membership> getAllMembership();
	
	public Membership getMembershipById(int id);
	
	public Membership getMembershipByTitle(String title);
	
	public List<Membership> getMembershipByPlan(String plan);
	
	public void updateMembership(Membership membership);
	
	public void deleteMembership(Membership membership);

}
