package com.aayusha.etravel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayusha.etravel.dao.UserDetailRepository;
import com.aayusha.etravel.entity.UserDetail;

@Service
public class UseerDetailServiceImpl implements UserDetailService{
	
	@Autowired
	UserDetailRepository userDetailRepository;

	@Override
	public void saveUserDetail(UserDetail userDetail) {
		userDetailRepository.save(userDetail);
	}

	@Override
	public List<UserDetail> getAllUsers() {
		
		return userDetailRepository.findAll();
	}

	@Override
	public UserDetail getUserById(int id) {
		
		return userDetailRepository.findById(id).get();
	}

	@Override
	public UserDetail getUserByUsername(String username) {
		
		return userDetailRepository.findByUsername(username);
	}

	@Override
	public UserDetail getUserByEmail(String email) {
		
		return userDetailRepository.findByEmail(email);
	}

	@Override
	public void updateUserDetail(UserDetail userDetail) {
		userDetailRepository.save(userDetail);
	}

	@Override
	public void deleteUserDetail(UserDetail userDetail) {
		userDetailRepository.delete(userDetail);
	}

}
