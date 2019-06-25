<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
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
	  <meta name="_csrf" content="${_csrf.token}"/>
	  <meta name="_csrf_header" content="${_csrf.headerName}"/>
      <title>Trips List</title>
      <link href="static/css/adminpage.css" rel="stylesheet" media="screen">
	  <link href="static/css/jquery-ui.min.css" rel="stylesheet" media="screen">
	  <link href="static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <style>
	
	.my-col-count-style {
		  column-count: 2;
		  column-gap: 10px;
		}
		
		.my-col-count-style .panel {
		  display: inline-block;
		  width: 100%;
		}
		  .ui-autocomplete { 
            cursor:pointer; 
            height:120px; 
            overflow-y:scroll;
        } 
		th, td { white-space: nowrap; }
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
				  <div class="row-fluid" align="center">
                     <c:if test="${not empty success}">
                        <div class="alert alert-success" role="alert" style="padding-left: 5px;padding-right: 5px; width: 402px;height: 40px; padding-top: 10px; padding-bottom: 5px;">
                           ${success}
                        </div>
                     </c:if>
					  <c:if test="${not empty warning}">
                        <div class="alert alert-danger" role="alert" style="padding-left: 5px;padding-right: 5px; width: 552px;height: 40px; padding-top: 10px; padding-bottom: 5px;">
                           ${warning}
                        </div>
                     </c:if>
					 </div>
					  <c:choose>
                      <c:when test="${create||edit}">
                     <div class="col-lg-12">
                        <div id="containerPage" class="row-fluid">
						<div class="col-xs-12 selectpicker form-group" align="right">
									     <div class='input-group'>
								<a class="btn btn-default" href="<c:url value='/newtrip' />">
								<i class="fa fa-plus-square"></i>&nbsp;Add Trip</a>
								</div>
								</div><br>
                          
                                 <form:form method="POST" modelAttribute="trip" class="form-horizontal" name="formmain" id="formmain">
                                    <form:input type="hidden" path="id" id="id"/>
									 <c:choose>
									<c:when test="${create}">
									<form:input type="hidden" path="createuser" value="${loggedinuser}"/>
									</c:when>
									</c:choose>
									<c:choose>
									<c:when test="${edit}">
									<form:input type="hidden" path="updateuser" value="${loggedinuser}"/>									
									</c:when>
									</c:choose>
									
									<form:input type="hidden" path="temptripid" id="temptripid" value="${trip.temptripid}"/>
                                    <c:if test="${not empty success}">
                                       <div class="alert alert-success" role="alert">
                                          ${success}
                                       </div>
                                    </c:if>
                                    <div class = "panel panel-primary mypanel">
                                       <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">
                                             TRIP
                                          </h3>
                                       </div>
                                       <div class = "panel-body">
                                          <!---This is a Basic panel--->   
                                          <div class="form-group">
										  <div class="group">
                                             <label class="col-md-1 control-label">TRIP ID<sup>*</sup></label>
                                             <div class="col-lg-5">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input path="tripid" class="form-control" id="tripid" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
										   <div class="group">
                                             <label class="col-md-1 control-label">Date<sup>*</sup></label>
                                             <div class="col-lg-2">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                   <form:input placeholder="DD/MM/YYYY" class="form-control datetimepicker" path="tripdate" type="text" />
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
											 <label class="col-md-1 control-label">Time<sup>*</sup></label>
											  <div class="col-lg-2">
												 <div class="input-group">
													<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
													<form:input placeholder="--:--AM/PM" type="text" id="input_starttime" path="triptime" class="form-control timepicker"/>
												 </div>
											  </div>
											  </div>
											  
                                          </div>
                                          <div class="form-group">
										   <div class="group">
                                             <label class="col-md-1 control-label">From<sup>*</sup></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompleteFrom"  path="tripfrom" placeholder="Enter the From Location" onFocus="geolocate();" class="form-control" type="text"/>
                                                </div>
											 </div>
                                             </div>
											  <div class="group">
                                             <label class="col-md-1 control-label">To<sup>*</sup></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompleteTo" path="tripto" placeholder="Enter the To Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                                </div>
                                             </div>
											 </div>
                                          </div>
                                          <div class="form-group">
										   <div class="group">
											  <label class="col-md-1 control-label">Bookings<sup>*</sup></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                                   <form:input  placeholder="Enter the booking" path="bookings"   id="bookings" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                            </div>
										   <div class="group">
                                             <label class="col-md-1 control-label" style="leftpadding:0px">Type<sup>*</sup></label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
												   <c:choose>
                                                   <c:when test="${edit}">
												   
												   <form:select class="form-control" path="triptype" id="triptype" disabled="true">
												      <option value="">-Select-</option>
													  	<c:choose>
														<c:when test="${trip.triptype.equals('One way')}">
														<option value="One way" Selected>One way</option>
														</c:when>
														<c:otherwise><option value="One way">One way</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.triptype.equals('Round')}">
														<option value="Round" Selected>Round</option>
														</c:when>
														<c:otherwise><option value="Round">Round</option></c:otherwise>
														</c:choose>
                                                    </form:select>
													<form:input type="hidden" path="triptype" value="${trip.triptype}"/> 
													</c:when>
													<c:otherwise>
													<form:select class="form-control" path="triptype" id="triptype">
												      <option value="">-Select-</option>
													    <option value="One way">One way</option>
														<option value="Round">Round</option>
														 </form:select>
													</c:otherwise>
													</c:choose>
                                                </div>
                                             </div>
											 </div>
                                             <label class="col-md-1 control-label" style="leftpadding:0px">Days</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                   <form:input placeHolder="xxxx" type="text" class="form-control" path="tripdays"/>
                                                </div>
                                             </div>
											  
                                             
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Name</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                   <form:input  placeholder="Enter the Customer Name" path="customername"   id="customername" class="form-control"  type="text"/>
                                                </div>
                                             </div> 
											 <div class="group">
                                             <label class="col-md-1 control-label">Phone</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                   <form:input  placeholder="XXXXXXXXX" path="customerphone"   id="customerphone" class="form-control"  type="text"/>
                                                </div>
                                             </div></div>

                                            
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Pickup</label>
                                             <div class="col-md-9  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompletePickup"  path="pickup" placeholder="Enter the Pickup Location" onFocus="geolocate();" class="form-control" type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-md-1 control-label">Drop</label>
                                             <div class="col-md-9  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                   <form:input id="autocompleteDrop" path="drop" placeholder="Enter the Drop Location" onFocus="geolocate();" class="form-control"  type="text"/>
                                                </div>
                                             </div>
                                          </div>
                                           <div class="form-group">
										   <div class="group">
                                             <label class="col-md-1 control-label">Driver</i></label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                   <form:input  placeholder="Enter the Driver Name" path="tripdriver"   id="tripdriver" class="form-control"  type="text"/>
                                                </div>
                                             </div></div>
											 <div class="group">
                                             <label class="col-md-1 control-label">Phone</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                   <form:input  placeholder="XXXXXXXXX" path="driverphone"   id="middle_initial" class="form-control"  type="text"/>
                                                </div>
                                             </div>
											</div>
                                            
                                          </div>
                                          <div class="form-group">
										   <div class="group">
                                             <label class="col-md-1 control-label">Vehicle</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-car"></i></span>
												    <form:input  placeholder="Enter the Vehicle Name" path="tripvehicle"   id="tripvehicle" class="form-control"  type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
											 <label class="col-md-1 control-label">Type</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-car"></i></span>
													<form:select class="form-control" path="vehicletype" id="vehicletype">
												      <option value="">-Select-</option>
													  	<c:choose>
														<c:when test="${trip.vehicletype.equals('Hatchback')}">
														<option value="Hatchback" Selected>Hatchback</option>
														</c:when>
														<c:otherwise><option value="Hatchback">Hatchback</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.vehicletype.equals('Sedan')}">
														<option value="Sedan" Selected>Sedan</option>
														</c:when>
														<c:otherwise><option value="Sedan">Sedan</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.vehicletype.equals('SUV')}">
														<option value="SUV" Selected>SUV</option>
														</c:when>
														<c:otherwise><option value="SUV">SUV</option></c:otherwise>
														</c:choose>
                                                    </form:select>
                                          </div>
										  </div>
										  </div>
										   </div>
                                        <div class="form-group">
											<div class="group">
                                             <label class="col-md-1 control-label">Open</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                   <form:input  placeholder="Open in kms" path="openkm" id="openkm" class="form-control"  type="text"/>
                                                </div>
                                             </div>
											 </div>
											 <div class="group">
                                             <label class="col-md-1 control-label">Close</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                   <form:input  placeholder="Close in kms" path="closekm" id="closekm" class="form-control"  type="text"/>
                                                </div>
                                             </div>
											 </div>
											 <div class="group">                                              
                                             <label class="col-md-1 control-label">Running</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                   <form:input  placeholder="Running Kms" path="runningkm" id="runningkm" class="form-control"  type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											 <div class="group">
                                              <label class="col-md-1 control-label">OTP</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                   <form:input  placeholder="Starting OTP" path="startingotp" class="form-control"  type="text"/>
                                                </div>
                                          </div>
										  </div>
											 
										  </div>
										  <div class="form-group">
										   <div class="group">                                              
                                             <label class="col-md-1 control-label">Limit</label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-tachometer"></i></span>
                                                   <form:input  placeholder="Limit Kms" path="limitkm" id="limitkm" class="form-control"  type="text"/>
                                                </div>
												 </div>
												  </div>

                                           

											 <div class="group">
											  <label class="col-md-1 control-label">Extra/km</i></label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input  placeholder="Extra/km" path="extrakm" class="form-control"  type="text"/>
                                                </div>
                                          </div>
										  </div>
										  
											<div class="group">
										  <label class="col-md-1 control-label" >Follow-up<sup>*</sup></i></label>
                                             <div class="col-md-2  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
												   <form:select class="form-control" path="followup"><form:option value="" label="--- Select---"></form:option><form:options items="${loadUsers}" itemValue="ssoId" itemLabel="ssoId" class="form-control" ></form:options>
													</form:select>
                                                   </div>
                                             </div>
											 </div>
											  <div class="group">
											  <label class="col-md-1 control-label">Status</label>
                                             <div class="col-md-2  inputGroupContainer">
											
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-info"></i></span>
												    <form:select class="form-control" path="status" id="status">
												      <option value="">-Select-</option>
													  	<c:choose>
														<c:when test="${trip.status.equals('New')}">
														<option value="New" Selected>New</option>
														</c:when>
														<c:otherwise><option value="New">New</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.status.equals('Cancelled')}">
														<option value="Cancelled" Selected>Cancelled</option>
														</c:when>
														<c:otherwise><option value="Cancelled">Cancelled</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.status.equals('Trip-Ready')}">
														<option value="Trip-Ready" Selected>Trip-Ready</option>
														</c:when>
														<c:otherwise><option value="Trip-Ready">Trip-Ready</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.status.equals('Running')}">
														<option value="Running" Selected>Running</option>
														</c:when>
														<c:otherwise><option value="Running">Running</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.status.equals('Trip-Complete')}">
														<option value="Trip-Complete" Selected>Trip-Complete</option>
														</c:when>
														<c:otherwise><option value="Trip-Complete">Trip-Complete</option></c:otherwise>
														</c:choose>
														<c:choose>
														<c:when test="${trip.status.equals('Settled')}">
														<option value="Settled" Selected>Settled</option>
														</c:when>
														<c:otherwise><option value="Settled">Settled</option></c:otherwise>
														</c:choose>
                                                    </form:select>
                                                    
													
                                                </div>
												</div>
												</div>
										 
										  
										  </div>
										
										 
											

										  
                                          <div class="form-group">
										<label class="col-md-6 control-label"></label>
										
										   <div class="group">
										  <label class="col-md-3 control-label">Trip Amount</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
												   <form:input  placeholder="Trip Amount in Rs" path="tripamount" id="tripamount" class="form-control"  type="number" min="0"/>
												   
                                                </div>
                                          </div>
										 </div>
										
                                             
                                          </div>
										  <div class="form-group">
										  <label class="col-md-6 control-label"></label>
										   <div class="group">
										  <label class="col-md-3 control-label">Extra Charge</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input  placeholder="Extra Charge in Rs" path="extracharge" id="extracharge" class="form-control" type="number" min="0" />
                                                </div>
                                          </div>
										  </div>
                                       </div>
									   <div class="form-group">
									   <label class="col-md-6 control-label"></label>
										   <div class="group">
										  <label class="col-md-3 control-label">Night Charge</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input  placeholder="Night Charge in Rs" path="nightcharge" id="nightcharge" class="form-control"  type="number" min="0"/>
                                                </div>
                                          </div>
										  </div>

										  </div>
										   <div class="form-group">
										   <label class="col-md-6 control-label"></label>
										  <div class="group">
										  <label class="col-md-3 control-label">OutSource Amount</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input  placeholder="OutSource Amount in Rs" path="osamount" id="osamount" class="form-control"  type="number" min="0"/>
                                                </div>
                                          </div>
										 </div>
										 </div>
										  

											<div class="form-group">
										  <label class="col-md-6 control-label"></label>
												<div class="group">
										  <label class="col-md-3 control-label">Total Amount</label>
                                             <div class="col-md-3  inputGroupContainer">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input  placeholder="Total Amount in Rs" path="totalamount" id="totalamount" class="form-control"  type="text" readOnly="true"/>
                                                </div>
                                          </div>
										 </div>

										 
										  </div>
										  <div class="form-group">
                                           <label class="col-md-1 control-label">Comments</label>
                                             <div class="col-md-5  inputGroupContainer">
                                                <div class="input-group">
                                                   <form:textarea class="form-control" path="comments" placeholder="Enter the remarks here..." style="margin:0px;width:670px;height:50px;" rows="2" id="comment"></form:textarea>
                                                </div>
                                             </div>
										
											

										  
										  </div>

                                    </div>

                                    <div class="row">
                                       <div align="center">
                                          <c:choose>
                                             <c:when test="${edit}">
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-refresh"></i>&nbsp;Update</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="< c:url value='/triplist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:when>
                                             <c:otherwise>
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i>&nbsp;Save</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="<c:url value='/triplist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:otherwise>
                                          </c:choose>
                                       </div>
                                    </div>
                        </div>
                        </form:form>
						 </div>
						 </div>
                        </c:when>
                        </c:choose>
						 <c:choose>
                      <c:when test="${browse}">
                     <div class="col-lg-12">
                        <div id="containerPage" class="row-fluid">
                          <div class="col-xs-12 selectpicker form-group" align="right">
									     <div class='input-group'>
								<a class="btn btn-default" href="<c:url value='/newtrip' />">
								<i class="fa fa-plus-square"></i>&nbsp;Add Trip</a>
								</div>
								</div><br>
                                   <div class = "panel panel-primary mypanel">
                                       <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">
                                             TRIP
                                          </h3>
                                       </div>
									   
                                       <div class = "panel-body">
									 
  <div class="row">
    <div class="my-col-count-style">
      <div class="panel panel-default">
         <div class="panel-body">
          <dl  class="dl-horizontal">                        		
								<dt>TRIP ID:</dt><dd>${trip.tripid}<input type="hidden" id="tripsid" value="${trip.tripid}"/></dd>
								<dt>Date:</dt><dd>${trip.tripdate}<input type="hidden" id="dateoftrip" value="${trip.tripdate}"/></dd>
								<dt>Time:</dt><dd>${trip.triptime}<input type="hidden" id="timeoftrip" value="${trip.triptime}"/></dd>
								<dt>From:</dt><dd>${trip.tripfrom}<input type="hidden" id="fromtrip" value="${trip.tripfrom}"/></dd>
								<dt>To:</dt><dd>${trip.tripto}<input type="hidden" id="totrip" value="${trip.tripto}"/></dd>
								<dt>Bookings:</dt><dd>${trip.bookings}</dd>
								<dt>Pickup:</dt><dd>${trip.pickup}<input type="hidden" id="trippickup" value="${trip.pickup}"/></dd>
								<dt>Drop:</dt><dd>${trip.drop}<input type="hidden" id="tripdrop" value="${trip.drop}"/></dd>
								<dt>Trip Type:</dt><dd>${trip.triptype}</dd>
								<dt>Trip Days:</dt><dd>${trip.tripdays}</dd>
								<dt>Customer:</dt><dd>${trip.customername}<input type="hidden" id="customername" value="${trip.customername}"/></dd>
								<dt>Mobile:</dt><dd>${trip.customerphone}<input type="hidden" id="customermobile"  value="${trip.customerphone}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="btn-sendsms" class="btn btn-primary btn-sm">Send SMS</button><div id="feedback"></div></dd>
								<dt>Driver:</dt><dd>${trip.tripdriver}<input type="hidden" id="drivername" value="${trip.tripdriver}"/></dd>
								<dt>Mobile:</dt><dd>${trip.driverphone}<input type="hidden" id="drivermobile" value="${trip.driverphone}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="btn-sendsmsdriver" class="btn btn-primary btn-sm">Send SMS</button><div id="feedbackdriver"></div></dd>
							
								
								</dl>
        </div>
      </div>

	  <div class="panel panel-default">
        
        <div class="panel-body">
           <dl  class="dl-horizontal">                        		
								<dt>Follow-up:</dt><dd>${trip.followup}</dd>
								<dt>Status:</dt><dd>${trip.status}</dd>
								
								</dl>
        </div>
      </div>
      
     
      <div class="panel panel-default">
        
        <div class="panel-body">
           <dl  class="dl-horizontal">
								<dt>Vehicle:</dt><dd>${trip.tripvehicle}<input type="hidden" id="vehicle" value="${trip.tripvehicle}"/></dd>
								<dt>Vehicle Type:</dt><dd>${trip.vehicletype}</dd>
								<br>
								<dt>Open KM:</dt><dd>${trip.openkm}</dd>
								<dt>Close KM:</dt><dd>${trip.closekm}</dd>
								<dt>Running KM:</dt><dd>${trip.runningkm}</dd>
								<dt>Limit KM:</dt><dd>${trip.limitkm}</dd>
								<dt>Extra/KM:</dt><dd>${trip.extrakm}</dd>
								<dt>OTP:</dt><dd>${trip.startingotp}</dd>
								<br>
								<dt>Trip Amount:</dt><dd align="right" style="width:45px">${trip.tripamount}</dd>
								<dt>Extra Charge:</dt><dd align="right" style="width:45px">${trip.extracharge}</dd>
								<dt>Night Charge:</dt><dd align="right" style="width:45px">${trip.nightcharge}</dd>
								<dt>O/S Amount:</dt><dd align="right" style="width:45px">${trip.osamount}</dd>
								<dt>Total Amount:</dt><dd align="right" style="width:45px">${trip.totalamount}</dd>
								</dl>
        </div>
      </div>
	   <div class="panel panel-default">
        
        <div class="panel-body">
           <dl  class="dl-horizontal">  
		                         
								<dt>Comments:</dt><dd><pre>${trip.comments}</pre></dd>
								</dl>
        </div>
      </div>

	  
	  

    </div>
  </div>

								
                                          

                                    <div class="row">
                                       <div align="center">
                                          <c:choose>
                                             <c:when test="${browse}">
                                                <a href="<c:url value='/edit-trip-${trip.id}'/>" role="button" class="btn btn-success btn-sm"><i class="fa fa-edit"></i>&nbsp;Edit</a>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="< c:url value='/triplist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:when>
                                             <c:otherwise>
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i>&nbsp;Save</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="<c:url value='/triplist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:otherwise>
                                          </c:choose>
                                       </div>
                                    </div>
                        </div>
                      
						 </div>
						 </div>
						 <div class="row-fluid">
                        <div class="col-12">
						  <div id="containerPage" class="row-fluid">
						  <div>
		<div class="form-group">
		<div class="col-6 col-md-6 col-lg-8 col-xl-9 normal-text-font m-0 p-0">
		<c:if test="${not empty trip.createdate}">
		<b>Created on </b>${trip.createdate}&nbsp;<b>by  </b>${trip.createuser}
		</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${not empty trip.updateuser}">
		
		<b>Updated on </b>${trip.updatedate}&nbsp;<b>by  </b>${trip.updateuser}
	</c:if>
