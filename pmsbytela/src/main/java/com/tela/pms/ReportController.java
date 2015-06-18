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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tela.pms.domain.FileUploadForm;
import com.tela.pms.domain.Patient;
import com.tela.pms.domain.Prescription;
import com.tela.pms.service.PatientService;
import com.tela.pms.service.PrescriptionService;

@Controller
@RequestMapping("/")
public class ReportController {

	@Autowired
	public PrescriptionService prescriptionService;

	@Autowired
	public PatientService patientService;

	private static final Logger logger = LoggerFactory
			.getLogger(PatientController.class);

	@ExceptionHandler(Exception.class)
	public ModelAndView exceptionFramework(Exception e) {
		ModelAndView modelAndView = new ModelAndView("error");
		final StringWriter sw = new StringWriter();
		final PrintWriter pw = new PrintWriter(sw, true);
		e.printStackTrace(pw);
		logger.error("error " + sw.getBuffer().toString() + e);
		// modelAndView.addObject("exception", e + "  " +
		// sw.getBuffer().toString());

		return modelAndView;
	}

	@RequestMapping(value = "/createPrescription", method = RequestMethod.POST)
	public String createPrescription(HttpServletRequest request,
			HttpServletResponse response, Model model,
			@ModelAttribute("uploadForm") FileUploadForm form) {

		// Creating a new medical prescription
		String patientId = request.getParameter("patientId");
		String problem = request.getParameter("ailment");
		String medicine = request.getParameter("medicine");
		String notes = request.getParameter("notes");
		String tags = request.getParameter("tags");
		String age = request.getParameter("age");

		if (notes.equals("") || notes == null) {
			notes = "Not Available";
		}
		if (tags.equals("") || tags == null) {
			tags = "Not Available";
		}

		// Date created with DateTime
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(
				"yyyy-MM-dd  hh:mm  a", Locale.US);
		String createdAt = DATE_FORMAT.format(new Date());

		

		int prescriptionId = 201;
		List<Prescription> presList = prescriptionService.retrieveAllPrescriptions();
		
		if(presList != null){

		if (presList.size() > 1) {

			Collections.sort(presList, new Comparator<Prescription>() {
				@Override
				public int compare(Prescription p1, Prescription p2) {
					if (p1.getPrescription_Id() > p2.getPrescription_Id())
						return 1;
					if (p1.getPrescription_Id() < p2.getPrescription_Id())
						return -1;
					return 0;
				}
			});

			prescriptionId = presList.get(presList.size() - 1).getPrescription_Id() + 1;
			
		}else if (presList.size() == 0) {
			
			prescriptionId = 201;
		
		 }else if (presList.size() == 1) {
			
			prescriptionId = presList.get(0).getPrescription_Id() + 1;
		
		 } 
		 
		}else {

			prescriptionId = 78 * new Date().getDay() * new Date().getSeconds();

		}

		String imagePath = "";
		// Retrieving uploaded files
		List<MultipartFile> prescriptionPhotos = form.getFiles();
		int index = 1;
		for (MultipartFile multipartFile : prescriptionPhotos) {
			
			
			if (multipartFile.getSize() !=0) {
				String individualImagePath = "";
				String extensionFile = FilenameUtils.getExtension(multipartFile
						.getOriginalFilename());
				System.out.println(extensionFile);
				boolean value = extensionFile.equals("JPG")
						|| extensionFile.equals("jpg")
						|| extensionFile.equals("jpeg")
						|| extensionFile.equals("JPEG");
				if (multipartFile.getSize() != 0 && value) {
					/*File cloud_file = null;
					try {
						cloud_file = convertFile(multipartFile);
					} catch (IOException e1) {
						logger.info("something went wrong in coverting the file @"
								+ new Date());
						e1.printStackTrace();
					}*/

					String extension = FilenameUtils.getExtension(multipartFile
							.getOriginalFilename());
					Long fileSize = multipartFile.getSize();

					if (extension.equals("JPG") || extension.equals("jpg")
							|| extension.equals("jpeg")
							|| extension.equals("JPEG")) {
						try {
							File catalinaBase = new File(
									System.getProperty("catalina.base"))
									.getAbsoluteFile();
							logger.info("catalinaBase:"
									+ catalinaBase.getAbsolutePath());

							InputStream inputStream = multipartFile
									.getInputStream();
							String imageId = "prescription-"
									+ Integer.toString(prescriptionId) + "-"
									+ index;
							String fileName = imageId + ".jpg";
							File newFile = new File(catalinaBase,
									"webapps/pms/WEB-INF/views/images/Uploaded_images/Prescriptions/"
											+ fileName);
							individualImagePath = "resources/images/Uploaded_images/Prescriptions/"
									+ fileName;

							if (!newFile.exists()) {
								newFile.createNewFile();
							}
							OutputStream outputStream = new FileOutputStream(
									newFile);
							int read = 0;
							byte[] bytes = new byte[1024];

							while ((read = inputStream.read(bytes)) != -1) {
								outputStream.write(bytes, 0, read);
							}
							logger.info("prescription image successfully uploaded to local repo @"
									+ new Date());
						} catch (FileNotFoundException e) {
							logger.info("something went wrong when prescription photo uploading @"
									+ new Date());
							e.printStackTrace();
						} catch (IOException e) {
							logger.info("something went wrong when prescription photo uploading @"
									+ new Date());
							e.printStackTrace();
						}

					} else {
						logger.info("Uploaded file is not a jpg or png "
								+ new Date());
					}

				}
				index++;
				imagePath = imagePath + individualImagePath + ",";
			}
			
		}
		
		System.out.println("****Image path &&& "  + imagePath);
		

		// Generating the prescription
		// int prescriptionId = 95* new Date().getDay() * new
		// Date().getSeconds();

		Prescription prescriptionReport = new Prescription();
		prescriptionReport.setPatient_Id(Integer.parseInt(patientId));
		prescriptionReport.setPrescription_Id(prescriptionId);
		prescriptionReport.setPrescription_problem(problem);
		prescriptionReport.setPrescription_medicine(medicine);
		prescriptionReport.setPrescription_notes(notes);
		prescriptionReport.setPrescription_tags(tags);
		prescriptionReport.setPatientAge(age);
		prescriptionReport.setCreatedAt(createdAt);
		prescriptionReport.setPrescription_file(imagePath);		

		prescriptionService.persistPatient(prescriptionReport);
		logger.info("A New Prescription " + prescriptionId + " created @ "
				+ new Date());

		String view = "patient";
		Patient newPatient = patientService.findPatientById(Integer
				.parseInt(patientId));
		model.addAttribute("patient", newPatient);
		List<Prescription> prescriptions = prescriptionService
				.retrieveAllPrescriptionsByPatientId(new Integer(patientId));
		model.addAttribute("prescriptions", prescriptions);
		logger.info("Prescription list " + prescriptions + " retrieved @ "
				+ new Date());
		/*
		 * Patient newPatient = patientService.findPatientById(id);
		 * model.addAttribute("patient", newPatient); logger.info("New Patient "
		 * +id+" retrieved @ " + new Date());
		 */
		model.addAttribute("status",
				"<strong>Great !</strong> A New Prescription created successfully");
		model.addAttribute("style", "style=\"display:block;margin-top: 5px;\"");
		return view;
	}

