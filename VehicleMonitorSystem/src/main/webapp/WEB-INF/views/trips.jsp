<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="rabeek">
       <title>Users List</title>
      <link href="static/css/adminpage.css" rel="stylesheet" media="screen">
   </head>
   <jsp:include page="includeHeaders.jsp" />
   <div id="wrapper" style="margin-top:50px;overflow-x:none">
   <div class="tab-content">
      <div id="admin" class="tab-pane fade in active" >
         <jsp:include page="Include_Admin_Sidemenu.jsp" />
         <div id="page-wrapper"></div>
      </div>
      <div id="dashboard" class="tab-pane fade">
         <h3>Dashboard 1</h3>
      </div>
      <div id="track" class="tab-pane fade">
         <jsp:include page="include_Track_Sidemenu.jsp" />
         <div id="page-wrapper" style="padding-right:0px;padding-left:10px;">
            <div class="container-fluid" style="padding-right:0px;padding-left:0px;padding-top:10px;padding-bottom:0px">
               <div class="row-fluid">
                  <c:if test="${not empty success}">
                     <div class="alert alert-success" role="alert">
                        ${success}
                     </div>
                  </c:if>
                  <div class="col-lg-12 seventy">
                     <div id="containerPage" class="row-fluid">
                        <div align="right"> <a class="btn btn-default" href="<c:url value='/newtrip' />"><i class="fa fa-car"></i>&nbsp;&nbsp;Add Trip</a>
                        </div><br>
                        <c:choose>
                           <c:when test="${create||edit || search}">
                              <form name="formmain" id="formmain" data-toggle="validator" role="form"  method="POST" modelAttribute="employee" class="form-horizontal" >
                                 <input type="hidden" path="id" id="id"/>
                                 <c:if test="${not empty success}">
                                    <div class="alert alert-success" role="alert">
                                       ${success}
                                    </div>
                                 </c:if>
                                 <div class = "panel panel-primary mypanel">
                                    <div class = "panel-heading">
                                       <h3 class = "panel-title" align="center">TRIP ID</h3>
                                    </div>
                                    <div class = "panel-body">
                                       <!---This is a Basic panel--->   
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">Date<sup>*</sup></label>
                                          <div class="col-lg-2">
                                             <div class="input-group date datePicker">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input placeholder="DD/MM/YYYY" class="form-control" style="width:115px" name="tripdate" type="text" />
                                                <input type="hidden" id="dtp_tripdate" value="" />
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">Time<sup>*</sup></label>
                                          <div class="col-lg-2">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                                <input placeholder="--:--AM/PM" type="text" id="input_starttime" class="form-control timepicker">
                                             </div>
                                          </div>
										   <label class="col-md-2 control-label" >Follow-up<sup>*</sup></i></label>
                                          <div class="col-md-4  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">-select-</option>
                                                   <option value="self">Yakoob</option>
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">Bookings</label>
                                          <div class="col-md-5  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">-select-</option>
                                                   <option value="self">self</option>
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">From<sup>*</sup></label>
                                          <div class="col-md-7  inputGroupContainer">
                                             <div class="input-group"> 
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <input id="autocompleteFrom"  name="tripFrom" placeholder="Enter the From Location" onFocus="geolocate();" class="form-control" type="text"/>
                                             </div>
                                          </div>
										  </div>
										  <div class="form-group">
                                          <label class="col-md-1 control-label">To<sup>*</sup></label>
                                          <div class="col-md-7  inputGroupContainer">
                                             <div class="input-group"> 
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <input id="autocompleteTo" name="tripTo" placeholder="Enter the To Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label" style="leftpadding:0px">Trip Type</label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">-select-</option>
                                                   <option value="oneway">oneway</option>
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="panel panel-info">
                                          <h5><b>Customer Details</b></h5>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">Name<sup>*</sup></i></label>
                                          <div class="col-md-5  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input  placeholder="Enter the Customer Name" name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">Phone<sup>*</sup></label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group">    
                                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                <input  placeholder="XXXXXXXXX" name="middle_initial"   id="middle_initial" class="form-control"  type="text"/>
                                             </div>
                                          </div>
										  <div class="col-md-2" align="right">
										<button class="btn btn-success disabled" id="btnSubmit1" name="btnSubmit1" type="button">Send SMS</button>                                        
                                </div>
                                       </div>
									   <div class="form-group">
                                          <label class="col-md-1 control-label">Pickup<sup>*</sup></label>
                                          <div class="col-md-7  inputGroupContainer">
                                             <div class="input-group"> 
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <input id="autocompletePickup"  placeholder="Enter the Pickup Location" onFocus="geolocate();" class="form-control" type="text"/>
                                             </div>
                                          </div>
										  </div>
										  <div class="form-group">
                                          <label class="col-md-1 control-label">Drop<sup>*</sup></label>
                                          <div class="col-md-7  inputGroupContainer">
                                             <div class="input-group"> 
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <input id="autocompleteDrop" placeholder="Enter the Drop Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                          
                                       </div>
									    <div class="panel panel-info">
                                          <h5><b>Trip Allotment</b></h5>
                                       </div>
                                      <div class="form-group">
                                          <label class="col-md-1 control-label">Driver<sup>*</sup></i></label>
                                          <div class="col-md-5  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input  name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">Phone</label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group">    
                                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                <input  placeholder="XXXXXXXXX" name="middle_initial"   id="middle_initial" class="form-control"  type="text"/>
                                             </div>
											 </div>
											 <div class="col-md-2" align="right">
										<button class="btn btn-success disabled" id="btnSubmit" name="btnSubmit" type="button">Send SMS</button>                                        
                                </div>
                                          </div>
										   
                                      <div class="form-group">
										  <label class="col-md-1 control-label">Vehicle</label>
                                          <div class="col-md-7  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-car"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">-select-</option>
                                                   <option value="oneway">Sedan</option>
                                                </select>
                                             </div>
                                             </div>
                                          </div>
										   <div class="panel panel-info">
                                          <h5><b>Running info</b></h5>
                                       </div>
										<div class="form-group">
                                          <label class="col-md-1 control-label">Start<sup>*</sup></i></label>
                                          <div class="col-md-2  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                <input  placeholder="Open in kms" name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">End<sup>*</sup></i></label>
                                          <div class="col-md-2  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                <input  placeholder="Close in kms" name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
										  <label class="col-md-1 control-label">Amount<sup>*</sup></i></label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                <input  placeholder="Amount in Rs." name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                       </div>
									   <div class="panel panel-info">
                                          <h5><b>Payment</b></h5>
                                       </div><div class="form-group">
									   <label class="col-md-2 control-label">Amount to be paid<sup>*</sup></i></label>
                                          <div class="col-md-2  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                <input  placeholder="Amount in Rs." name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
										  <label class="col-md-2 control-label">From Driver<sup>*</sup></i></label>
                                          <div class="col-md-2  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                <input  placeholder="Amount in Rs." name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
										  <label class="col-md-2 control-label">Balance<sup>*</sup></i></label>
                                          <div class="col-md-2  inputGroupContainer">
                                             <div class="input-group"> <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                <input  placeholder="Amount in Rs." name="lastName"   id="lastName" class="form-control"  type="text"/>
                                             </div>
                                          </div>
											</div>
											<div class="form-group">
											  <label class="col-md-2 control-label">Comments</label>
											    <div class="col-md-4  inputGroupContainer">
                                             <div class="input-group">
											  <textarea class="form-control" placeholder="Enter the settlement details here..."style="margin: 0px; width: 533px; height: 80px;"rows="2" id="comment"></textarea>
											  </div></div>
											</div>



                                       </div>
                                       
                                      

                                    </div>
                                 
                                 <div class="container" align="center">
                                    <c:choose>
                                       <c:when test="${edit}">
                                          <input type="submit" value="Update" class="btn btn-primary btn-sm"/>
                                       </c:when>
                                       <c:otherwise>
                                          <div class="dropup">
											<button class="btn btn-primary dropdown-toggle" type="submit" data-toggle="dropdown">Submit as
											<span class="caret"></span></button>
											<ul class="dropdown-menu">
											  <li><a href="#">Active</a></li>
											  <li><a href="#">Running</a></li>
											  <li><a href="#">Pending</a></li>
											  <li><a href="#">Completed</a></li>
											   <li class="divider"></li>
											</ul>
										  </div>
                                       </c:otherwise>
                                    </c:choose>
                                 </div>
								 </div>
                              </form>
                           </c:when>
                        </c:choose>
                     </div>
                  </div>
                  <br>
               </div>
            </div>
         </div>
         <div id="report" class="tab-pane fade">
            <h3>Report</h3>
         </div>
      </div>
   </div>
   <script src="static/vendor/jquery/jquery.min.js"></script>
   <script src="static/js/formValidation.min.js"></script>
   <script src="static/js/bootstrap.min.js"></script>
   <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="static/js/bootstrap-datepicker.min.js"></script>
   <script src="static/js/bootstrap-clockpicker.min.js"></script>
   <script src="static/vendor/metisMenu/metisMenu.min.js"></script>
   <script src="static/vendor/raphael/raphael.min.js"></script>
   <script src="static/dist/js/sb-admin-2.js"></script>
   <style>
   .dropdown-menu {
  left: 50%;
  right: auto;
  transform: translate(-50%, 0);
}
      table.table-hover thead tr:first-child{
      background: #23707cd1;
      color: #ECF0F1;
      }
   </style>
   <script type="text/javascript">
      $(document).ready(function() {
          var activeSystemClass = $('.list-group-item.active');
      
          //something is entered in search form
          $('#system-search').keyup( function() {
             var that = this;
              // affect all table rows on in systems table
              var tableBody = $('.table-list-search tbody');
              var tableRowsClass = $('.table-list-search tbody tr');
              $('.search-sf').remove();
              tableRowsClass.each( function(i, val) {
              
                  //Lower text for case insensitive
                  var rowText = $(val).text().toLowerCase();
                  var inputText = $(that).val().toLowerCase();
                  if(inputText != '')
                  {
                      $('.search-query-sf').remove();
                      tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                          + $(that).val()
                          + '"</strong></td></tr>');
                  }
                  else
                  {
                      $('.search-query-sf').remove();
                  }
      
                  if( rowText.indexOf( inputText ) == -1 )
                  {
                      //hide rows
                      tableRowsClass.eq(i).hide();
                      
                  }
                  else
                  {
                      $('.search-sf').remove();
                      tableRowsClass.eq(i).show();
                  }
              });
              //all tr elements are hidden
              if(tableRowsClass.children(':visible').length == 0)
              {
                  tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
              }
          });
      });
   </script>
   <script src="static/vendor/datatables/js/jquery.dataTables.min.js"></script>
   <script src="static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
   <script src="static/vendor/datatables-responsive/dataTables.responsive.js"></script>
   <script>
      $(document).ready(function() {
          $('#customer_dataTable').DataTable({
              responsive: true,
              "searching": false
          });
      });
      
      $(document).ready(function() {
      	 $('#formmain').formValidation({
      	    framework: 'bootstrap',
      	    icon: {
        valid: 'glyphicon glyphicon-ok',
      	      invalid: 'glyphicon glyphicon-remove',
      	      validating: 'glyphicon glyphicon-refresh'
      	    },
      	    fields: {
      	    	 firstName: {
      	    		 	group: '.group',
      	    	        validators: {
      	    	          notEmpty: {
      	    	            message: 'First name is required'
      	    	          }
      	    	          
      	    	        }
      	    	      },
      	    	  lastName: {
      	    		  group: '.group',
        	    		 	 validators: {
        	    	          notEmpty: {
        	    	            message: 'Last name is required'
        	    	          }
        	    	          
        	    	        }
        	    	      },
      ssoId: {
      	    		  group: '.group',
        	    		 	 validators: {
        	    	          notEmpty: {
        	    	            message: 'User name is required'
        	    	          }
        	    	          
        	    	        }
        	    	      },
        password: {
      	    		  group: '.group',
        	    		 	 validators: {
        	    	          notEmpty: {
        	    	            message: 'Password is required'
        	    	          }
        	    	          
        	    	        }
        	    	      },
      email: {
      	    		  group: '.group',
        	    		 	 validators: {
        	    	          notEmpty: {
        	    	            message: 'Email is required'
        	    	          }
        	    	          
        	    	        }
        	    	      },
      userProfiles: {
      	    		  group: '.group',
        	    		 	 validators: {
        	    	          notEmpty: {
        	    	            message: 'Role is required'
        	    	          }
        	    	          
        	    	        }
        	    	      }
        	    	    
      	    	
      	     
      	    }
      	   
      	  }).on('err.field.fv', function(e, data) {
              // data.element --> The field element
      
              var $tabPane = data.element.parents('.tab-pane'),
                  tabId    = $tabPane.attr('id');
      
              $('a[href="#' + tabId + '"][data-toggle="tab"]')
                  .parent()
                  .find('i')
                  .removeClass('fa-check')
                  .addClass('fa-times');
          })
          // Called when a field is valid
          .on('success.field.fv', function(e, data) {
              // data.fv      --> The FormValidation instance
              // data.element --> The field element
      
              var $tabPane = data.element.parents('.tab-pane'),
                  tabId    = $tabPane.attr('id'),
                  $icon    = $('a[href="#' + tabId + '"][data-toggle="tab"]')
                              .parent()
                              .find('i')
                              .removeClass('fa-check fa-times');
      
              // Check if all fields in tab are valid
              var isValidTab = data.fv.isValidContainer($tabPane);
              if (isValidTab !== null) {
                  $icon.addClass(isValidTab ? 'fa-check' : 'fa-times');
              }
          });
      	});

		
