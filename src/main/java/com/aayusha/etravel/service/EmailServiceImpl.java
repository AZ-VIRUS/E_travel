package com.aayusha.etravel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Value("${spring.mail.username}") 
	private String sender;


	@Override
	public void sendEmail(String to,  String subject, String message) {
		
		SimpleMailMessage mail =  new SimpleMailMessage();
		mail.setTo(to);
		mail.setFrom(sender);
		mail.setSubject(subject);
		mail.setText(message);
		mailSender.send(mail);
		System.out.println("Mail message send to "+ to);
	}

	
}