	public File convertFile(MultipartFile file) throws IOException {
		File convFile = new File(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}

	@RequestMapping(value = "/Report", method = RequestMethod.POST)
	public String retrieveReport(Model model, HttpServletRequest request) {
		String presId = request.getParameter("presId");

		Prescription prescription = prescriptionService.findPatientById(Integer
				.parseInt(presId));
		model.addAttribute("prescription", prescription);
		
		String imagesWithDelimeter = prescription.getPrescription_file();
		String[] images = {};
		if(!imagesWithDelimeter.isEmpty()){
			images=imagesWithDelimeter.split(",");
		}
		model.addAttribute("imagesArray", images);
		logger.info("Prescription " + presId + " retrieved @ " + new Date());
		return "report";
	}
	/**
	 * delete prescription
	 */
	@RequestMapping(value = "/deletePrescription", method = RequestMethod.POST)
	public String deletePrescription(Model model,HttpServletRequest request ) {
		
		String prescriptionId = request.getParameter("prescriptionId");
		String patientId = request.getParameter("patientId");
		int id = Integer.parseInt(prescriptionId);
		String prescriptionPhoto = request.getParameter("prescriptionPhoto");
		String realName = "prescription-"+prescriptionId;
		if(prescriptionPhoto.contains(realName)){
			logger.info("Patient to be deleted has a photo in cloudinary " +id);
		
			String fileName = prescriptionPhoto + ".jpg";
			File catalinaBase = new File( System.getProperty( "catalina.base" ) ).getAbsoluteFile();
	    	logger.info("catalinaBase:"+catalinaBase.getAbsolutePath());
	    	
	    	File newFile = new File( catalinaBase, "webapps/pms/WEB-INF/views/images/Uploaded_images/Prescriptions/"+fileName );
	    	newFile.setWritable(true); 
	    	newFile.delete();
		}
		Prescription prescription =new Prescription();
		prescription.setPrescription_Id(id);
		prescriptionService.deletePrescription(prescription);
		
		logger.info("prescription " +id+" deleted @ " + new Date());
							
		String view = "patient";
		Patient newPatient = patientService.findPatientById(Integer
				.parseInt(patientId));
		model.addAttribute("patient", newPatient);
		List<Prescription> prescriptions = prescriptionService
				.retrieveAllPrescriptionsByPatientId(new Integer(patientId));
		model.addAttribute("prescriptions", prescriptions);
		logger.info("Prescription list " + prescriptions + " retrieved @ "
				+ new Date());
		String status = "Prescription Deleted successfully";
		model.addAttribute("status",status);
		model.addAttribute("style", "style=\"display:block;margin-top: 5px;\"");
		return view;
		
	}
}
