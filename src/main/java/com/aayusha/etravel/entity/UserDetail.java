package com.aayusha.etravel.entity;

import java.io.Serializable;
import java.time.LocalDate;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "user_detail_table")
public class UserDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int id;

    private String firstname;
    private String lastname;
    private String address;
    private String gender;

    @Column(unique = true)
    private String email;

    @Column(unique = true)
    private String phoneNo;

    private LocalDate dob;

    @Column(unique = true)
    private String username;

    private String password;

    @Transient
    private String confirmPassword;

    private String active;

    @Transient
    private String authority;

    @OneToOne(mappedBy = "userDetail", cascade = CascadeType.PERSIST)
    private UserRole userRole;

    // Many-to-Many relationship with activities
   
    // Constructors
    public UserDetail() {
        super();
    }

    public UserDetail(int id, String firstname, String lastname, String address, String gender, String email,
            String phoneNo, LocalDate dob, String username, String password, String confirmPassword,
            String active, String authority, UserRole userRole) {
        super();
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.gender = gender;
        this.email = email;
        this.phoneNo = phoneNo;
        this.dob = dob;
        this.username = username;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.active = active;
        this.authority = authority;
        this.userRole = userRole;
          }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

   
}
