package com.tela.pms.service;

import java.util.List;

import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;

public interface PrescriptionService {
	 
	void persistPatient(Prescription prescription);
	  
	  Prescription findPatientById(int id);
	  
	  void updatePatient(Prescription prescription);
	  
	  void deletePrescription(Prescription prescription);
	  
	  List<Prescription> retrieveAllPrescriptions();
	  
	  List<Prescription> retrieveAllPrescriptionsByPatientId(int id) ;
}
