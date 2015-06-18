<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/logo1.png">

    <title>Patient Managment System</title>

  <link href="resources/new_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/new_files/starter-template.css" rel="stylesheet">


     <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

    <script src="resources/tags/bootstrap-tagsinput.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/tags/bootstrap-tagsinput.css">
<link  rel="stylesheet" type="text/css" href="resources/css/pms-common.css">
    <style type="text/css">

	#footer {
			  position: relative;
			  bottom: 0;
			  width: 100%;
			  /* Set the fixed height of the footer here */
			  height: 50px;
			  background-color: #101010;
			  padding-top: 10px;
			}
        .btn-file {
    position: relative;
    overflow: hidden;
	}

	.label-info {
    background-color:rgba(72, 100, 255, 1);
    font-size: 14px;
    }
    .boxLabel{
    
    border: 1px solid #EDE4E4;
    padding: 10px;
    margin: 10px;
    border-radius: 10px;
    }
    </style>  
   
  </head>

  <body  style="background-color: rgba(252, 254, 249, 1);">

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand homeBtn" href="#"  style="font-weight: bold;color:#1abc9c">Patient Managment System</a>
        </div>
        <div style="height: 1px;" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right">           
            <li><a href="#" id="backPatient"  style="font-weight: bold;color:#1abc9c">Back</a></li>           
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container" style="margin-top:20px">
     
		 <div  class="row">    
          <div class="col-lg-12 col-md-12">
            <h1 style="font-weight:bold;color:#2c3e50"> <span class="label label-info" style="margin-left:5px;background-color:#2c3e50;padding: 10px;font-size: 28px;">Prescription Details</span> <span class="label label-info" style="font-size: 20px;margin-top:1px;background-color: #16a085">${prescription.prescription_Id}</span><span class="label label-info" style=" background-color:#1abc9c; font-size: 20px;margin-top:1px;margin-left: 10px"> ${prescription.patientAge} yrs </span>
             <span class="label label-info" style="font-size: 20px;margin-top:1px;background-color:#2ecc71;margin-left: 10px">Created on : ${prescription.createdAt}</span>   
            </h1>
          </div>  
            
      </div>
      
      <div  class="row">  
      <div class="col-lg-12 col-md-12">  
			      		<div class="form-group" style="margin-top: 30px">
			                
			                <div class="col-md-6">
			                <div class="boxLabel">
			                <h4>Problem/Ailment: </h4>
			                <h3>   ${prescription.prescription_problem}</h3>
			                </div>
			                </div>
			               
			                <div class="col-md-6">
			                
			                <div class="boxLabel">
			                <h4>Recommended Medicine/Treatment:  </h4>
			                <h3>  ${prescription.prescription_medicine}</h3>
			                </div>
			                
			                </div>
		              </div>
		              
		              <br>
		              
		              <div class="form-group">
			                
			                <div class="col-md-6">
			                  <div class="boxLabel">
				                <h4>Special Notes: </h4>
				                <h3>   ${prescription.prescription_notes}</h3>
				              </div>
			                </div>
			               
			                <div class="col-md-6">
			                		<div class="boxLabel">
			                		<h4>Medical Tags:  </h4>
			                 		
			                 		<div style="margin: 20px"> 
			                  		<c:forEach items= "${prescription.getPrescription_tags()}" var="tag">                               								
                                    	<span class="label label-success" style="background-color:#f39c12;font-size: 20px;margin:5px">${tag}</span>
                                    </c:forEach>
                                    </div>
			                  		</div>
			                </div>
		              </div>
		              
		              <div class="form-group">
			                
			                <div class="col-md-12">
			                		<div class="boxLabel">
			                		<h3>Doctor's Prescription: </h3>	
			                		
			                		<c:forEach items= "${imagesArray}" var="image">   
					                <div align="center" style="margin:40px;"> 
						               <img src= "${image}" class="img-responsive" alt="Couldn't load the Prescription" >
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

    <form  id="loadHomePageFrm" action="loadHomePage" method="POST" >	
	</form>
<form  id="getPatientForm" action="getPatient" method="POST" >
	<input type="hidden" name="patientId" value="${prescription.patient_Id}"/>
</form>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="resources/new_files/jquery.js"></script>
    <script src="resources/new_files/bootstrap.js"></script>
    <script type="text/javascript">
       $(document).ready(function() {
         $('#canclBtn').click(function() {
          alert("sda");
    

          });
         $('.homeBtn' ).click(function() {
       	  
       	  $('#loadHomePageFrm').submit();
         });
         $('#backPatient' ).click(function() {          	  
        	 $('#getPatientForm').submit();
            });
       $('#editBtn' ).click(function() {
            $(".tdBody").html(" ");
            $( ".tdBody" ).append( "<input type=\"text\"/>" );
            $('#editBtn').hide();
            $('#bottomDetails').append(" <button class=\"metro image-button small\" id=\"saveBtn\">Save</button>  <button class=\"metro image-button small\" id=\"canclBtn\">Cancel</button>");
    

          });
        $('#editIcon' ).click(function() {
              alert("Edit funtionality still under construction!");
          });
              
/*$('#cancelBtn').click(alert();

function() { location.reload(); }
  );
*/
     });
    

    
   </script>

</body></html>