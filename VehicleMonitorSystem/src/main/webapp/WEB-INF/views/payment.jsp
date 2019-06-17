<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<title>Payments</title>
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
						<div class="alert alert-success" role="alert">
							${success}
						</div>
					</c:if>
				<br>
				<c:choose>
				 <c:when test="${create||edit}">
                     <div class="col-lg-12">
                        <div id="containerPage" class="row-fluid">
						<div class="col-xs-12 selectpicker form-group" align="right">
									     <div class='input-group'>
								<a class="btn btn-default" href="<c:url value='/newtrip' />">
								<i class="fa fa-plus-square"></i>&nbsp;Add Payment</a>
								</div>
								</div><br>
                          
                                 <form:form method="POST" modelAttribute="payment" class="form-horizontal" name="formmain" id="formmain">
                                    <form:input type="hidden" path="paymentsid" id="paymentsid"/>
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
									
								
                                    <c:if test="${not empty success}">
                                       <div class="alert alert-success" role="alert">
                                          ${success}
                                       </div>
                                    </c:if>
                                    <div class = "panel panel-primary mypanel">
                                       <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">
                                             PAYMENT
                                          </h3>
                                       </div>
                                       <div class = "panel-body">
                                          <!---This is a Basic panel--->   
                                          <div class="form-group">
										  <div class="group">
                                             <label class="col-md-3 control-label">TRIP ID</label>
                                             
											 </div>
											   <div class="group">
                                             <label class="col-md-3 control-label">TRIP Amount</label>
                                             
											 </div>
											 <label class="col-md-3 control-label">Income</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="income" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											 </div>
											 <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid1" type="text"/><div id="feedback"></div>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount1" type="text"/>
                                                </div>
                                             </div>
											 </div>	
											  <label class="col-md-3 control-label">TRIP Advance</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripadvance" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                         <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid2" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount2" type="text"/>
                                                </div>
                                             </div>
											 </div>	
											 <label class="col-md-3 control-label">Driver Bata</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="driverbata" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid3" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount3" type="text"/>
                                                </div>
                                             </div>
											 </div>
											 <label class="col-md-3 control-label">Toll Expense</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tollexpenses" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid4" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount4" type="text"/>
                                                </div>
                                             </div>
											 </div>		
											 <label class="col-md-3 control-label">Food</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="food" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid5" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount5" type="text"/>
                                                </div>
                                             </div>
											 </div>
											 <label class="col-md-3 control-label">Diesel</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="diesel" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                        <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid6" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount6" type="text"/>
                                                </div>
                                             </div>
											 </div>
											 <label class="col-md-3 control-label">Other</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="other" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid7" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount7" type="text"/>
                                                </div>
                                             </div>
											 </div>									  				
											 <label class="col-md-3 control-label">Total Expenses</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" type="text" id="totalexpenses"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                       <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid8" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount8" type="text"/>
                                                </div>
                                             </div>
											 </div>
											 <label class="col-md-3 control-label">Total Amount</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="totalamount" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
										  <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid9" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount9" type="text"/>
                                                </div>
                                             </div>
											 </div>									  				
											  
                                          </div>
										  <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <input class="form-control" id="tripid10" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <input class="form-control" id="tripamount10" type="text"/>
                                                </div>
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
				 <c:when test="${search}">
					<div  style="padding-left:20px;padding-right:5px;width:100%;max-height: 90vh;" >
						<div id="containerPage" class="well">
							<div class="container-fluid">
								<td>
								<table style="width: 1100px;">
								<tr>
								<td width="20%">  
									<div class="form-group has-feedback">
										<input class="form-control" id="system-search" placeholder="Search for">
										<i class="glyphicon glyphicon-search form-control-feedback"></i>
									</div>
								</td> 
								<td><div align="center"><h4 class="page-title">Payments</h4></div></td>
								<td width="20%">
									<a class="btn btn-default pull-right" href="<c:url value='/newpayment' />"><i class="fa fa-user-plus"></i>&nbsp;Add Payment</a>
								</td>
								</tr>
								</table>
								</td>
							</div>
							<div class="container-fluid">
								<table class="table table-list-search table-hover" id="customer_dataTable">
								<thead>
								<tr>
								<th>TRIP ID</th>
								<th>Vehicle</th>
								<th>Driver</th>
								<th>Amount</th>
								<th>Expenses</th>
								<th>Paid Amount</th>
								 
								</tr>
								</thead>
								<tbody>
								   <c:forEach items="${payments}" var="payments">
								   <tr>
								   <td></td>
								   <td></td>
								   <td></td>
								   <td></td>
								   <td></td>
								   <td></td>
								   	</tr>
								 </c:forEach>
								</tbody>
								</table>
							</div>
						</div>
					</div>
			
				 </c:when>
                        </c:choose>
				
				</div>
					</div>
				
			 </div>
			</div>
			
			<div id="dashboard" class="tab-pane fade"><h3>Dashboard 1</h3></div>
			<div id="track" class="tab-pane fade">
			<jsp:include page="include_Track_Sidemenu.jsp" />  
			<div id="page-wrapper">
             
            </div> </div>
		

