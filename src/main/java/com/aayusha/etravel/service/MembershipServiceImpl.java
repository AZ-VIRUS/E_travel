package com.aayusha.etravel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aayusha.etravel.dao.MembershipRepository;
import com.aayusha.etravel.entity.Membership;

@Service
@Transactional
public class MembershipServiceImpl implements MembershipService {
	
	@Autowired
	private MembershipRepository membershipRepository;

	@Override
	public Membership saveMembership(Membership membership) {
		return membershipRepository.save(membership);
	}

	@Override
	public List<Membership> getAllMembership() {		
		return membershipRepository.findAll();		
	}

	@Override
	public Membership getMembershipById(int id) {	
		return membershipRepository.findById(id).orElse(new Membership());		
	}

	@Override
	public Membership getMembershipByTitle(String title) {
		return membershipRepository.findByTitle(title);	
	}

	@Override
	public List<Membership> getMembershipByPlan(String plan) {
		return membershipRepository.findByPlan(plan);	
	}

	@Override
	public void updateMembership(Membership membership) {	
		membershipRepository.save(membership);
	}

	@Override
	public void deleteMembership(Membership membership) {	
		membershipRepository.delete(membership);
	}

}
