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

    <style type="text/css">

#footer {
			  position: absolute;
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
    </style>  
   <link  rel="stylesheet" type="text/css" href="resources/css/pms-common.css">
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
            <li><a href="#"  class="homeBtn" style="font-weight: bold;color:#1abc9c">Back</a></li>           
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container" style="margin-top:20px">
     

      <div  class="row">    
        <div class="col-lg-12">        
      <h3 style="color:#2c3e50">Patient Details</h3>
            <form class="form-horizontal" role="form" action="createPatient" method="POST" enctype="multipart/form-data"  modelAttribute="file">
              <div class="form-group">
                <label for="inputEmail3" class="col-md-2 control-label">Patient First Name</label>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="fName" name="fName" placeholder="First Name" required />
                </div>
                <label for="inputEmail3" class="col-md-2 control-label">Patient Last Name</label>
                <div class="col-md-4">
                  <input type="text" class="form-control" id="lName" name="lName" placeholder="Last Name"required/>
                </div>
              </div>

              <div class="form-group">
                <label for="inputEmail3" class="col-md-2 control-label">Age</label>
                <div class="col-md-1">
                  <input type="text" class="form-control" id="age" name="age" placeholder="Age" required/>
                </div>
                
                 <label for="inputEmail3" class="col-md-1 control-label">Gender</label>
                <div class="col-md-2">
                  	<select class="form-control" id="gender"  name="gender">
					  <option value="Male" selected="selected">Male</option>
					  <option value="Female">Female</option>					  
					</select> 
                </div>
                
                 <label for="inputEmail3" class="col-md-2 control-label">Upload photo</label>
                <div class="col-md-2">
                  <span class="btn btn-warning btn-file">
                  <input class="uploadPhoto" type="file" name="file" id="file">
                  </span>                 
                </div>

                           </div>

              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Address</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                </div>
                <label for="inputPassword3" class="col-sm-2 control-label">NIC</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="nic" name="nic" placeholder="NIC" />
                </div>
              </div>

               <div class="form-group">
                
                <label for="inputPassword3" class="col-sm-2 control-label">Contact Number</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="contactNo" name="contactNo" placeholder="Contact Number">
                </div>
                <label for="inputPassword3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-4">
                  <input type="email" class="form-control" id="email" name="email" placeholder="user@gmail.com">
                </div>
              </div>
              
              <div class="form-group">
                <label for="inputEmail3" class="col-md-2 control-label">Tags</label>
                <div class="col-md-10">                
                <input type="text" class="form-control" id="tags" name="tags" value="Headache,Fever,Cold" data-role="tagsinput" placeholder="Add and press Enter" />
                </div>
               
                </div>
                <hr>
                <div class="form-group">
                
                 <label for="inputEmail3" class="col-md-2 control-label"></label>
                <div class="col-sm-4">
                   
                </div>
                <label for="inputPassword3" class="col-sm-2 control-label"></label>
                <div class="col-sm-4">
                  <button type="submit" class="btn btn-success pull-right">Save Patient</button>
                </div>
              <hr>
    
              
              </div>

              


            </form>



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
          
          $('.homeBtn' ).click(function() {
       	  $('#loadHomePageFrm').submit();
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
              
     });
    

    
   </script>

</body></html>