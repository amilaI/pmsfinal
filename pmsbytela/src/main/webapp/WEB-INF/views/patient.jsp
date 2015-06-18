<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--This web application is created by Amila Iddamalgoda .. If you have any conserns please do not hesistate to contact us (amila922@gmail.com)
All rights received 2014
-->
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="resources/images/logo1.png">

    <title>Patient Managment System</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/new_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/new_files/starter-template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/tags/bootstrap-tagsinput.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/tags/bootstrap-tagsinput.css">
    <link  rel="stylesheet" type="text/css" href="resources/css/pms-common.css">
    <script type="text/javascript">
    
	    $(document).ready(function() {
 	 	    $('.btn').tooltip();
 	 	 	$("[rel='tooltip']").tooltip();
 	 		$('#prescription-upload').click(function(){
 	 			$("#collapsible-1").toggle('slow');
 	 		})
	    });
    </script>
    <style type="text/css">     
        .tdhead{
          font-size: 16px;
        }
        .tdBody{
          font-size:16px;
          font-weight:bold
        }
        .control-label{
          text-align: left !important;
        }
        .modal-dialog {
          width: 800px;
        }
        .btn-file {
          position: relative;
          overflow: hidden;
        }
        a:hover{
    text-decoration: none;
}     
        .nav > li > a:hover{
          color: white !important;
        }
        #footer {
			  position: relative;
			  bottom: 0;
			  width: 100%;
			  /* Set the fixed height of the footer here */
			  height: 50px;
			  background-color: #101010;
			  padding-top: 10px;
			}
			.label-info {
    background-color:rgba(72, 100, 255, 1);
    font-size: 14px;
    }
    </style>
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand homeBtn" href="#"  style="color: white;font-weight: bold;color:#1abc9c">Patient Managment System</a>
        </div>
        <div style="height: 1px;" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right" >
            <li><a  style="font-weight: bold;color:#1abc9c" href="#"  data-toggle="modal" data-target="#createModal">Create Medical Report</a></li>
            <li><a style="font-weight: bold;color:#1abc9c"  href="#" class="homeBtn">Home</a></li>           
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container" style="margin-top:2px">    

      <div  class="row">    
          <div class="col-lg-8">
            <h1 style="font-weight:bold;color:#2c3e50"> <span class="label label-info" style="font-size: 20px;margin-top:1px">${patient.patient_Age} yrs</span><span class="label label-info" style="margin-left:5px;background-color:#2c3e50;padding: 10px;font-size: 28px;">${patient.patient_Name}</span>
             <span class="label label-info" style="font-size: 20px;margin-top:1px;background-color:#2ecc71">${patient.patient_Id}</span>   
            </h1>
          </div>  
          <div class="col-lg-4">
           <div class="form-group">
				    <div class="col-sm-12">
				    	<div class="alert alert-warning alert-dismissable"  ${style}>
				    	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				    	${status}
				    	</div>
				    </div>
				  </div>
          </div>   
      </div>     

      <div class="row" style="border: 2px solid rgba(245, 245, 245, 1);border-radius: 10px;background-color: rgba(251, 251, 251, 1);margin-top:3px;min-height: 495px">

          <div class="col-lg-6">
              <div class="row">
                    <div  align="center" style="padding:10px">
                      <img src="${patient.patient_Photo}"  style="border: 2px solid rgb(165, 166, 167); border-radius: 10px;width: 300px;height: 300px" class="img-responsive" alt="There was some problem loading the patient image">
                      <br>
                      <button id="editIcon" class="btn" style="border: 1px solid grey" data-toggle="tooltip" data-placement="left" title="Edit Patient" ><i  class="glyphicon glyphicon-pencil" style="font-size:16px;color:#2980b9"></i></button>
                      <button id="deleteIcon" class="btn" style="border: 1px solid grey" data-toggle="modal" rel="tooltip" data-placement="right" title="Delete Patient" data-target="#deleteModal"><i  class="glyphicon glyphicon-trash" style="font-size:16px;color:#2980b9"  ></i></button>
                      </div>
              </div>
                 
                 <div class="row">
                 <div class="col-lg-1"></div>
                      <div class="col-lg-10">
                          
                          <table class="table">                              
                              <tbody>   
                                <tr>
                                  <td class="tdhead" colspan="2">
                                  	<c:forEach items="${patient.getPatient_tags()}" var="tag">	
                                    	<span class="label label-success" style="background-color:#f39c12">${tag}</span>
                                    </c:forEach>

                                  </td>
                                                             
                                </tr>                          
                                <tr>
                                  <td class="tdhead">Address</td>
                                  <td class="tdBody">${patient.patient_Address}</td>                                  
                                </tr>
                                <tr>
                                  <td  class="tdhead">Gender</td>
                                  <td  class="tdBody">${patient.patient_Gender}</td>                                  
                                </tr>
                                <tr>
                                  <td  class="tdhead">NIC</td>
                                  <td class="tdBody">${patient.patient_NIC}</td>                                  
                                </tr>
                                <tr>
                                  <td class="tdhead">Contact No</td>
                                  <td class="tdBody">${patient.patient_ContactNo}</td>                                  
                                </tr>
                                <tr>
                                  <td class="tdhead">Email</td>
                                  <td  class="tdBody">${patient.patient_Email}</td>                                  
                                </tr>
                                <tr>
                                  <td class="tdhead">Since</td>
                                  <td  class="tdBody">${patient.patient_CreatedAt}</td>                                  
                                </tr>
                              </tbody>
                            </table>

                      </div>
                  <div class="col-lg-1"></div>
                  
                </div>
                   <div class="row">
                       <div  align="center" style="padding:10px" id="bottomDetails"> 
                        </div>

                </div>

          </div>

          <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-2">

                    </div>
                    <div class="col-lg-8">                  
                    </div>
               
                     <div class="col-lg-2">                        
                     </div>
                    
                </div>
                <div class="row">
                     <div class="col-lg-12">
                              <h2>Medical History</h2>
                               <div class="list-group">
                               			<c:forEach items= "${prescriptions}" var="prescription">
                               			
                               						<div class="list-group-item">
                               						  <i   data-toggle="modal" data-target="#deletePrescriptionModal"  data-id=${prescription.prescription_Id}  data-photo=${prescription.prescription_file} class="glyphicon glyphicon-remove delePres" style="position: relative;float: right;cursor: pointer;color: rgba(183, 187, 197, 1);"></i>	
                               						  <a href="#" class="loadReport" id= ${prescription.prescription_Id} >                               						 
					                                  <h4 class="list-group-item-heading" style="font-weight:bold;color:#34495e"><i  class="glyphicon glyphicon-calendar"></i>&nbsp;${prescription.createdAt}</h4>
					                                  <p class="list-group-item-text"  style="color:#2980b9">Prescription Summary : ${prescription.prescription_problem} ...</p>
					                                  <p class="list-group-item-text" style="color:#2980b9">Comments or Special Notes : ${prescription.prescription_notes}</p>
					                                  </a>
					                                </div>
                               			</c:forEach>                                                              
                              </div>
                    </div>
                </div>


          </div>

      </div>

  

    </div> <!-- /container -->

 <div id="footer">
	      <div class="container">
	            <!-- <p class="text-muted" style="padding:5px">Patient Managment System  Copyright ©2014</p> -->
	            <div align="center">
	            <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
	            <img alt="Creative Commons License" style="border-width:0;" src="resources/images/88x31.png"  />
	            </a>
	            <span  style="margin-left: 20px" xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">PMS</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Anonimo-DevCenter</span>
	             is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.
	     		</div>
	      </div>
	    </div>
    <!-- Bootstrap Modals
    ================================================== -->
