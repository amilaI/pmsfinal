package com.tela.pms.Test;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tela.pms.dao.impl.PatientDAOImpl;
import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;
import com.tela.pms.service.PatientService;
import com.tela.pms.service.PrescriptionService;

public class HibernateTester {

	public static void main(String[] args) {
		
		/*Patient sac = new Patient();
		sac.setPatient_Age(23);
		sac.setPatient_Name("Sac");
		sac.setPatient_Address("SGTY NY");*/
		
		
		System.out.println("load context");
		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
		
		//PatientService patientService = (PatientService) context.getBean("patientService");
		//patientService.persistPatient(sac);
		
		//Patient pa =patientService.findPatientById(123);
		//System.out.println(pa.getPatient_Name());
		
		/*Prescription  prescription = new Prescription();
		
		
		prescription.setPrescription_Id(123);
		prescription.setPrescription_problem("Headache");
		prescription.setPrescription_medicine("Panadol");
		prescription.setPatientAge("21");*/
		
		
		PrescriptionService prescriptionService = (PrescriptionService) context.getBean("prescriptionService");
		//prescriptionService.persistPatient(prescription);
		
		//List<Prescription> pres = prescriptionService.retrieveAllPrescriptionsByPatientId(2184);
		//System.out.println(pres.size());
		
		/*Prescription prescription =prescriptionService.findPatientById(12920);
		byte[] pres = prescription.getPrescription_file();
				
		
		try {
			FileOutputStream fileOuputStream = 
			        new FileOutputStream("/home/amila/testFiles/test1.png"); 
			fileOuputStream.write(pres);
			fileOuputStream.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	    
		context.close();
		
		
		
		
	}
}
