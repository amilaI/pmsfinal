package com.tela.pms.dao;

import java.util.List;

import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;

public interface PrescriptionDAO {
	
	 void  persistPrescription(Prescription prescription);
	  
	 Prescription findPrescriptionById(int id);
	  
	 void updatePrescription(Prescription prescription) ;
	  
	 void deletePrescription(Prescription prescription);
	  
	 List<Prescription> retrieveAllPrescriptions() ;
	 
	 List<Prescription> retrieveAllPrescriptionsByPatientId(int id) ;
	 
}
