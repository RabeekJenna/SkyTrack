<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="rabeek">
      <meta name="_csrf" content="${_csrf.token}" />
      <meta name="_csrf_header" content="${_csrf.headerName}" />
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
         <div id="page-wrapper" style="padding-right:0px;padding-left:50px;">
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
                        </div>
                        <c:choose>
                           <c:when test="${create||edit || search}">
                              <div class="outerbox_heading">
                                 <span class="outerbox_heading_font">
                                    <sec:authorize access="hasRole('ADMIN')"></sec:authorize>
                                    Trip
                                 </span>
                              </div>
                              <form name="formmain" id="formmain" data-toggle="validator" role="form"  method="POST" modelAttribute="employee" class="form-horizontal" >
                                 <input type="hidden" path="id" id="id"/>
                                 <c:if test="${not empty success}">
                                    <div class="alert alert-success" role="alert">
                                       ${success}
                                    </div>
                                 </c:if>
                                 <div class = "panel panel-primary mypanel">
                                    <div class = "panel-heading">
                                       <h3 class = "panel-title">Trips</h3>
                                    </div>
                                    <div class = "panel-body">
                                       <!---This is a Basic panel--->   
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">TRIP ID</label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-automobile"></i></span>
                                                <c:choose>
                                                   <c:when test="${edit}">
                                                      <input type="text" value="${employee.employeeid}" id="employeeid" class="form-control input-sm"></input>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <input type="text" path="employeeid" id="employeeid" class="form-control input-sm"></input>
                                                   </c:otherwise>
                                                </c:choose>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">Date<sup>*</sup></label>
                                          <div class="col-lg-2">
                                             <div class="input-group date datePicker">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input placeholder="DD/MM/YYYY" class="form-control" name="tripdate" type="text" />
                                                <input type="hidden" id="dtp_tripdate" value="" />
                                             </div>
                                          </div>
                                          <label class="col-md-2 control-label">Time<sup>*</sup></label>
                                          <div class="col-lg-2">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                                <input placeholder="--:--AM/PM" type="text" id="input_starttime" class="form-control timepicker">
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">Booking Type</label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">Select</option>
                                                   <option value="self">self</option>
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">From<sup>*</sup></label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group"> 
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <input id="autocompleteFrom"  placeholder="Enter the From Location" onFocus="geolocate();" class="form-control" type="text"/>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">To<sup>*</sup></label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group"> 
                                                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                <input id="autocompleteTo" placeholder="Enter the To Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                             </div>
                                          </div>
                                          <label class="col-md-1 control-label">Trip Type</label>
                                          <div class="col-md-2  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">-select-</option>
                                                   <option value="oneway">oneway</option>
                                                </select>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="panel-heading">
                                          <h5><b>Customer Details</b></h5>
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-1 control-label">Name<sup>*</sup></i></label>
                                          <div class="col-md-3  inputGroupContainer">
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
									    <div class="panel-heading">
                                          <h5><b>Trip Allotment</b></h5>
                                       </div>
                                      <div class="form-group">
                                          <label class="col-md-1 control-label">Driver<sup>*</sup></i></label>
                                          <div class="col-md-3  inputGroupContainer">
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
										  <label class="col-md-1 control-label">Vehicle</label>
                                          <div class="col-md-3  inputGroupContainer">
                                             <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-car"></i></span>
                                                <select class="form-control" id="title">
                                                   <option value="">-select-</option>
                                                   <option value="oneway">Sedan</option>
                                                </select>
                                             </div>
                                             </div>
                                          </div>
                                       </div>
                                       
                                      

                                    </div>
                                 </div>
                                 <div align="center">
                                    <c:choose>
                                       <c:when test="${edit}">
                                          <input type="submit" value="Update" class="btn btn-primary btn-sm"/>
                                       </c:when>
                                       <c:otherwise>
                                          <input type="submit" value="Save" class="btn btn-primary btn-sm"/>
                                       </c:otherwise>
                                    </c:choose>
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
