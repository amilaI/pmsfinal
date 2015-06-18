<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		 <title>PMS | Login</title>
	<link rel="shortcut icon" href="resources/images/logo1.png">
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
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable();
			} );
		</script>
		<style type="text/css">
			#formDiv{
				margin: 40px;
				padding-top: 40px;
				padding-left: 40px;
				padding-right: 40px;
				padding-bottom: 10px;
				color: white;
				background-color: rgba(0, 0, 0, 0.6);
				border-radius: 20px;
			}
			
			#footer {
			  position: absolute;
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
    			color: #999;
    		} 
    		@font-face {
				font-family: "weblysleekuil";
				src: url(resources/fonts/weblysleekuil.ttf) format("truetype");
			}
			body{
				background-color :rgba(55, 78, 101, 0.9);
				font-family: "weblysleekuil";
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

          <a class="navbar-brand" href="#"  style="font-weight: bold;color:#999">Patient Managment System</a>
        </div>
        <div style="height: 1px;" class="navbar-collapse collapse">
          <ul class="nav navbar-nav pull-right">            
            <li style="font-weight:bold;color:#999 !important"><a href="#about"  data-toggle="modal" data-target="#abtModal">About Developers</a></li>           
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

		<div class="container">

	<div  class="row">
	<div class="col-lg-3 col-md-3 col-sm-3">
					<div style="margin-top: 40px;">
						<!-- <img src="http://blogs.dallasobserver.com/unfairpark/Caduceus.svg.png" class="img-responsive"> -->
					</div>

	</div>
	<div class="col-lg-6 col-md-6 col-sm-6">
			<div id="formDiv">
				<h4>Log in</h4>
				<hr>
				<form class="form-horizontal" role="form" action="findIndividual"  method="POST">
				  <div class="form-group">
				    <label for="inputUserName" class="col-sm-4 control-label">User Name</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="inputUserName" name="inputUserName" placeholder="User Name" required>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
				    <div class="col-sm-8">
				      <input type="password" class="form-control" id="inputPassword3"  name="inputPassword" placeholder="Password" required>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				    	<div align="center">
				      <button type="submit" class="btn btn-default"><span  class="glyphicon glyphicon-user"></span>&nbsp; Sign in</button>
				      </div>
				    </div>
				  </div>
				    <div class="form-group">
				    <div class="col-sm-12">
				    	<div class="alert alert-info"  ${style}>${loginError}</div>
				    </div>
				  </div>
				 <!--  <hr>
				  <div align="center">
				  	<img class="img-responsive" src="http://www.clker.com/cliparts/o/o/6/Z/S/f/health-care-md.png" style="width:50%">
				  </div> -->
				 
				</form>

			</div>
	</div>
	<div class="col-lg-3 col-md-3  col-sm-3">
					

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
    <!-- Modal -->
	<div class="modal fade" id="abtModal" tabindex="-1" role="dialog" aria-labelledby="abtModal" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h2 class="modal-title" id="myModalLabel" align="center"><strong>Anonimo Dev Center</strong> </h2>
	      </div>
	      <div class="modal-body">
	      
	         <div class="row">
                
                <div class="col-md-4">
                		<div  align="center" >  
                			<img alt="" src="resources/images/logo.png" class="img-responsive" style="margin-top: 20px" />
                		</div>
                </div>
                <div class="col-md-8">
                			<div>
                			<div  align="center" >      
					        <h3><i  class="glyphicon glyphicon-earphone"></i>&nbsp;Contacts Us</h3> 
					        <p>Tel :- 077-234 2617  |  071-744 7877</p>
					        <p>Email :-  amila922@gmail.com</p>
					        </div>
					        <hr>
					        <p>This PMS project is all rights received by Anonimo Dev Center and this is licensed under a creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</p>
					        </div>
                </div>
              </div>
	      	  
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        
	      </div>
	    </div>
	  </div>
	</div>

	</body>
</html>
