<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="rabeek">
      <title>Trips List</title>
      <link href="static/css/adminpage.css" rel="stylesheet" media="screen">
	  <link href="static/css/jquery-ui.min.css" rel="stylesheet" media="screen">
	  <link href="static/css/bootstrap-clockpicker.min.css" rel="stylesheet" media="screen">

    <style>
        .ui-autocomplete { 
            cursor:pointer; 
            height:120px; 
            overflow-y:scroll;
        }    
    </style>
   </head>
   <jsp:include page="includeHeaders.jsp" />
   <div id="wrapper" style="margin-top:50px;overflow-x:none">
      <div class="tab-content">
         <div id="admin" class="tab-pane fade" >
            <jsp:include page="Include_Admin_Sidemenu.jsp" />
            <div id="page-wrapper"></div>
         </div>
         <div id="dashboard" class="tab-pane fade">
            <h3>Dashboard 1</h3>
         </div>
         <div id="track" class="tab-pane fade in active">
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
                           <c:choose>
                              <c:when test="${create||edit}">
                                 <form:form method="POST" modelAttribute="trip" class="form-horizontal" name="formmain" id="formmain">
                                    <form:input type="hidden" path="id" id="id"/>
                                    <c:if test="${not empty success}">
                                       <div class="alert alert-success" role="alert">
                                          ${success}
                                       </div>
                                    </c:if>
                                    <div class = "panel panel-primary mypanel">
                                       <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">
                                             TRIP ID&nbsp;
                                             <c:if test="${not empty trip.tripid}"> - ${trip.tripid}</c:if>
                                             <c:choose>
                                                <c:when test="${edit}">
                                                   <input type="hidden" value="${trip.tripid}" id="tripid"></input>
                                                </c:when>
                                                <c:otherwise>
                                                   <form:input type="hidden" path="tripid" id="tripid"></form:input>
                                                </c:otherwise>
                                             </c:choose>
                                             <a data-toggle="tooltip" data-placement="bottom" title="Add Trip" href="<c:url value='/newtrip' />"><i class="fa fa-plus-square pull-right"></i></a>
                                          </h3>
                                       </div>
                                       <div class = "panel-body">
                                          <!---This is a Basic panel--->   
                                          <div class="form-group">
										   <div class="group">
                                             <label class="col-md-1 control-label">Date<sup>*</sup></label>
                                             <div class="col-lg-2">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                   <form:input placeholder="DD/MM/YYYY" class="form-control datetimepicker" path="tripdate" type="text" />
                                                   <input type="hidden" id="dtp_tripdate" value="" />
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
											 <label class="col-md-1 control-label">Time<sup>*</sup></label>
											  <div class="col-lg-2">
												 <div class="input-group">
													<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
													<input placeholder="--:--AM/PM" type="text" id="input_starttime" path="triptime" class="form-control timepicker">
												 </div>
											  </div>
											  </div>
                                             <label class="col-md-1 control-label" >Follow-up<sup>*</sup></i></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                   <form:select path="followup" class="form-control" id="title">
                                                      <option value="">-select-</option>
                                                      <option value="self">Yakoob</option>
                                                   </form:select>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">From<sup>*</sup></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompleteFrom"  path="tripfrom" placeholder="Enter the From Location" onFocus="geolocate();" class="form-control" type="text"/>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label">To<sup>*</sup></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompleteTo" path="tripto" placeholder="Enter the To Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label" style="leftpadding:0px">Trip Type</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                                                   <form:select class="form-control" path="triptype" id="title">
                                                      <option value="">-select-</option>
                                                      <option value="oneway">oneway</option>
                                                   </form:select>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label" style="leftpadding:0px">No.Of Days</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                   <input type="text" class="form-control" name="tripdays"/>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label">Bookings</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                                   <form:input  path="bookings"   id="bookings" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="panel panel-info">
                                             <h5><b>Customer Details</b></h5>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Name<sup>*</sup></i></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                   <form:input  placeholder="Enter the Customer Name" path="customername"   id="customername" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label">Phone<sup>*</sup></label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                   <form:input  placeholder="XXXXXXXXX" path="customerphone"   id="customerphone" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                             <div class="col-md-2" align="right">
                                                <button class="btn btn-success disabled" id="btnSubmit1" name="btnSubmit1" type="button">Send SMS</button>                                        
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Pickup<sup>*</sup></label>
                                             <div class="col-md-9  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompletePickup"  path="pickup" placeholder="Enter the Pickup Location" onFocus="geolocate();" class="form-control" type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Drop<sup>*</sup></label>
                                             <div class="col-md-9  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompleteDrop" path="drop" placeholder="Enter the Drop Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="panel panel-info">
                                             <h5><b>Trip Allotment</b></h5>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Driver<sup>*</sup></i></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                   <form:input  path="tripdriver"   id="tripdriver" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label">Phone</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                   <form:input  placeholder="XXXXXXXXX" path="driverphone"   id="middle_initial" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                             <div class="col-md-2" align="right">
                                                <button class="btn btn-success disabled" id="btnSubmit" name="btnSubmit" type="button">Send SMS</button>                                        
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Vehicle</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-car"></i></span>
                                                   <form:select class="form-control" path="tripvehicle" id="title">
                                                      <option value="">-select-</option>
                                                      <option value="oneway">Sedan</option>
                                                   </form:select>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="panel panel-info">
                                             <h5><b>Running info</b></h5>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Start<sup>*</sup></i></label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                   <form:input  placeholder="Open in kms" path="openkm"   id="lastName" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label">End<sup>*</sup></i></label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                   <form:input  placeholder="Close in kms" path="closekm"   id="lastName" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                             <label class="col-md-1 control-label">Amount<sup>*</sup></i></label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input  placeholder="Amount in Rs." path="amount"   id="lastName" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Comments</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <form:textarea class="form-control" path="comments" placeholder="Enter the settlement details here..." style="margin:0px;width:670px;height:80px;" rows="2" id="comment"></form:textarea>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                       <div align="center">
                                          <c:choose>
                                             <c:when test="${edit}">
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-refresh"></i>&nbsp;Update</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="< c:url value='/list' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:when>
                                             <c:otherwise>
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i>&nbsp;Save</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="<c:url value='/list' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:otherwise>
                                          </c:choose>
                                       </div>
                                    </div>
                        </div>
                        </form:form>
                        </c:when>
                        </c:choose>
                     </div>
                  </div>
                     <c:choose>
                     <c:when test="${search}">
					 <div class="row-fluid">
                        <div class="col-lg-12 seventy">
						  <div id="containerPage" class="row-fluid">
                           <div class="panel panel-primary mypanel">
                            <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">TRIPS&nbsp;<a data-toggle="tooltip" data-placement="bottom" title="Add Trip" href="<c:url value='/newtrip' />"><i class="fa fa-plus-square pull-right"></i></a></h3></div>
                              <div class="container-fluid">
                                 <div class="col-xs-6 selectpicker form-group">
                                    <label>From Date:</label>
                                    <div class='input-group date' id="datetimepicker1">
                                       <input type='text' class="form-control" id="mindate" />
                                       <span class="input-group-addon">
                                       <span class="glyphicon glyphicon-calendar"></span>
                                       </span>
                                    </div>
                                 </div>
                                 <div class="col-xs-6 selectpicker form-group">
                                    <label>To Date:</label>
                                    <div class='input-group date' id="datetimepicker2">
                                       <input type='text' class="form-control" id="maxdate"/>
                                       <span class="input-group-addon">
                                       <span class="glyphicon glyphicon-calendar"></span>
                                       </span>
                                    </div>
                                 </div>
                                 <table class="table table-list-search table-hover" id="customer_dataTable">
                                    <thead>
                                       <tr>
                                          <th>TRIP ID</th>
                                          <th>Date</th>
										  <th>Time</th>
                                          <th>From</th>
                                          <th>To</th>
                                          <th>Customer</th>
                                          <th>Driver</th>
                                          <th>Vehicle</th>
                                          <th>Status</th>
                                          <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                                             <th>Action</th>
                                          </sec:authorize>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${trips}" var="trip">
                                          <tr>
                                             <td>${trip.tripid}</td>
                                             <td>
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${trip.tripdate}"/>
                                             </td>
											 <td>${trip.triptime}</td>
                                             <td>${trip.tripfrom}</td>
                                             <td>${trip.tripto}</td>
                                             <td>${trip.customername}</td>
                                             <td>${trip.tripdriver}</td>
                                             <td>${trip.tripvehicle}</td>
                                             <td>ACTIVE</td>
                                             <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                                                <td>
                                                   <a href="<c:url value='/edit-trip-${trip.id}' />" class="btn btn-success custom-width btn-sm"><i class="fa fa-edit"></i>&nbsp;Edit</a>
                                             </sec:authorize>
                                             <sec:authorize access="hasRole('ADMIN')">
                                             &nbsp;<a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-danger custom-width btn-sm"><i class="fa fa-trash"></i>&nbsp;Delete</a>
                                             </sec:authorize>
                                             </td>
                                          </tr>
                                       </c:forEach>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
						</div>
						</div>
                     </c:when>
                  </c:choose>
            </div>
         </div>
		 </div>
         <div id="report" class="tab-pane fade">
            <h3>Report</h3>
         </div>
      </div>
   </div>
   <script>var table;</script>
   <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/js/jquery-ui.min.js"></script>
   <script src="static/js/formValidation.min.js"></script>
   <script src="static/js/bootstrap.min.js"></script>
   <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="static/js/datatablejs/moment.min.js"></script>
   <script src="static/js/bootstrap-datetimepicker.min.js"></script>
   <script src="static/js/bootstrap-datepicker.min.js"></script>
   <script src="static/js/bootstrap-clockpicker.min.js"></script>
   <script src="static/vendor/metisMenu/metisMenu.min.js"></script>
   <script src="static/vendor/raphael/raphael.min.js"></script>
   <script src="static/dist/js/sb-admin-2.js"></script>
   <script src="static/js/bootstrap-session-timeout.min.js"></script>
   <style>
     
      table.table-hover thead tr:first-child{
      background: #23707cd1;
      color: #ECF0F1;
      }
   </style>
     <script>
    $(document).ready(function() {
        AutoCompletedriver();
		AutoCompletebook();
    });

    function AutoCompletedriver() {

		var drivers = [<c:forEach items="${loadDrivers}" var="driver" varStatus="totalCount">
               
         "${driver.fullName}"
         <c:if test="${totalCount.count lt fn:length(loadDrivers)}">
          <c:out value=",">
          </c:out>
          </c:if>      
      
      </c:forEach>
		  ];
        $('#tripdriver').autocomplete({
            source: drivers,
            minLength: 0,
            scroll: true
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
    }
	function AutoCompletebook() {

		var bookings = ["Self"];

		 $('#bookings').autocomplete({
            source: bookings,
			minLength: 0,
            scroll: true
                 
        }).focus(function() {
            $(this).autocomplete("search", "");
        });


		
    }
</script>
   <script type="text/javascript">
      $(document).ready(function() {
      $("#mindate").datepicker({format: "dd/mm/yyyy"});
      $("#mindate").datepicker('setDate', new Date());
      $("#maxdate").datepicker({format: "dd/mm/yyyy"});
      $("#maxdate").datepicker('setDate', new Date());
      $("#maxdate").datepicker('setDate', "+1d");
     });
   </script>
   <script src="static/vendor/datatables/js/jquery.dataTables.min.js"></script>
   <script src="static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
   <script src="static/vendor/datatables-responsive/dataTables.responsive.js"></script>
   
   <script>
  
	var table1;
   $(document).ready(function() {
            $('#customer_dataTable').DataTable({
                responsive: true,
                "searching": true,
				"bDestroy": true,
				"bDeferRender": true,
				"aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
				"iDisplayLength": 10
            });
        });
      $(document).ready(function(){
       table = $('#customer_dataTable').DataTable();
	        
          $.fn.dataTableExt.afnFiltering.push(
          function( settings, data, dataIndex ) {
              var min  = $('#mindate').val()
              var max  = $('#maxdate').val()
              var createdAt = data[1]; // Our date column in the table
              //createdAt=createdAt.split(" ");
              var startDate   = moment(min, "DD/MM/YYYY");
              var endDate     = moment(max, "DD/MM/YYYY");
              var diffDate = moment(createdAt, "DD/MM/YYYY");
              console.log(startDate);
       if ( min === "" && max === "" )
      {
      	return true;
      }
              if ((startDate.isSame(diffDate) || startDate.isBefore(diffDate)) && max == '') 
      {  return true;  
      }  else if ((endDate.isSame(diffDate) || endDate.isAfter(diffDate)) && min == '') 
      {  return true;  
      } else if ((startDate.isSame(diffDate) || startDate.isBefore(diffDate)) &&  (endDate.isSame(diffDate) || endDate.isAfter(diffDate))) {
      	return true;
      }
              return false;
      
          }
      
      );
      
         
              $("#mindate").datepicker({  format: "dd/mm/yyyy", autoclose: true, todayHighlight: false, onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
              $("#maxdate").datepicker({  format: "dd/mm/yyyy", autoclose: true, todayHighlight: false, onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
             
      
              // Event listener to the two range filtering inputs to redraw on input
              $('#mindate, #maxdate').change(function () {
                  table.draw();
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
					tripdate:{
						 group: '.group',
						validators: {
						  notEmpty: {
							message: 'TRIP Date is required'
						  },
						  date: {
							format: 'DD/MM/YYYY',
							message: 'TRIP date is not valid'
						  }
						}
					  },
					 triptime:{
						group: '.group',
						validators: {
						  notEmpty: {
							message: 'TRIP Time is required'
						  },
						  date: {
							format: 'HH:MM a',
							message: 'TRIP time is not valid'
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
        if(jQuery(".datetimepicker") != null && jQuery(".datetimepicker").length) {
        jQuery(".datetimepicker")
        .datepicker({
        autoclose: true,			
        todayHighlight: true,
        format: "dd/mm/yyyy",			
        }).on('change', function(e) {
    	      $('#formmain').formValidation('revalidateField', 'tripdate');
    	    });
        }
        
        
        });

	jQuery(function() {
      
      jQuery('#input_starttime').clockpicker({
      
      autoclose: true,
      twelvehour: true
      });
      });
           
   </script>
   <c:choose>
      <c:when test="${create || edit}">
         <script>
            var placeSearch, autocompleteFrom, autocompleteTo,autocompletePickup,autocompleteDrop;
            var componentForm = {
            locality : 'long_name'
            };
            
            
            function initAutocomplete() {
            // Create the autocomplete object, restricting the search predictions to
            // geographical location types.
            autocompleteFrom = new google.maps.places.Autocomplete(
              document.getElementById('autocompleteFrom'), {types: ['(cities)'],componentRestrictions: { country: 'ind' }});
            autocompleteFrom.setFields(['address_component']);
            
            autocompleteTo = new google.maps.places.Autocomplete(
              document.getElementById('autocompleteTo'), {types: ['(cities)'],componentRestrictions: { country: 'ind' }});
            autocompleteTo.setFields(['address_component']);
            
            autocompletePickup = new google.maps.places.Autocomplete(
              document.getElementById('autocompletePickup'), {types: ['geocode'],componentRestrictions: { country: 'ind' }});
            autocompletePickup.setFields(['address_component']);
            
            autocompleteDrop = new google.maps.places.Autocomplete(
              document.getElementById('autocompleteDrop'), {types: ['geocode'],componentRestrictions: { country: 'ind' }});
            autocompleteDrop.setFields(['address_component']);
            
            autocompleteFrom.addListener('place_changed', fillInAddressFrom);
            autocompleteTo.addListener('place_changed', fillInAddressTo);
            }
            
            function fillInAddressFrom() {
            // Get the place details from the autocomplete object.
            var place = autocompleteFrom.getPlace();
            
            // Get each component of the address from the place details,
            // and then fill-in the corresponding field on the form.
            for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            
            if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById('autocompleteFrom').value = val;
            }
            
            }
            }
            
            function fillInAddressTo() {
            // Get the place details from the autocomplete object.
            var place = autocompleteTo.getPlace();
            
            // Get each component of the address from the place details,
            // and then fill-in the corresponding field on the form.
            for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            
            if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById('autocompleteTo').value = val;
            }
            
            }
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
         <script>
            $.sessionTimeout({
              ignoreUserActivity: true,
				logoutUrl: 'logout',
                redirUrl: 'logout',
                warnAfter:  10000000,
                redirAfter: 20000000,
                countdownBar: true
            });
         </script>
         <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGaJzTK-DaGoGYtpIczt4bJ47z36HXpA&libraries=places&callback=initAutocomplete"
            async defer></script>

      </c:when>
   </c:choose>
  
  <script>    $(document).ready(function() {
			  
           
	  
      var tableload =  $('#customer_dataTable').DataTable();
	  tableload.draw();
	  }); 
     
      </script>
   </body>
</html>