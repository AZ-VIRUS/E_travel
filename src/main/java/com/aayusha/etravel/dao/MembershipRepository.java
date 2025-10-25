package com.aayusha.etravel.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aayusha.etravel.entity.Membership;

@Repository
public interface MembershipRepository extends JpaRepository<Membership, Integer> {

	public Membership findByTitle(String title);
	
	public List<Membership> findByPlan(String plan);
}
