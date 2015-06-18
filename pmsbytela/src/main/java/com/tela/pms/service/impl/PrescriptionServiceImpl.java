package com.tela.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tela.pms.dao.PrescriptionDAO;
import com.tela.pms.domain.Prescription;
import com.tela.pms.service.PrescriptionService;

@Service("prescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService{

	@Autowired
	PrescriptionDAO prescriptionDAO;

	@Override
	public void persistPatient(Prescription prescription) {
		prescriptionDAO.persistPrescription(prescription);
		
	}

	@Override
	public Prescription findPatientById(int id) {
		return prescriptionDAO.findPrescriptionById(id);
	}

	@Override
	public void updatePatient(Prescription prescription) {
		prescriptionDAO.updatePrescription(prescription);
		
	}

	@Override
	public void deletePrescription(Prescription prescription) {
		prescriptionDAO.deletePrescription(prescription);
	}

	@Override
	public List<Prescription> retrieveAllPrescriptions() {
		return prescriptionDAO.retrieveAllPrescriptions();
	}

	@Override
	public List<Prescription> retrieveAllPrescriptionsByPatientId(int id) {
		return prescriptionDAO.retrieveAllPrescriptionsByPatientId(id);
	}


}
