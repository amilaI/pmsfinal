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
          <a class="navbar-brand homeBtn" href="#"  style="font-weight: bold;color:#1abc9c">Patient Managment System</a>
        </div>
        <div style="height: 1px;" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right">           
            <li><a href="#"  class="homeBtn" style="font-weight: bold;color:#1abc9c">Home</a></li>           
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container" style="margin-top:20px">
     

      <div  class="row">    
        <div class="col-lg-12">        
	      <h1 style="color:#2c3e50">Oops!! Something went wrong!<small>  But Don't worry at all !</small></h1>      
		  <br>
		  <img alt="" src="resources/images/programmer.jpg" class="img-responsive">
		  <h3 class="" >We detected that you have this patient already registered in the system or a patient with same information exists...</h3>
	 	  <button type="button" class="btn btn-success  homeBtn">Click here to Give it another shot!</button>	
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
    <script src="resources/new_files/jquery.js"></script>
    <script src="resources/new_files/bootstrap.js"></script>
    <script type="text/javascript">
       $(document).ready(function() {
        
         $('.homeBtn' ).click(function() {
       	  $('#loadHomePageFrm').submit();
         });

     });
    

    
   </script>

</body></html>