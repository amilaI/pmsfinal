package com.tela.pms;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;
import com.tela.pms.service.PatientService;
import com.tela.pms.service.PrescriptionService;


/**
 * @author Yolo DevCenter
 * Developer Amila Iddamalgoda -- 2014-06-18 version 1.0 
 * Patient Controller
 * © 2014 all rights recieved @ Yolo dev center
 * PMS by Yolo-DevCenter is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 */
@Controller
@RequestMapping("/")
public class PatientController {
	
	private List<Patient> patientList;
	
	@Autowired
	public PatientService patientService; 
	
	@Autowired
	public PrescriptionService prescriptionService;
	
	private static final Logger logger = LoggerFactory.getLogger(PatientController.class);
	
	@ExceptionHandler(Exception.class)
	public ModelAndView exceptionFramework(Exception e) {
		 ModelAndView modelAndView = new ModelAndView("error");
		 final StringWriter sw = new StringWriter();
	     final PrintWriter pw = new PrintWriter(sw, true);
	     e.printStackTrace(pw);
	     logger.error("error "+  sw.getBuffer().toString() + e);
		 //modelAndView.addObject("exception", e +  "  " + sw.getBuffer().toString());
		
		return modelAndView;
	}
	/**
	 * loadApplicationHome will initially load the application home for logged in users 
	 */
	@RequestMapping(value = "/findIndividual", method = RequestMethod.POST)
	public String loadApplicationHome(HttpServletRequest request , HttpServletResponse response,Model model) {
		
		String userName = request.getParameter("inputUserName");
		String password = request.getParameter("inputPassword");
				    
		String view ="login";		
		
		if(userName.equals("manoj") && password.equals("123")){
			logger.info("Successful Login at " + new Date()  +"  "+ userName + "  " + password );
			patientList = new ArrayList<Patient>();
			patientList = patientService.retrieveAllPatients();
			model.addAttribute("patientList", patientList);			
			view = "home";
			
		}else {
			logger.error("Invalid Login at " + new Date()  +"  "+ userName + "  " + password );
			model.addAttribute("loginError", "<strong>Oh snap!</strong> Invalid UserName or Password!");
			model.addAttribute("style", "style=\"display:block\"");
		}
		
		return view;
	}
	
	
	/**
	 * loadHomePage will also provide facility to load the application home for logged in users.
	 */
	@RequestMapping(value = "/loadHomePage", method = RequestMethod.POST)
	public String loadHomePage(Model model) {
		patientList = patientService.retrieveAllPatients();
		model.addAttribute("patientList", patientList);
		return "home";	
	}
	
	
	/**
	 * retrieveIndividualPatient will direct to an individual patient info page
	 */
	@RequestMapping(value = "/getPatient", method = RequestMethod.POST)
	public String retrieveIndividualPatient(HttpServletRequest request , HttpServletResponse response,Model model) {
		
		String patientId = request.getParameter("patientId");
		String view ="patient";
		
		Patient patient = patientService.findPatientById(new Integer(patientId));
		model.addAttribute("patient", patient);	
		
		List<Prescription> prescriptions = prescriptionService.retrieveAllPrescriptionsByPatientId(new Integer(patientId));
		model.addAttribute("prescriptions", prescriptions);	
		logger.info("Prescription list " +prescriptions+" retrieved @ " + new Date());
		logger.info("Patient " +patientId+" retrieved @ " + new Date());
		model.addAttribute("style", "style=\"display:none;margin-top: 5px;\"");		
		return view;
	}
	
	
	/**
	 * createPatient will create a new patient and save in the cloud db
	 */
	@RequestMapping(value = "/createPatient", method = RequestMethod.POST)
	public String createPatient(HttpServletRequest request , HttpServletResponse response,Model model,@RequestParam("file") MultipartFile file) {
		String view ="patient";
		
		//Creating a new patient object
		String firstName = request.getParameter("fName");
		String lastName = request.getParameter("lName");
		String age = request.getParameter("age");
		String nic = request.getParameter("nic");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String contactNo = request.getParameter("contactNo");
		String email = request.getParameter("email");
		String formatedString = request.getParameter("tags");	
		String tags  = formatedString.toString()
                .replace("[", "")   //remove the right bracket
                .replace("]", "");
		String patientName = firstName + " "  + lastName;
		
		
		
		//Validating Empty fields
		if(nic.equals("") ||nic == null){
			nic= "Not Available";
		}
		if(address.equals("") ||address == null){
			address= "Not Available";
		}
		if(contactNo.equals("") ||contactNo == null){
			contactNo= "Not Available";
		}
		if(email.equals("") ||email == null){
			email= "Not@Available";
		}
		if(tags.equals("") ||tags == null){
			tags= "Not Available";
		}
		
		
		//Generating an unique id
		 int id =1001;
		 List<Patient> pasList = patientService.retrieveAllPatients();
		 
		 
		 if (pasList != null) {
		 
		 if(pasList.size() > 1){
			 
			 Collections.sort(pasList, new Comparator<Patient>() {
				    @Override
				    public int compare(Patient p1, Patient p2) {
				        if (p1.getPatient_Id() > p1.getPatient_Id())
				            return 1;
				        if (p1.getPatient_Id() < p2.getPatient_Id())
				            return -1;
				        return 0;
				    }
				});
			
			 id = pasList.get(pasList.size() - 1).getPatient_Id() + 1;
		 } else if (pasList.size() == 1) {
			
			 id = pasList.get(0).getPatient_Id() + 1;
		
		 }else {
			 
			 id = 1001;		
		}
		 
		 }else{
			
			 id = 78* new Date().getDay() * new Date().getSeconds();	
		
		 }
		 
		//Creating DateTime
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd  hh:mm  a",Locale.US);
		String createdAt = DATE_FORMAT.format(new Date());
		
		//Retrieving uploaded files
		MultipartFile patientPhoto = file;				
		//byte[] bFile_patientPhoto = null;
		String imagePath = "N/A";
		
		String extensionFile = FilenameUtils.getExtension(patientPhoto.getOriginalFilename());
		System.out.println(extensionFile);
		boolean value = extensionFile.equals("jpeg") || extensionFile.equals("jpg")|| extensionFile.equals("JPG")|| extensionFile.equals("JPEG");
		if(patientPhoto !=null && value){
			File cloud_file = null;
			try {
				cloud_file = convertFile(patientPhoto);
			} catch (IOException e1) {
				logger.info("something went wrong in coverting the file @" + new Date());
				e1.printStackTrace();
			}
			
			/*
			try {
				//bFile_patientPhoto = new byte[(int) patientPhoto.getSize()];
				//InputStream inputStream_patientPhoto = patientPhoto.getInputStream();
				//inputStream_patientPhoto.read(bFile_patientPhoto);
				//inputStream_patientPhoto.close();				
							
			} catch (IOException e) {			
				e.printStackTrace();
			}		*/
			String extension = FilenameUtils.getExtension(patientPhoto.getOriginalFilename());
			Long fileSize= patientPhoto.getSize();
			
			if(extension.equals("JPG") || extension.equals("jpg")|| extension.equals("jpeg")|| extension.equals("JPEG")){
				    try {
				    	File catalinaBase = new File( System.getProperty( "catalina.base" ) ).getAbsoluteFile();
				    	logger.info("catalinaBase:"+catalinaBase.getAbsolutePath());
				    	
						InputStream  inputStream = patientPhoto.getInputStream();  
						String imageId = "patient-"+Integer.toString(id);
						String fileName = imageId + "."+ "jpg";
						File newFile = new File( catalinaBase, "webapps/pms/WEB-INF/views/images/Uploaded_images/Patients/"+fileName );
				    	
					   if (!newFile.exists()) {  
							newFile.createNewFile();  
					   }  
					   OutputStream  outputStream = new FileOutputStream(newFile);  
					   int read = 0;  
					   byte[] bytes = new byte[1024];  
					  
					   while ((read = inputStream.read(bytes)) != -1) {  
											outputStream.write(bytes, 0, read);  
					   }
					   imagePath = "resources/images/Uploaded_images/Patients/" + fileName;
					   logger.info("Patient image successfully uploaded to local repo @" + new Date());
					} catch (FileNotFoundException e) {
						logger.info("something went wrong when patient photo uploading @" + new Date());
						e.printStackTrace();
					} catch (IOException e) {
						logger.info("something went wrong when patient photo uploading @" + new Date());
						e.printStackTrace();
					}  
			
			}else{
				logger.info("Uploaded file is not a jpg or png " + new Date());
				if(gender.equals("Female")){
					imagePath="resources/images/patient-female.png";
				}else{
					imagePath="resources/images/patient-male.png";
				}
			}
		
		}else{
			
			if(gender.equals("Female")){
				imagePath="resources/images/patient-female.png";
			}else{
				imagePath="resources/images/patient-male.png";
			}
			
		}				
		
		Patient patient = new Patient();
		
		patient.setPatient_Id(id);
		patient.setPatient_Name(patientName);
		patient.setPatient_Age(age);
		patient.setPatient_Address(address);
		patient.setPatient_ContactNo(contactNo);
		patient.setPatient_Gender(gender);
		patient.setPatient_Email(email);
		patient.setPatient_NIC(nic);
		patient.setPatient_CreatedAt(createdAt);
		patient.setPatient_Photo(imagePath);
		patient.setPatient_tags(tags);
							
		//System.out.println(patientName+"  "+age+"   "+patientPhoto.getOriginalFilename()+"   "+nic+"   "+address+"   "+gender+"   "+contactNo+"   "+email);
		
				
		List<Patient>  palist=patientService.retrieveAllPatients();
		if(palist.size()==0){
			patientService.persistPatient(patient);	 
			logger.info("A New Patient " +id+" created @ " + new Date());	
		}else{
			if(palist  !=null && palist.size()  >0){
				boolean isNewPatient  =true;
				boolean isNotExistingPatient  =true;
				for (Patient pati : palist) {
					if(pati.getPatient_Id() == id){					
						isNewPatient=false;
						logger.info("Similar patient with same id exists.  " +id);
						view  = "error1";
					}
					if(pati.getPatient_Name().equals(patientName) && pati.getPatient_Photo().equals(imagePath) && pati.getPatient_Age().equals(age)){
						logger.info("Similar patient exists.");
						view  = "error1";
						isNotExistingPatient =false;
						isNewPatient=false;
					}
				}
				if(isNewPatient || isNotExistingPatient){
					patientService.persistPatient(patient);	 
					logger.info("A New Patient " +id+" created @ " + new Date());		
				}
			}					
		}
		
		
		
		Patient newPatient = patientService.findPatientById(id);
		model.addAttribute("patient", newPatient);	
		
		List<Prescription> prescriptions = prescriptionService.retrieveAllPrescriptionsByPatientId(id);
		model.addAttribute("prescriptions", prescriptions);	
		
		logger.info("New Patient " +id+" retrieved @ " + new Date());
		logger.info("Prescription list " +prescriptions+" retrieved @ " + new Date());
		model.addAttribute("status", "<strong>Great !</strong> A New Patient created successfully");
		model.addAttribute("style", "style=\"display:block;margin-top: 5px;\"");		
		return view;
	}
	
