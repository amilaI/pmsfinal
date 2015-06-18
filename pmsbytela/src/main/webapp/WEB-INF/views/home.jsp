<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		 <title>Patient Managment System</title>
	<link rel="shortcut icon" href="resources/images/logo1.png">
    <!-- Bootstrap core CSS -->
    <link href="resources/new_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/new_files/starter-template.css" rel="stylesheet">
	
		<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css">
		<link rel="stylesheet" type="text/css" href="resources/pagination/dataTables.bootstrap.css">

		<script type="text/javascript" language="javascript" src="resources/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" language="javascript" src="resources/js/jquery-2.1.1.js"></script>
		<script type="text/javascript" language="javascript" src="resources/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="resources/pagination/dataTables.bootstrap.js"></script>
		 <script src="resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				//$('#example').dataTable();
				 $('#example').dataTable( {
				        "order": [[ 0, "desc" ]]
				    } );
				 
			} );
		</script>
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
			 input[type="text"]{
			 	height: 29px;
			 }
			 .navbar-inverse .nav > li > a {
    			color: #1abc9c;
    		} 
		</style>
		<script type="text/javascript">
   	$(window).on("load resize", function() { 
   	      
   	       var footerHeight = 0,
   	           footerTop = 0,
   	           $footer = $("#footer");
   	           
   	       positionFooter();
   	       
   	       function positionFooter() {
   	       
   	                footerHeight = $footer.height();
   	            	bodyheight = $('body').height();
   	                  	       			
   	               if ( (bodyheight+footerHeight) < $(window).height()) {
   	                   $footer.css({
   	                        position: "absolute"
   	                   })
   	               } else {
   	                   $footer.css({
   	                        position: "inline"
   	                   })
   	               }
   	               
   	       }

   	       $(window)
   	               .scroll(positionFooter)
   	               .resize(positionFooter)
   	               
   	});
   	
   	</script>
   	<link  rel="stylesheet" type="text/css" href="resources/css/pms-common.css">
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

          <a class="navbar-brand" href="#"  style="font-weight: bold;color:#1abc9c"> Welcome Dr.Manoj !</a>
        </div>
        <div style="height: 1px;" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right">
            <li style="font-weight:bold"><a href="#" id="createPatient">Create Patient</a></li>
            <li style="font-weight:bold"><a href="logout">Log out</a></li> 
                 
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

		<div class="container">

	<div  class="row">
	<div class="col-lg-4">
			<div  class="row">
				<div class="col-lg-12  .col-md-12">
						
						<h3  style="color:#2c3e50">Patient Managment System</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
							<div align="center" style="padding: 20px;">
								<img src="resources/images/avatar.png" class="img-responsive" style="max-width: 80%; border: 1px solid rgb(219, 239, 223);">
							</div>
							<div>
								<table class="table" style="font-weight: bold;">
								  		<tr>
								  			<td>Dr. Madhura Manoj</td>								  			
								  		</tr>
								  		<tr>
								  			<td>MBBS (Sri Lanka)</td>
								  		</tr>
								  		<tr>
								  			<td>SLMC Reg.No 21582</td>
								  		</tr>
								  		<tr>
								  			<td>General Hospital Hambantota</td>
								  		</tr>
								</table>

							</div>
				</div>
			</div>


			

	</div>
	<div class="col-lg-8">
			 <div  style="margin-top:10px">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example"  >
	<thead>
		<tr>
			<th style="background-color:#34495e;color:white" title="Sort by Patient ID">Patient ID</th>
			<th  style="background-color:#16a085;color:white">Patient Name</th>
			<th style="background-color:#27ae60;color:white">NIC</th>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach items="${patientList}" var="patient">	
				<tr class="odd gradeX">
					<td><a  href="#" class="patAnchr" id=${patient.patient_Id}>${patient.patient_Id}</a> </td>
					<td><a href="#"  class="patAnchr" id=${patient.patient_Id}> ${patient.patient_Name} </a></td>
					<td><a href="#"  class="patAnchr" id=${patient.patient_Id}>${patient.patient_NIC} </a></td>			
				</tr>
		</c:forEach>
		
	</tbody>
</table>
</div>
			</div>
			</div>
		</div>
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

    <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"   style="background-color: black;color: white;">
        <button type="button" class="close" data-dismiss="modal"style="color:white" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Medical Report : <span style="font-weight:bold">2014 Jun 2</span></h4>
      </div>
      <div class="modal-body" style="background-color: rgba(230, 248, 173, 1);">

        <form class="form-horizontal" role="form">
           <div class="form-group">
            <label for="medicine" class="col-sm-4 control-label">Patient Age</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" id="medicine" placeholder="" required>
            </div>
          </div>
          <div class="form-group">
            <label for="ailment" class="col-sm-4 control-label">Ailment/Problem</label>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="ailment" placeholder="Details should be provided" required/>
            </div>
          </div>
          <div class="form-group">
            <label for="medicine" class="col-sm-4 control-label"  required>Recommanded Medicine/Treatment</label>
            <div class="col-sm-8">

            <textarea rows="4" cols="40" class="form-control" id="exampleInputEmail1" placeholder="Details should be provided"></textarea>
            </div>
          </div>                 
          <div class="form-group">
            <label for="testReport" class="col-sm-4 control-label">Instructions</label>
            <div class="col-sm-8">

            <textarea rows="4" cols="40" class="form-control" id="testReport" placeholder="Details should be provided"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label for="testReport" class="col-sm-4 control-label">Special Notes</label>
            <div class="col-sm-8">

            <textarea rows="4" cols="40" class="form-control" id="testReport" placeholder="Details should be provided."></textarea>
            </div>
          </div>
         <div class="form-group">
            <label for="ailment" class="col-sm-4 control-label">Upload Prescription</label>
            <div class="col-sm-8">
              <span class="btn btn-warning btn-file">
                  Choose <input type="file">
              </span>
              <button type="button" class="btn btn-success">Upload</button>
            </div>
          </div>   
      
        </form>
      </div>
      <div class="modal-footer"  style="background-color: black;color: white;margin-top: -1px;">
        <!-- <button class="metro image-button primary" data-toggle="modal" data-target="#createModal">Save</button> -->
        <button type="button" class="btn btn-default" data-dismiss="modal">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        
      </div>
    </div>
  </div>
</div>

<form  id="getPatientForm" action="getPatient" method="POST" >
	<input type="hidden" name="patientId" id="patientId"/>
</form>
<form  id="createPatientForm" action="create" method="GET" >	
</form>
<!--Javascripts on body load-->
 <script type="text/javascript">
       $(document).ready(function() {
         
    	   $('table').on( "click", '.patAnchr', function() {    		  
    		   $('#patientId').val($(this).attr('id'));
    		   $('#getPatientForm').submit();
    	   });
    	   
    	   $('#createPatient' ).click(function() { 
    		   $('#createPatientForm').submit();
    	   });
      
   
     });   
    
   </script>
	</body>
</html>