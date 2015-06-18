package com.tela.pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tela.pms.dao.PatientDAO;
import com.tela.pms.domain.Patient;
import com.tela.pms.service.PatientService;


@Service("patientService")
public class PatientServiceImpl implements PatientService{

	@Autowired
	PatientDAO patientdao;
	
	@Override
	@Transactional
	public void persistPatient(Patient patient) {
		patientdao.persistPatient(patient);
		
	}

	@Override
	@Transactional
	public Patient findPatientById(int id) {
		return patientdao.findPatientById(id);
		
	}

	@Override
	@Transactional
	public void updatePatient(Patient patient) {
		patientdao.updatePatient(patient);
		
	}

	@Override
	@Transactional
	public void deletePatient(Patient patient) {
		patientdao.deletePatient(patient);
		
	}

	@Override
	@Transactional
	public List<Patient> retrieveAllPatients() {
		return patientdao.retrieveAllPatients();
	}
}
