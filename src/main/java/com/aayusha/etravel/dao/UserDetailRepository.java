package com.aayusha.etravel.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aayusha.etravel.entity.UserDetail;
import com.aayusha.etravel.entity.UserRole;

public interface UserDetailRepository extends JpaRepository<UserDetail, Integer>{
	
	
	public UserDetail findByUsername(String username);
	
	public UserDetail findByEmail(String email);
	
	public List<UserDetail> findByUserRole(UserRole userRole);
	
	

}