<!-- Modal -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"   style="background-color: black;color: white;">
        <button type="button" class="close" data-dismiss="modal"style="color:white" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Create Prescription (Medical Report)</h4>
      </div>
      <div class="modal-body" style="background-color: rgba(243, 248, 230, 1);">

        <form modelAttribute="uploadForm" class="form-horizontal" role="form" action="createPrescription" method="POST" enctype="multipart/form-data"  modelAttribute="file">
        	<input type="hidden" value=${patient.patient_Id}  name="patientId" />
           <div class="form-group">
            <label for="medicine" class="col-sm-4 control-label">Patient Age</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" id="age" name="age" placeholder="Age" required>
            </div>
          </div>
          <div class="form-group">
            <label for="ailment" class="col-sm-4 control-label">Ailment/Problem</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="ailment" name="ailment" placeholder="Details should be provided" required/>
            </div>
          </div>
          <div class="form-group">
            <label for="medicine" class="col-sm-4 control-label"  required>Recommanded Medicine/Treatment</label>
            <div class="col-sm-8">

            <textarea rows="4" cols="40" class="form-control" id="medicine" name="medicine" placeholder="Details should be provided" required></textarea>
            </div>
          </div>                 
          
          <div class="form-group">
            <label for="testReport" class="col-sm-4 control-label">Special Notes</label>
            <div class="col-sm-8">

            <textarea rows="4" cols="40" class="form-control" id="notes"  name="notes" placeholder="Details should be provided."></textarea>
            </div>
          </div>
          <div class="form-group">
                <label for="inputEmail3" class="col-md-4 control-label">Tags</label>
                <div class="col-md-8">                
                <input type="text" class="form-control" id="tags" name="tags" value="" data-role="tagsinput" placeholder="Add and press Enter" />
                </div>
               
                </div>
         <div class="form-group">
            <label for="inputEmail3" class="col-md-4 control-label">Upload Prescription</label>
                <div class="col-sm-4">
                   <span class="btn btn-warning btn-file">
                  <input class="uploadPhoto" type="file" id="files[0]" name="files[0]" />                  
                  </span>
                 
                </div>
                <div class="col-md-4">
                	
                </div>
          </div> 
          <div class="form-group">
            <label for="inputEmail3" class="col-md-4 control-label"></label>
                <div class="col-sm-4">
                  	<div class="accordion" id="myAccordion">
					    <div class="panel" style="width: 300px;background-color:rgba(243, 248, 230, 1) ">
					    <button type="button" class="btn btn-primary" id="prescription-upload" >Attach more prescriptions</button>
					    <div id="collapsible-1" class="collapse">
					        		<span class="btn btn-warning btn-file" style="margin: 5px">
				                  		<input class="uploadPhoto" type="file" id="files[1]" name="files[1]" />                  
				                  	</span>
				                  	<span class="btn btn-warning btn-file"  style="margin: 5px">
				                  		<input  class="uploadPhoto" type="file" id="files[2]" name="files[2]" />                  
				                  	</span>
				                  	<span class="btn btn-warning btn-file" style="margin: 5px">
				                  		<input  class="uploadPhoto" type="file" id="files[3]" name="files[3]" />                  
				                  	</span>
					    </div>
					    </div>
					    </div>
                </div>
                <div class="col-md-6">
                	
                </div>
          </div> 
       <!--    <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-default">Save Prescription</button>
            </div>
          </div> -->
       
      </div>
      <div class="modal-footer"  style="background-color: black;color: white;margin-top: -1px;">
        <!-- <button class="metro image-button primary" data-toggle="modal" data-target="#createModal">Save</button> -->
        <button type="reset" class="btn btn-danger pull-left" style="float:right">Clear Fields</button>
        <button type="submit" class="btn btn-success" role="submit">Create Prescription</button>
         </form>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        
      </div>
    </div>
  </div>