jQuery(function() {
	/*  Submit form using Ajax */
	$('button[type=submit]').click(function(e) {
		
		//Prevent default submission of form
		e.preventDefault();
		
		//Remove all errors
		//$('input').next().remove();
		
		$.ajax({
			url : 'saveTrip',
			type : 'POST',
			data : $('form[name=formmain]').serialize(),
			success : function(res) {
				
				if(res.validated){
					//Set response
					$('#resultContainer pre code').text(JSON.stringify(res.employee));
					$('#resultContainer').show();
					
				}else{
					//Set error messages
					$.each(res.errorMessages,function(key,value){
						$('input[name='+key+']').after('<span class="error">'+value+'</span>');
					});
				}
			}
		})
	});
});

      
      jQuery(function() {
      if(jQuery(".datePicker") != null && jQuery(".datePicker").length) {
      jQuery(".datePicker")
      .datepicker({
      autoclose: true,			
      todayHighlight: false,
      format: "dd/mm/yyyy",			
      });
      }
      
      
      });
      jQuery(function() {
      
      jQuery('#input_starttime').clockpicker({
      
      autoclose: true,
      twelvehour: true
      });
      });
      
      var placeSearch, autocompleteFrom, autocompleteTo,autocompletePickup,autocompleteDrop;
      
      
      function initAutocomplete() {
      // Create the autocomplete object, restricting the search predictions to
      // geographical location types.
      autocompleteFrom = new google.maps.places.Autocomplete(
        document.getElementById('autocompleteFrom'), {types: ['geocode']});
      autocompleteTo = new google.maps.places.Autocomplete(
        document.getElementById('autocompleteTo'), {types: ['geocode']});
	  autocompletePickup = new google.maps.places.Autocomplete(
        document.getElementById('autocompletePickup'), {types: ['geocode']});
	  autocompleteDrop = new google.maps.places.Autocomplete(
        document.getElementById('autocompleteDrop'), {types: ['geocode']});
      
      
      
      }
      
      
      
      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
      if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var geolocation = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        var circle = new google.maps.Circle(
            {center: geolocation, radius: position.coords.accuracy});
        autocompleteFrom.setBounds(circle.getBounds());
      autocompleteTo.setBounds(circle.getBounds());
	  autocompletePickup.setBounds(circle.getBounds());
	  autocompleteDrop.setBounds(circle.getBounds());
      });
      }
      }
   </script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEQ161bLUrTw9fTh_6gr-vpJH2ns-Ggs4&libraries=places&callback=initAutocomplete"
      async defer></script>
   </body>
</html>
