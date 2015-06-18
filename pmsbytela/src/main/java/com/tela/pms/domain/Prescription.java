package com.tela.pms.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Prescription")
public class Prescription {
	
		@Id
		@Column(name = "prescription_Id")
		private int prescription_Id;
		
		@Column(name = "patient_Id")
		private int patient_Id;
		
		@Column(name = "problem")
		private String prescription_problem;
		
		@Column(name = "medicine")
		private String prescription_medicine;		
		
		@Column(name = "notes")
		private String prescription_notes;
		
		@Column(name = "tags")
		private String prescription_tags;
		
		@Column(name = "createdAt")
		private String createdAt;
		
		@Column(name = "patientAge")
		private String patientAge;

		@Column(name = "prescription_image")
		private String prescription_file;

		public int getPrescription_Id() {
			return prescription_Id;
		}

		public void setPrescription_Id(int prescription_Id) {
			this.prescription_Id = prescription_Id;
		}

		public int getPatient_Id() {
			return patient_Id;
		}

		public void setPatient_Id(int patient_Id) {
			this.patient_Id = patient_Id;
		}

		public String getPrescription_problem() {
			return prescription_problem;
		}

		public void setPrescription_problem(String prescription_problem) {
			this.prescription_problem = prescription_problem;
		}

		public String getPrescription_medicine() {
			return prescription_medicine;
		}

		public void setPrescription_medicine(String prescription_medicine) {
			this.prescription_medicine = prescription_medicine;
		}

		public String getPrescription_notes() {
			return prescription_notes;
		}

		public void setPrescription_notes(String prescription_notes) {
			this.prescription_notes = prescription_notes;
		}

		public List<String> getPrescription_tags() {
			List<String> tags = new ArrayList<String>();
			if(prescription_tags!=null || prescription_tags!=""){
				tags = new ArrayList<String>(Arrays.asList(prescription_tags.split(",")));
			}					
			return tags;
		}

		public void setPrescription_tags(String prescription_tags) {
			this.prescription_tags = prescription_tags;
		}

		public String getPrescription_file() {
			
			
			return prescription_file;
		}

		public void setPrescription_file(String prescription_file) {
			this.prescription_file = prescription_file;
		}

		public String getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(String createdAt) {
			this.createdAt = createdAt;
		}

		public String getPatientAge() {
			return patientAge;
		}

		public void setPatientAge(String patientAge) {
			this.patientAge = patientAge;
		}
		
		

}