</div>







<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title" id="myModalLabel">Delete Patient</h3>
      </div>
      <div class="modal-body">
        <h4>Are you sure you want to delete this patient?</h4>
	        <form action="deletePatient" method="POST" role="form">
	        <input type="hidden" value=${patient.patient_Id}  name="patientId" />	       	 
	       	 <input type="hidden" value=${patient.patient_Photo} name="patientPhoto" />
      </div>
      <div class="modal-footer">
      
        <button type="submit" class="btn btn-danger" >Delete Patient</button>
      </form>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="deletePrescriptionModal" tabindex="-1" role="dialog" aria-labelledby="deletePrescriptionModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title" id="myModalLabel">Delete Prescription</h3>
      </div>
      <div class="modal-body">
        <h4>Are you sure you want to delete this Prescription?</h4>
	        <form action="deletePrescription" method="POST" role="form">
	        <input type="hidden" value=${patient.patient_Id}  name="patientId" />	       	 
	       	 <input type="hidden" id="prescriptionId" name="prescriptionId" />
	       	  <input type="hidden" id="prescriptionPhoto" name="prescriptionPhoto" />
      </div>
      <div class="modal-footer">
      
        <button type="submit" class="btn btn-danger" >Delete Prescription</button>
      </form>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        
      </div>
    </div>
  </div>
</div>

<form  id="loadHomePageFrm" action="loadHomePage" method="POST" >	
</form>
<form  id="loadReportFrm" action="Report" method="POST" >	
	<input type="hidden" name="presId" id="presId"/> 
</form>
<form  id="loadEditPageFrm" action="loadEditPage" method="POST" >	
	<input type="hidden" name="id" id="id"  value="${patient.patient_Id}" /> 
</form>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="resources/new_files/jquery.js"></script>
    <script src="resources/new_files/bootstrap.js"></script>
    <script type="text/javascript">
       $(document).ready(function() {
    	   $(document).on("click", ".delePres", function () {
    		     var id = $(this).data('id');
    		     var photo = $(this).data('photo');
    		     $(".modal-body #prescriptionId").val( id );
    		     $(".modal-body #prescriptionPhoto").val( photo );
    		     // As pointed out in comments, 
    		     // it is superfluous to have to manually call the modal.
    		     // $('#addBookDialog').modal('show');
    		});
    	  
    	   $(".uploadPhoto").change(function() {

        	    var val = $(this).val();
        	    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        	        case 'jpeg': case 'jpg': case 'JPG': case 'JPEG':
        	            break;
        	        default:
        	            $(this).val('');
        	            alert("Invalid type for patient photo !!! Please try a image of type '.jpg/.jpeg'");
        	            break;
        	    }
          });
    	   
    	  
          $('#example_filter').css("background-color","red");    

          $('.homeBtn' ).click(function() {
        	  
        	  $('#loadHomePageFrm').submit();
          });
          
		  $('#editIcon' ).click(function() {
        	  
        	  $('#loadEditPageFrm').submit();
          });
          $('.loadReport' ).click(function() {
        	  $('#presId').val($(this).attr('id'));
           	  $('#loadReportFrm').submit();
          });
          $('#editBtn' ).click(function() {
            $(".tdBody").html(" ");
            $( ".tdBody" ).append( "<input type=\"text\"/>" );
            $('#editBtn').hide();
            $('#bottomDetails').append(" <button class=\"metro image-button small\" id=\"saveBtn\">Save</button>  <button class=\"metro image-button small\" id=\"canclBtn\">Cancel</button>");
    

          });
      

     });
    

    
   </script>

</body></html>