</div></div></div></div></div></div></div>

                        </c:when>
                        </c:choose>
						
                    
                     <c:choose>
                     <c:when test="${search}">
					 <div class="row-fluid">
                        <div class="col-lg-12">
						  <div id="containerPage" class="row-fluid">
                           <div class="panel panel-primary mypanel">
                            <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">TRIPS</h3></div>
                              <div class = "panel-body">
                                 <div class="col-xs-3 selectpicker form-group">
								   <label></label>
                                    <div class='input-group'>
									<button id="btnExport"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;Excel</button>
                                      <label></label>
                                       <span >
                                       <span ></span>
                                       </span>
                                    </div></div>
									<div class="col-xs-3 selectpicker form-group">
                                    <label>From Date:</label>
                                    <div class='input-group date' id="datetimepicker1">
                                       <input type='text' class="form-control" id="mindate" />
                                       <span class="input-group-addon">
                                       <span class="glyphicon glyphicon-calendar"></span>
                                       </span>
                                    </div>
                                 </div>
                                 <div class="col-xs-3 selectpicker form-group">
                                    <label>To Date:</label>
                                    <div class='input-group date' id="datetimepicker2">
                                       <input type='text' class="form-control" id="maxdate"/>
                                       <span class="input-group-addon">
                                       <span class="glyphicon glyphicon-calendar"></span>
                                       </span>
                                    </div>
                                 </div>
								  <div class="col-xs-3 selectpicker form-group" align="right">
								  <label></label>
                                    <div class='input-group'>
								<a class="btn btn-default" href="<c:url value='/newtrip' />">
								<i class="fa fa-plus-square"></i>&nbsp;Add Trip</a>
								</div>
								</div>
								   <table class="table table-list-search table-striped table-bordered  dt-responsive table-hover dt-responsive display nowrap" id="customer_dataTable">
                                    <thead>
                                       <tr>
                                          <th>TRIP ID</th>
                                          <th>Date</th>
										  <th>Time</th>
                                          <th>From</th>
                                          <th>To</th>
                                          <th>Customer</th>
										  <th>Mobile</th>
                                          <th>Driver</th>
                                          <th>Vehicle</th>
										  <th>Type</th>
                                          <th>Status</th>
										  <th>Action</th>
                                         
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
											 <td>${trip.customerphone}</td>
                                             <td>${trip.tripdriver}</td>
                                             <td>${trip.tripvehicle}</td>
											  <td>${trip.vehicletype}</td>
                                             <td>${trip.status}</td>
											 
                                                <td>
                                                   <a data-toggle="tooltip" data-placement="bottom" title="View" href="<c:url value='/browse-trip-${trip.id}' />" class="btn btn-primary custom-width btn-sm"><i class="fa fa-eye"></i></a>&nbsp;
												   <c:if test="${trip.status == 'Settled'}">
												   <a data-toggle="tooltip" data-placement="bottom" id="payment" title="Payment" href="<c:url value='/browse-paymenttrip-${trip.tripid}'/>" onclick="return confirm('Ae you sure want to view the payments?')" class="btn btn-info custom-width btn-sm"><i class="fa fa-money"></i></a>
												   </c:if>
                                                   </td>
                                             
                                            
                                             
                                          </tr>
                                       </c:forEach>
                                    </tbody>
                                 </table>
								  
                              </div>
                           </div>
						   <div class="row">										
										<div class="col-12 my-auto"><span style="color:lightgrey">&#9607;</span>&nbsp;New&nbsp;<span style="color:	lightblue">&#9607;</span>&nbsp;Running
										&nbsp;<span style="color:yellow">&#9607;</span>&nbsp;Trip-Complete
										&nbsp;<span style="color:#FF69B4">&#9607;</span>&nbsp;Trip-Ready
										&nbsp;<span style="color:red">&#9607;</span>&nbsp;Cancelled
										&nbsp;<span style="color:lightgreen">&#9607;</span>&nbsp;Settled
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
   <script src="static/js/bootstrap-datetimepicker.min.js"></script>
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
  <c:if test = "${edit}">
  <sec:authorize access="hasRole('USER') and (!hasRole('ADMIN') or !hasRole('DBA'))">
  <script>
  if( $('#tripamount').val() > 0)
	$('#tripamount').prop('readonly', true);
  if( $('#extracharge').val() > 0)
	$('#extracharge').prop('readonly', true);
  if( $('#nightcharge').val() > 0)
	$('#nightcharge').prop('readonly', true);
  if( $('#osamount').val() > 0)
	 $('#osamount').prop('readonly', true);
  </script>
  </sec:authorize>
  </c:if>
     <script>
	 var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ready(function() {
        AutoCompletedriver();
		AutoCompletebook();
		AuotCompletevehicle();
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
            minLength: 1,
            scroll: true
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
    }
	function AutoCompletebook() {

		var bookings = ["Self"];

		 $('#bookings').autocomplete({
            source: bookings,
			minLength: 1,
            scroll: true
			
                 
        }).focus(function() {
            $(this).autocomplete("search", "");
			
        });


		
    }

	 function AuotCompletevehicle() {

		var vehicles = [<c:forEach items="${loadVehicles}" var="vehicle" varStatus="totalCount">
               
         "${vehicle.regNo}"
         <c:if test="${totalCount.count lt fn:length(loadVehicles)}">
          <c:out value=",">
          </c:out>
          </c:if>      
      
      </c:forEach>
		  ];
        $('#tripvehicle').autocomplete({
            source: vehicles,
            minLength: 1,
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
	   $("#customer a").click(function() {
        alert('SMS Ready');
    });

	   $("#triptype").change(function() {
		   var d = new Date();
		   var today = new Date();
		   var dd = today.getDate();
		   var mm = today.getMonth() + 1;
   		   var yyyy = today.getFullYear().toString().substr(-2);
		   if (dd < 10) {
			  dd = '0' + dd;
			} 
			if (mm < 10) {
			  mm = '0' + mm;
			} 
		  var today = dd + '' + mm + '' + yyyy;
		   var types;
		  if(this.value === 'Round')
				types = 'ROU';
		  else
				types = 'ONE';
		  var tripsid = $('#temptripid').val();
		  var userInput = $('#tripid').val(types+''+today+''+tripsid);
		  $('#formmain').formValidation('revalidateField', 'tripid');
	 });
      $('#customer_dataTable').DataTable({
               					
                "searching": true,
			   	"bDestroy": true,
				"bDeferRender": true,
				 "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
                    
					if ( aData[10] == "Running" ) {
                        $('td', nRow).css('background-color', 'lightblue');
                    } else if ( aData[10] == "Cancelled" ) {
                        $('td', nRow).css('background-color', 'Red');
                    }  else if ( aData[10] == "Trip-Complete" ) {
                        $('td', nRow).css('background-color', 'yellow');
                    }  else if ( aData[10] == "New" ) {
                        $('td', nRow).css('background-color', 'lightgrey');
                    } else if ( aData[10] == "Trip-Ready" ) {
                        $('td', nRow).css('background-color', '#FF69B4');
                    }  else if ( aData[10] == "Settled" ) {
                        $('td', nRow).css('background-color', 'lightgreen');
                    }
                    
                },
				 "order": [[ 1, "asc" ]],
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
			   var tripid = data[0];
              var createdAt = data[1]; // Our date column in the table
			  var status = data[10];
              //createdAt=createdAt.split(" ");
              var startDate   = moment(min, "DD/MM/YYYY");
              var endDate     = moment(max, "DD/MM/YYYY");
              var diffDate = moment(createdAt, "DD/MM/YYYY");

			  if(tripid.includes('ROU') && status !='Settled' && status !='Trip-Complete' && status !='Cancelled'){
				  return true;
			  }
              
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

			   $("#btnExport").click(function(e) 
				{
				$('#All').on( 'click', function () {
					table.page.len( -1 ).draw();
				} );
				$('#10').on( 'click', function () {
					table.page.len( 10 ).draw();
				} );
				$('#25').on( 'click', function () {
					table.page.len( 25 ).draw();
				} );
				$('#50').on( 'click', function () {
					table.page.len( 50 ).draw();
				} );
				$('#100').on( 'click', function () {
					table.page.len( 100 ).draw();
				} );
			
				download("Export.xls");

			    setTimeout(function(){table.page.len(10).draw();}, 1000)
				e.preventDefault();
      
     });
      
          });
		  function download(filename) {
			  var element = document.createElement('a');
			  element.setAttribute('href', 'data:application/vnd.ms-excel,' +encodeURIComponent($('#customer_dataTable').parent().html()));
			  element.setAttribute('download', filename);

			  element.style.display = 'none';
			  document.body.appendChild(element);

			  element.click();

			  document.body.removeChild(element);
         }

	
          
       jQuery(function() {
        if(jQuery(".datetimepicker") != null && jQuery(".datetimepicker").length) {
        jQuery(".datetimepicker")
        .datepicker({
        autoclose: true,			
        todayHighlight: true,
        format: "dd/mm/yyyy"			
        }).on('changeDate show', function(e) {
    	      $('#formmain').formValidation('revalidateField', 'tripdate');
    	    });
        }
        
        
        });

	jQuery(function() {

      jQuery('#input_starttime').datetimepicker({
          format: 'LT'

      }).on('dp.change dp.show', function(e) {
    	      $('#formmain').formValidation('revalidateField', 'triptime');
    	    });
      });
           
        
        
        $(document).ready(function() {
        	 $('#formmain').formValidation({
        	    framework: 'bootstrap',
        	    icon: {
				 validating: 'glyphicon glyphicon-refresh'
        	    },
        	    fields: {
					tripid:{
						 group: '.group',
						validators: {
						  notEmpty: {
							message: 'TRIP ID is required. Please select the trip type'
						  }
						}
					  },
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
						  }
						 }
					  },
				   bookings:{
						group: '.group',
						validators: {
						  notEmpty: {
							message: 'Booking is required'
						  }
						 }
					  
					  },
        	       tripfrom: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          notEmpty: {
          	    	            message: 'From is required'
          	    	          }
          	    	          
          	    	        }
          	    	      },
					tripto: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          notEmpty: {
          	    	            message: 'To is required'
          	    	          }
          	    	          
          	    	        }
          	    	      },
					triptype: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          notEmpty: {
          	    	            message: 'Trip type is required'
          	    	          }
          	    	          
          	    	        }
          	    	      },
					customerphone: {
            	    		   group: '.group',
              	    		 	validators: {
              	    		 	phone: {
                                        country: 'IN',
                                        message: 'The value is not valid customer phone number'
                                    }
              	    	          
              	    	        }
              	    	      },
					
					driverphone: {
                             group: '.group',
          	    		 	 validators: {
          	    	          phone: {
                                        country: 'IN',
                                        message: 'The value is not valid driver phone number'
                                    }
          	    	          
          	    	        }

							  },

					 followup: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          notEmpty: {
          	    	            message: 'Follow-up is required'
          	    	          }
          	    	          
          	    	        }
          	    	      },
					 status: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          notEmpty: {
          	    	            message: 'Status is required'
          	    	          }
          	    	          
          	    	        }
          	    	      },
					openkm: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Open KM must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					 closekm: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Close KM must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					 limitkm: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Limit KM must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					 runningkm: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Running KM must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					osamount: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Outsource amount must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					extrakm: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Extra KM must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
				 extracharge: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Extra Charge must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					totalamount: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Total Amount must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					nightcharge: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Night Charge must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
					startingotp: {
						  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Starting OTP must be a number'
                                    }
          	    	          
          	    	        }

						  },
					tripamount: {
						 group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Trip Amount must be a number'
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

		$(document).ready(function() {
			if($("#totalamount").length){
				$("#extracharge").keyup(function() {
					$.subtract();          
				});
				$("#nightcharge").keyup(function() {
					$.subtract();          
				});
				$("#osamount").keyup(function() {
					$.subtract();          
				});
				$("#tripamount").keyup(function() {
					$.subtract();          
				});
				$("#osamount").keyup(function() {
					$.subtract();          
				});
			}
				$.subtract = function(){
					var tripamt =0,extrachrg = 0, nightchrg=0, osamt=0; 
					if($("#tripamount").val().length>0 && $("#tripamount").val() != 'NaN'){
						tripamt = parseInt($("#tripamount").val());
						$("#totalamount").val(tripamt);
					}
					if($("#extracharge").val().length>0 && $("#extracharge").val() != 'NaN'){
						extrachrg = parseInt($("#extracharge").val());
						$("#totalamount").val(tripamt+extrachrg);
					}

					if($("#nightcharge").val().length>0 && $("#nightcharge").val() != 'NaN'){
						nightchrg = parseInt($("#nightcharge").val());
						$("#totalamount").val(tripamt+nightchrg + extrachrg);
					} 
					if($("#osamount").val().length>0 && $("#osamount").val() != 'NaN'){
						osamt = parseInt($("#osamount").val());
						$("#totalamount").val((tripamt+nightchrg + extrachrg)-osamt);
					} 
					if(($("#nightcharge").val().length==0 && $("#nightcharge").val() != 'NaN') && ($("#extracharge").val().length==0 && $("#extracharge").val() != 'NaN') && ($("#tripamount").val().length==0 && $("#tripamount").val() != 'NaN')
						&&  (($("#osamount").val() != 'NaN') && ($("#osamount").val().length==0 ))){
						$("#totalamount").val('');
					}
				}
				});
      
			$(document).ready(function() {
			if($("#runningkm").length){

				$("#openkm").keyup(function() {
					$.sum();          
				}); 
				 
				$("#closekm").keyup(function() {
					$.sum();          
				}); 
			 }   
				$.sum = function(){
					var opnkm = 0,clokm=0; 
					if($("#openkm").val().length>0 && $("#openkm").val() != 'NaN')
						opnkm = parseInt($("#openkm").val());

					if($("#closekm").val().length>0 && $("#closekm").val() != 'NaN'){
						closkm = parseInt($("#closekm").val());
						$("#runningkm").val(closkm - opnkm);
					} else{
						$("#runningkm").val('');
					}
				}

			


			
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

	 /* $('#payment').on( 'click', function () {
		confirm('Do you want to view the payment details?');
		});*/
	 
	  }); 
	  
	  
     
      </script>
	  <script>
 jQuery(document).ready(


 function($) {

var drivername = $('#drivername').val();
var drivermobile = $('#drivermobile').val();
var customername = $('#customername').val();
var customermobile = $('#customermobile').val();
var dateoftrip = $('#dateoftrip').val();
var timeoftrip = $('#timeoftrip').val();
var fromtrip = $('#fromtrip').val();
var totrip = $('#totrip').val();
var tripsid = $('#tripsid').val();
var vehicle = $('#vehicle').val();

var search = {}
		search["drivername"] = drivername;
		search["drivermobile"] = drivermobile;
		search["customername"] = customername;
		search["customermobile"] = customermobile;
		search["dateoftrip"] = dateoftrip;
		search["timeoftrip"] = timeoftrip;
		search["fromtrip"] = fromtrip;
		search["totrip"] = totrip;
		search["tripsid"] = tripsid;
		search["vehicle"] = vehicle;


	  $("#btn-sendsms").click(function(event) {  
		  
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "sendsmstocustomer",
				 beforeSend: function( xhr ) {
					  xhr.setRequestHeader(header, token);
					  xhr.setRequestHeader("Content-Type","application/json");
					  xhr.setRequestHeader("Accept","application/json");
		},
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				display(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				
			}
		});

		

		 
		});

        
	

  });
