package com.aayusha.etravel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class ETravelApplication {

	public static void main(String[] args) {
		SpringApplication.run(ETravelApplication.class, args);
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(passwordEncoder.encode("admin123"));
		return passwordEncoder;
	}
	
	
}
