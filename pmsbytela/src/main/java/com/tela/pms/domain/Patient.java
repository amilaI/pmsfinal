package com.tela.pms.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "Patient")
public class Patient {

	@Id
	@Column(name = "patient_Id")
	private int patient_Id;
	
	@Column(name = "patient_Name")
	private String patient_Name;
	
	@Column(name = "patient_Age")
	private String patient_Age;
	
	@Column(name = "patient_Address")
	private String patient_Address;
	
	@Column(name = "patient_NIC")
	private String patient_NIC;
	
	@Column(name = "patient_ContactNo")
	private String patient_ContactNo;
	
	@Column(name = "patient_Email")
	private String patient_Email;
	
	@Column(name = "patient_Gender")
	private String patient_Gender;
	
	@Column(name = "patient_tags")
	private String patient_tags;
	
	@Column(name = "patient_CreatedAt")
	private String patient_CreatedAt;

	@Column(name = "patient_Photo")
	private String patient_Photo;
	
	
	
	public int getPatient_Id() {
		return patient_Id;
	}

	public void setPatient_Id(int patient_Id) {
		this.patient_Id = patient_Id;
	}

	public String getPatient_Name() {
		return patient_Name;
	}

	public void setPatient_Name(String patient_Name) {
		this.patient_Name = patient_Name;
	}

	public String getPatient_Age() {
		return patient_Age;
	}

	public void setPatient_Age(String patient_Age) {
		this.patient_Age = patient_Age;
	}

	public String getPatient_Address() {
		return patient_Address;
	}

	public void setPatient_Address(String patient_Address) {
		this.patient_Address = patient_Address;
	}

	public String getPatient_NIC() {
		return patient_NIC;
	}

	public void setPatient_NIC(String patient_NIC) {
		this.patient_NIC = patient_NIC;
	}

	public String getPatient_ContactNo() {
		return patient_ContactNo;
	}

	public void setPatient_ContactNo(String patient_ContactNo) {
		this.patient_ContactNo = patient_ContactNo;
	}

	public String getPatient_Email() {
		return patient_Email;
	}

	public void setPatient_Email(String patient_Email) {
		this.patient_Email = patient_Email;
	}

	public String getPatient_Gender() {
		return patient_Gender;
	}

	public void setPatient_Gender(String patient_Gender) {
		this.patient_Gender = patient_Gender;
	}

	public List<String> getPatient_tags() {
		List<String> tags = new ArrayList<String>();
		if(patient_tags!=null || patient_tags!=""){
			tags = new ArrayList<String>(Arrays.asList(patient_tags.split(",")));
		}
		return tags;
	}

	public void setPatient_tags(String patient_tags) {
		this.patient_tags = patient_tags;
	}

	public String getPatient_CreatedAt() {
		return patient_CreatedAt;
	}

	public void setPatient_CreatedAt(String patient_CreatedAt) {
		this.patient_CreatedAt = patient_CreatedAt;
	}

	public String getPatient_Photo() {
		return patient_Photo;
	}

	public void setPatient_Photo(String patient_Photo) {
		this.patient_Photo = patient_Photo;
	}
	
	

}
