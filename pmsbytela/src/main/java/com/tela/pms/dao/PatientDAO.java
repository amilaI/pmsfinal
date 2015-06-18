package com.tela.pms.dao;

import java.util.List;

import com.tela.pms.domain.Patient;

public interface PatientDAO {

	  void persistPatient(Patient employee);
	  
	  Patient findPatientById(int id);
	  
	  void updatePatient(Patient employee);
	  
	  void deletePatient(Patient employee);
	  
	  List<Patient> retrieveAllPatients();
}
