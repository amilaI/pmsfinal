package com.tela.pms.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tela.pms.dao.PatientDAO;
import com.tela.pms.domain.Patient;

@Repository("patientdao")
public class PatientDAOImpl implements PatientDAO{

	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	@Transactional
	public void persistPatient(Patient patient) {
		sessionFactory.getCurrentSession().persist(patient);
		
	}

	@Override
	@Transactional
	public Patient findPatientById(int id) {
		return (Patient) sessionFactory.getCurrentSession().get(Patient.class, id);
	}

	@Override
	@Transactional
	public void updatePatient(Patient patient) {
		sessionFactory.getCurrentSession().update(patient);
		
	}

	@Override
	@Transactional
	public void deletePatient(Patient patient) {
		sessionFactory.getCurrentSession().delete(patient);
		
	}

	@Override
	@Transactional
	public List<Patient> retrieveAllPatients() {
		return sessionFactory.getCurrentSession().createCriteria(Patient.class).list();
		 
	}

}
