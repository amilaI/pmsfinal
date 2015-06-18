package com.tela.pms.dao.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tela.pms.PatientController;
import com.tela.pms.dao.PrescriptionDAO;
import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;

@Repository("prescriptiondao")
public class PrescriptionDAOImpl implements PrescriptionDAO{

	@Autowired
	private SessionFactory sessionFactory;

	private static final Logger logger = LoggerFactory.getLogger(PatientController.class);
	
	@Override
	@Transactional
	public void persistPrescription(Prescription prescription) {
		sessionFactory.getCurrentSession().persist(prescription);
		
	}

	@Override
	@Transactional
	public Prescription findPrescriptionById(int id) {
		return (Prescription) sessionFactory.getCurrentSession().get(Prescription.class, id);
	}

	@Override
	@Transactional
	public void updatePrescription(Prescription prescription) {
		sessionFactory.getCurrentSession().update(prescription);
		
	}

	@Override
	@Transactional
	public void deletePrescription(Prescription prescription) {
		sessionFactory.getCurrentSession().delete(prescription);
		
	}

	@Override
	@Transactional
	public List<Prescription> retrieveAllPrescriptions() {
		return sessionFactory.getCurrentSession().createCriteria(Prescription.class).list();
		 
	}

	@Override
	@Transactional
	public List<Prescription> retrieveAllPrescriptionsByPatientId(int id) {
		Session session=sessionFactory.getCurrentSession();
		
		List<Prescription> pres =session.createCriteria(Prescription.class).list()	;	
		
		//List filterList =session.createFilter(pres, "where patient_Id = :id").setInteger("id", id).list();
		
		List<Prescription> filterList = new ArrayList<Prescription>();
		
		for (Prescription prescription : pres) {
			if(prescription.getPatient_Id() == id){
				filterList.add(prescription);
			}
		}
		
		Collections.sort(filterList, new Comparator<Prescription>() {
	        @Override public int compare(Prescription p1, Prescription p2) {
	            return p2.getCreatedAt().compareTo(p1.getCreatedAt());
	        }

	    });	
		logger.info("ddsadsad"+filterList);
		
		return filterList;
	}
}
