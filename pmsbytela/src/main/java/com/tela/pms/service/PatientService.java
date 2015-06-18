package com.tela.pms.service;

import java.util.List;

import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;

public interface PatientService {

	void persistPatient(Patient employee);

	Patient findPatientById(int id);

	void updatePatient(Patient employee);

	void deletePatient(Patient employee);
	
	List<Patient> retrieveAllPatients();
	
	
}