<div id="report" class="tab-pane fade">
            <h3>Report</h3>
         </div>
      </div>
   </div>
    

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
<script type="text/javascript">
 var token = $("meta[name='_csrf']").attr("content");
 var header = $("meta[name='_csrf_header']").attr("content");
 $(document).ready(function() {
        AutoCompletepayment();
		
    });

    function AutoCompletepayment() {

		var trips = [<c:forEach items="${loadTrips}" var="trip" varStatus="totalCount">
               
         "${trip.tripid}"
         <c:if test="${totalCount.count lt fn:length(loadTrips)}">
          <c:out value=",">
          </c:out>
          </c:if>      
      
      </c:forEach>
		  ];
        $('#tripid1').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
						 console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid2').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
						 console.log("${trip.tripamount}");
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid3').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
						 console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid4').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid5').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid6').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid7').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid8').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid9').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
		   $('#tripid10').autocomplete({
            source: trips,
            minLength: 1,
            scroll: true,
			select: function (event, ui) 
                    {
                         label = ui.item.label;
                         value = ui.item.value;
                         console.log(value);
					}
        }).focus(function() {
            $(this).autocomplete("search", "");
        });
    }
	
$(function () {
   $('#lastName').datetimepicker({
    language:  'en',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});
 });

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
</script>
 <script>

 jQuery(document).ready(

 function($) {

  $("#tripid1").blur(function(event) { 
  var search = {}
		search["tripid1"] = document.getElementById("tripid1").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount1",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount1").val(json);
				 $('#tripamount1').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid2").blur(function(event) { 
  var search = {}
		search["tripid2"] = document.getElementById("tripid2").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount2",
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
				var obj = data;
				var json2 = obj.msg;
				 $("#tripamount2").val(json2);
				 $('#tripamount2').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
				$.subtract(); 
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

  $("#tripid3").blur(function(event) { 
  var search = {}
		search["tripid3"] = document.getElementById("tripid3").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount3",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount3").val(json);
     			 $('#tripamount3').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid4").blur(function(event) { 
  var search = {}
		search["tripid4"] = document.getElementById("tripid4").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount4",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount4").val(json);
  			     $('#tripamount4').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid5").blur(function(event) { 
  var search = {}
		search["tripid5"] = document.getElementById("tripid5").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount5",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount5").val(json);
				 $('#tripamount5').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid6").blur(function(event) { 
  var search = {}
		search["tripid6"] = document.getElementById("tripid6").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount6").val(json);
     			 $('#tripamount6').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid7").blur(function(event) { 
  var search = {}
		search["tripid7"] = document.getElementById("tripid7").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount7",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount7").val(json);
				 $('#tripamount7').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid8").blur(function(event) { 
  var search = {}
		search["tripid8"] = document.getElementById("tripid8").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount8",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount8").val(json);
 			     $('#tripamount8').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				   if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid9").blur(function(event) { 
  var search = {}
		search["tripid9"] = document.getElementById("tripid9").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount9",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount9").val(json);
				 $('#tripamount9').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  $("#tripid10").blur(function(event) { 
  var search = {}
		search["tripid10"] = document.getElementById("tripid10").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount10",
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
				var obj = data;
				var json = obj.msg;
				 $("#tripamount10").val(json);
				 $('#tripamount10').attr('readonly', true);
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+trip4+trip5+trip6+trip7+trip8+trip9+trip10);
				} 
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

  
   function display(data) {
		var obj = data;
		var json = "<h5>"+obj.msg+"</h5>";
		$('#feedback').html(json);
	}

	$(document).ready(function() {
			if($("#totalexpenses").length){
				$("#tripadvance").keyup(function() {
					$.subtract();          
				});
				$("#driverbata").keyup(function() {
					$.subtract();          
				});
				$("#tollexpenses").keyup(function() {
					$.subtract();          
				});
				$("#food").keyup(function() {
					$.subtract();          
				});
				$("#diesel").keyup(function() {
					$.subtract();          
				});
				$("#other").keyup(function() {
					$.subtract();          
				});
			}
				$.subtract = function(){
					var tripdv =0,driverbata = 0, tollexpense=0, food=0, diesel=0,other=0, totalexpense=0,income=0; 
					income = $("#income").val();
					if($("#tripadvance").val().length>0 && $("#tripadvance").val() != 'NaN'){
						tripdv = parseInt($("#tripadvance").val());
						$("#totalexpenses").val(tripdv);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income-totalexpense);
					}
					if($("#driverbata").val().length>0 && $("#driverbata").val() != 'NaN'){
						driverbata = parseInt($("#driverbata").val());
						$("#totalexpenses").val(tripdv+driverbata);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income-totalexpense);
					}

					if($("#tollexpenses").val().length>0 && $("#tollexpenses").val() != 'NaN'){
						tollexpense = parseInt($("#tollexpenses").val());
						$("#totalexpenses").val(tripdv+driverbata+tollexpense);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income-totalexpense);
					} 
					if($("#food").val().length>0 && $("#food").val() != 'NaN'){
						food = parseInt($("#food").val());
						$("#totalexpenses").val(tripdv+driverbata+tollexpense+food);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income-totalexpense);
					} 
					if($("#diesel").val().length>0 && $("#diesel").val() != 'NaN'){
						diesel = parseInt($("#diesel").val());
						$("#totalexpenses").val(tripdv+driverbata+tollexpense+food+diesel);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income-totalexpense);
					} 
					if($("#other").val().length>0 && $("#other").val() != 'NaN'){
						other = parseInt($("#other").val());
						$("#totalexpenses").val(tripdv+driverbata+tollexpense+food+diesel+other);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income-totalexpense);
					} 
					if(($("#tripadvance").val().length==0 && $("#driverbata").val() != 'NaN') && ($("#tollexpenses").val().length==0 && $("#food").val() != 'NaN') && ($("#diesel").val().length==0 && $("#other").val() != 'NaN')){
						$("#totalexpenses").val('');

					}
				}
				});

		

</script>
</body>
</html>