package com.aayusha.etravel.service;

import java.util.List;

import com.aayusha.etravel.entity.UserDetail;

public interface UserDetailService {

	
	public void saveUserDetail(UserDetail userDetail);
	
	public List<UserDetail> getAllUsers();
	
	public UserDetail getUserById(int id);
	
	public UserDetail getUserByUsername(String username);
	
	public UserDetail getUserByEmail(String email);
	
	public void updateUserDetail(UserDetail userDetail);
	
	public void deleteUserDetail(UserDetail userDetail);
}
