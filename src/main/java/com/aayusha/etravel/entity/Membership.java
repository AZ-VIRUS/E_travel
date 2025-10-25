package com.aayusha.etravel.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity @Table(name="membership_table")
public class Membership implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY) @Column(name="membership_id")
	private int id;
	
	@Column(unique=true, nullable=false)
	private String title;
	
	private String description;
	
	@Column(name="membership_plan")
	private String plan;

	public Membership() {
		super();
	}

	public Membership(int id, String title, String description, String plan) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.plan = plan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Membership [id=" + id + ", title=" + title + ", description=" + description + ", plan=" + plan + "]";
	}

}