jQuery(document).ready(
  function($) {
	var drivername = $('#drivername').val();
var drivermobile = $('#drivermobile').val();
var customername = $('#customername').val();
var customermobile = $('#customermobile').val();
var dateoftrip = $('#dateoftrip').val();
var timeoftrip = $('#timeoftrip').val();
var fromtrip = $('#fromtrip').val();
var totrip = $('#totrip').val();
var tripsid = $('#tripsid').val();
var vehicle = $('#vehicle').val();
var pickup = $('#trippickup').val();

var search = {}
		search["drivername"] = drivername;
		search["drivermobile"] = drivermobile;
		search["customername"] = customername;
		search["customermobile"] = customermobile;
		search["dateoftrip"] = dateoftrip;
		search["timeoftrip"] = timeoftrip;
		search["fromtrip"] = fromtrip;
		search["totrip"] = totrip;
		search["tripsid"] = tripsid;
		search["vehicle"] = vehicle;
		search["pickup"] = pickup;



	  $("#btn-sendsmsdriver").click(function(event) {  
		  
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "sendsmstodriver",
				 beforeSend: function( xhr ) {
					  xhr.setRequestHeader(header, token);
					  xhr.setRequestHeader("Content-Type","application/json");
					  xhr.setRequestHeader("Accept","application/json");
		},
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				displaydriver(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				displaydriver(e);
			},
			done : function(e) {
				console.log("DONE");
				
			}
		});

		

		 
		});

        
	

  });

  function display(data) {
		var obj = data;
		var json = "<h5>"+obj.msg+"</h5>";
		$('#feedback').html(json);
	}

	 function displaydriver(data) {
		var obj = data;
		var json = "<h5>"+obj.msg+"</h5>";
		$('#feedbackdriver').html(json);
	}
</script>

   </body>
</html>