	public File convertFile(MultipartFile file) throws IOException
	{    
	    File convFile = new File(file.getOriginalFilename());
	    convFile.createNewFile(); 
	    FileOutputStream fos = new FileOutputStream(convFile); 
	    fos.write(file.getBytes());
	    fos.close(); 
	    return convFile;
	}
	/**
	 * loadEditPage will load the edit page
	 */
	@RequestMapping(value = "/loadEditPage", method = RequestMethod.POST)
	public String loadEditUserHome(HttpServletRequest request,Model model) {
		String patientId = request.getParameter("id");
		int id = Integer.parseInt(patientId);
		System.out.println(id);
		
		Patient patient = patientService.findPatientById(id);
		model.addAttribute("patient", patient);	
		
		String tags  = patient.getPatient_tags().toString()
                 //remove the commas
                .replace("[", "")   //remove the right bracket
                .replace("]", "");
		System.out.println("hgsadhkdhassdhkaj "+tags);
				
		logger.info("Patient " +patient.getPatient_tags()+" retrieved @ " + new Date());
		model.addAttribute("patientId", patientId);
		model.addAttribute("tags", tags);
		return "edit";	
	}
	
	
	/**
	 * createPatient will edit a new patient and update in the cloud db
	 */
	@RequestMapping(value = "/editPatient", method = RequestMethod.POST)
	public String editPatient(HttpServletRequest request , HttpServletResponse response,Model model,@RequestParam("file") MultipartFile file) {
		
		//Retrieving requests
		String patientId = request.getParameter("id");
		System.out.println(patientId);
		int id = Integer.parseInt(patientId);
		
		String patientName = request.getParameter("patientName");		
		String age = request.getParameter("age");
		String nic = request.getParameter("nic");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String contactNo = request.getParameter("contactNo");
		String email = request.getParameter("email");
		String tags = request.getParameter("tags");				
		String createdAt = request.getParameter("patient_CreatedAt");	
		String imagePath = request.getParameter("patient_Photo");
		String existingimagePath = request.getParameter("existingimagePath");
		System.out.println("**** img path "+ imagePath);
		
		if(nic.equals("") ||nic == null){
			nic= "Not Available";
		}
		if(address.equals("") ||address == null){
			address= "Not Available";
		}
		if(contactNo.equals("") ||contactNo == null){
			contactNo= "Not Available";
		}
		if(email.equals("") ||email == null){
			email= "Not@Available";
		}
		if(tags.equals("") ||tags == null){
			tags= "Not Available";
		}
		
		//Creating a new patient
		Patient patient = new Patient();					
				
		//Retrieving uploaded files
		MultipartFile patientPhoto = file;						 
		
		if(patientPhoto.getSize() !=0 && patientPhoto.getOriginalFilename()  != null){			
			File cloud_file = null;
			try {
				cloud_file = convertFile(patientPhoto);
			} catch (IOException e1) {
				logger.info("something went wrong in coverting the file @" + new Date());
				e1.printStackTrace();
			}
			String extension = FilenameUtils.getExtension(patientPhoto.getOriginalFilename());
			Long fileSize= patientPhoto.getSize();
			
			if(extension.equals("JPG") || extension.equals("jpg")|| extension.equals("jpeg")|| extension.equals("JPEG")){			
				try {
					
					File catalinaBase = new File( System.getProperty( "catalina.base" ) ).getAbsoluteFile();
			    	logger.info("catalinaBase:"+catalinaBase.getAbsolutePath());
			    	
					InputStream  inputStream = patientPhoto.getInputStream();  
					String imageId = "patient-"+Integer.toString(id);
					String fileName = imageId + ".jpg";
				  
					File newFile = new File( catalinaBase, "webapps/pms/WEB-INF/views/images/Uploaded_images/Patients/"+fileName );
			    	
					
					if (!newFile.exists()) {  
										newFile.createNewFile();  
				   }  
				   OutputStream  outputStream = new FileOutputStream(newFile);  
				   int read = 0;  
				   byte[] bytes = new byte[1024];  
				  
				   while ((read = inputStream.read(bytes)) != -1) {  
										outputStream.write(bytes, 0, read);  
				   }
				   imagePath = "resources/images/Uploaded_images/Patients/" + fileName;
				   
				   logger.info("Patient image successfully uploaded to local repo @" + new Date());
				} catch (FileNotFoundException e) {
					logger.info("something went wrong when patient photo uploading @" + new Date());
					e.printStackTrace();
				} catch (IOException e) {
					logger.info("something went wrong when patient photo uploading @" + new Date());
					e.printStackTrace();
				}  
			
			
			}else{
				logger.info("Uploaded file is not a jpg or png " + new Date());
				if(gender.equals("Female")){
					imagePath="resources/images/patient-female.png";
				}else{
					imagePath="resources/images/patient-male.png";
				}
			}
		
		}else{
			
			if(existingimagePath.contains("patient-male")  || existingimagePath.contains("patient-female")){
				if(gender.equals("Female")){
					imagePath="resources/images/patient-female.png";
				}else{
					imagePath="resources/images/patient-male.png";
				}
			
			}
		}				
		
		//Updating patient info
		patient.setPatient_Id(id);
		patient.setPatient_Name(patientName);
		patient.setPatient_Age(age);
		patient.setPatient_Address(address);
		patient.setPatient_ContactNo(contactNo);
		patient.setPatient_Gender(gender);
		patient.setPatient_Email(email);
		patient.setPatient_NIC(nic);
		patient.setPatient_Photo(imagePath);
		patient.setPatient_CreatedAt(createdAt);		
		patient.setPatient_tags(tags);
		
		//Calling patient service and updating patient
		patientService.updatePatient(patient);
				
		//System.out.println(patientName+"  "+age+"   "+patientPhoto.getOriginalFilename()+"   "+nic+"   "+address+"   "+gender+"   "+contactNo+"   "+email);
				
		String view ="patient";
		
		Patient editedPatient = patientService.findPatientById(id);
		model.addAttribute("patient", editedPatient);	
		
		List<Prescription> prescriptions = prescriptionService.retrieveAllPrescriptionsByPatientId(id);
		model.addAttribute("prescriptions", prescriptions);	
		
		logger.info("Edited Patient " +id+" retrieved @ " + new Date());
		logger.info("Prescription list " +prescriptions+" retrieved @ " + new Date());
		model.addAttribute("status", "<strong>Successfully </strong> updated the patient! ");
		model.addAttribute("style", "style=\"display:block;margin-top: 5px;\"");	
		return view;
	}
	
	
	/**
	 * loadHomePage will also provide facility to load the application home for logged in users.
	 */
	@RequestMapping(value = "/deletePatient", method = RequestMethod.POST)
	public String deletePatient(Model model,HttpServletRequest request ) {
		
		String patientId = request.getParameter("patientId");
		String patientPhoto = request.getParameter("patientPhoto");
		int id = Integer.parseInt(patientId);
		
		String realName = "patient-"+patientId;
		if(patientPhoto.contains(realName)){
			logger.info("Patient to be deleted has a photo in cloudinary " +id);
		
			String fileName = patientPhoto + ".jpg";
			File catalinaBase = new File( System.getProperty( "catalina.base" ) ).getAbsoluteFile();
	    	logger.info("catalinaBase:"+catalinaBase.getAbsolutePath());
	    	
	    	File newFile = new File( catalinaBase, "webapps/pms/WEB-INF/views/images/Uploaded_images/Patients/"+fileName );
	    	newFile.setWritable(true); 
	    	newFile.delete();
				
			
			
			/*    try {
					FileOutputStream to;  
					String file = "/home/amila/patient/" + fileName;
					to = new FileOutputStream(file );
					to.write(new String("blah blah").getBytes());
					to.flush();
					to.close();
					File f = new File(file);
					System.out.print(f.delete());
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
		}
		Patient patient =new Patient();
		patient.setPatient_Id(id);
		patientService.deletePatient(patient);
		
		logger.info("Patient " +id+" deleted @ " + new Date());
		
		
		/*deleting prescription for deleted user*/
        
        
        List<Prescription> prescriptionList_todelete = prescriptionService.retrieveAllPrescriptionsByPatientId(id);
        
        for (Prescription prescription : prescriptionList_todelete) {
                
                prescriptionService.deletePrescription(prescription);
        }
			
		patientList = patientService.retrieveAllPatients();
		model.addAttribute("patientList", patientList);
		return "home";	
	}

}
