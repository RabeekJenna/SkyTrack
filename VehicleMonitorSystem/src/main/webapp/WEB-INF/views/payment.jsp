<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 <link href="static/vendor/CustomDateTimePicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
					</div>
				<br>
				<c:choose>
				 <c:when test="${create||edit}">
                     <div class="col-lg-12">
                        <div id="containerPage" class="row-fluid">
						<div class="col-xs-12 selectpicker form-group" align="right">
									     <div class='input-group'>
								<a class="btn btn-default" href="<c:url value='/newpayment' />">
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
											<label class="col-md-1 control-label">Date</label>
											  
											   
											  
											  <div class="group">
                                             <div class="col-lg-2">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                  <form:input placeholder="DD/MM/YYYY" class="form-control datepicker" path="paymentDate" type="text" />
                                                </div>
                                             </div>
											 </div>
											
											

											 
                                          </div>
										   <div id="feedback"></div>
                                          <div class="form-group">
										
                                             <label class="col-md-2 control-label">TRIP ID</label>
                                             
											
                                             <label class="col-md-3 control-label">TRIP Amount</label>
											

											  <label class="col-md-3 control-label">Driver Bata</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="driverBata" id="driverbata" type="text"/>
                                                </div>
                                             </div>
											 </div>
                                             
											
											
											 </div>
											 <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid1" id="tripid1" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount1" id="tripamount1" type="text" readOnly="true"/>
												   
                                                </div>
												
                                             </div>
											 </div>	
											   <label class="col-md-2 control-label">Toll Expense</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tollExpense" id="tollexpenses" type="text"/>
                                                </div>
                                             </div>
											 </div>
											 
											  
                                          </div>
                                         <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid2" id="tripid2" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount2" id="tripamount2" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>	
											  <label class="col-md-2 control-label">Food</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="food" id="food" type="text"/>
                                                </div>
                                             </div>
											 </div>
											
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid3" id="tripid3" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount3" id="tripamount3" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											 <label class="col-md-2 control-label">Diesel</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="diesel" id="diesel" type="text"/>
                                                </div>
                                             </div>
											 </div>
											
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid4" id="tripid4" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount4" id="tripamount4" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											  <label class="col-md-2 control-label">Other</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="other" id="other" type="text"/>
                                                </div>
                                             </div>
											 </div>
											
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid5" id="tripid5" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount5" id="tripamount5" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											
											 
											  
                                          </div>
                                        <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid6" id="tripid6" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount6" id="tripamount6" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											  
											  
                                          </div>
                                          <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid7" id="tripid7" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount7" id="tripamount7" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>									  				
											 <label class="col-md-2 control-label">TRIP Advance(+)</label>
											   <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="advanceAmount" id="tripadvance" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  
                                          </div>
                                       <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid8" id="tripid8" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount8" id="tripamount8" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											 <label class="col-md-2 control-label">Income(+)</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="income" id="income" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											

											 
											 
											
											  
                                          </div>
										  <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid9" id="tripid9" type="text"/>
                                                </div>
                                             </div>
											  
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount9" id="tripamount9" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											  <label class="col-md-2 control-label">Total expenses(-)</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" type="text" path="totalExpense" id="totalexpenses" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											
											
											  
                                          </div>
										  <div class="form-group">
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                   <form:input class="form-control" path="tripid10" id="tripid10" type="text"/>
                                                </div>
                                             </div>
											 </div>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="tripamount10" id="tripamount10" type="text" readOnly="true"/>
                                                </div>
                                             </div>
											 </div>
											  <label class="col-md-2 control-label">Total Amount</label>
											  <div class="group">
                                             <div class="col-lg-3">
                                                <div class="input-group">
                                                   <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                                                   <form:input class="form-control" path="totalAmount" id="totalamount" type="text" readOnly="true"/>
												   <form:input class="form-control" path="collectedby" value="${loggedinuser}" type="hidden"/>
                                                </div>
                                             </div>
											 </div>
											  
											
											  
                                          </div>
										   <div class="form-group">
											  <div class="group">
										 
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
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-refresh"></i>&nbsp;Update</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="< c:url value='/paymentlist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:when>
                                             <c:otherwise>
                                                <button type="submit" onclick="return confirm('Ae you sure to pay the amount?')"class="btn btn-primary btn-sm"><i class="fa fa-money"></i>&nbsp;Pay</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="<c:url value='/paymentlist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
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
								<a class="btn btn-default" href="<c:url value='/newpayment' />">
								<i class="fa fa-plus-square"></i>&nbsp;Add Payment</a>
								</div>
								</div><br>
                                   <div class = "panel panel-primary mypanel">
                                       <div class = "panel-heading">
                                          <h3 class = "panel-title" align="center">
                                             PAYMENT
                                          </h3>
                                       </div>
									   
                                       <div class = "panel-body">
									 
  <div class="row">
    <div class="my-col-count-style">
      <div class="panel panel-default">
         <div class="panel-body">
          <dl  class="dl-horizontal">                        		
								<dt>PAYMENT ID:</dt><dd>${payment.paymentsid}</dd>
								<dt>Date:</dt><dd><fmt:formatDate pattern="dd/MM/yyyy" value="${payment.paymentDate}"/></dd>
								
								</dl>
        </div>
      </div>

	  
         <div class="my-col-count-style">
         <div class="panel panel-default">
        <div class="panel-body">
           <dl  class="dl-horizontal">                        		
								<dt>TRIP ID1:</dt><dd>${payment.tripid1}</dd>
								<dt>TRIP ID2:</dt><dd>${payment.tripid2}</dd>
								<dt>TRIP ID3:</dt><dd>${payment.tripid3}</dd>
								<dt>TRIP ID4:</dt><dd>${payment.tripid4}</dd>
								<dt>TRIP ID5:</dt><dd>${payment.tripid5}</dd>
								<dt>TRIP ID6:</dt><dd>${payment.tripid6}</dd>
								<dt>TRIP ID7:</dt><dd>${payment.tripid7}</dd>
								<dt>TRIP ID8:</dt><dd>${payment.tripid8}</dd>
								<dt>TRIP ID9:</dt><dd>${payment.tripid9}</dd>
								<dt>TRIP ID10:</dt><dd>${payment.tripid10}</dd>
								
								</dl>
        </div>
      </div>
	   <div class="panel panel-default">
        <div class="panel-body">
           <dl  class="dl-horizontal">                        		
								<dt>TRIP AMOUNT1:</dt><dd>${payment.tripamount1}</dd>
								<dt>TRIP AMOUNT2:</dt><dd>${payment.tripamount2}</dd>
								<dt>TRIP AMOUNT3:</dt><dd>${payment.tripamount3}</dd>
								<dt>TRIP AMOUNT4:</dt><dd>${payment.tripamount4}</dd>
								<dt>TRIP AMOUNT5:</dt><dd>${payment.tripamount5}</dd>
								<dt>TRIP AMOUNT6:</dt><dd>${payment.tripamount6}</dd>
								<dt>TRIP AMOUNT7:</dt><dd>${payment.tripamount7}</dd>
								<dt>TRIP AMOUNT8:</dt><dd>${payment.tripamount8}</dd>
								<dt>TRIP AMOUNT9:</dt><dd>${payment.tripamount9}</dd>
								<dt>TRIP AMOUNT10:</dt><dd>${payment.tripamount10}</dd>
								<br>
								<dt>TOTAL:</dt><dd>${payment.income}</dd>
								</dl>
        </div>
      </div>
     
     </div>
      <div class="panel panel-default">
        
        <div class="panel-body">
           <dl  class="dl-horizontal">
								
								
								<dt>Driver Bata:</dt><dd align="right" style="width:45px">${payment.driverBata}</dd>
								<dt>Toll Expense:</dt><dd align="right" style="width:45px">${payment.tollExpense}</dd>
								<dt>Food:</dt><dd align="right" style="width:45px">${payment.food}</dd>
								<dt>Diesel:</dt><dd align="right" style="width:45px">${payment.diesel}</dd>
								<dt>Other:</dt><dd align="right" style="width:45px">${payment.other}</dd>
								<br>
								<dt>Total:</dt><dd align="right" style="width:45px">${payment.totalExpense}</dd>
								<br><br>
								<dt>Trip Advance (+):</dt><dd align="right" style="width:45px">${payment.advanceAmount}</dd>
								<dt>INCOME (+):</dt><dd align="right" style="width:45px">${payment.income}</dd>
								<dt>Total Expense (-):</dt><dd align="right" style="width:45px">${payment.totalExpense}</dd>
								<br>
								<dt>Total Amount:</dt><dd align="right" style="width:45px">${payment.totalAmount}</dd>
								</dl>
        </div>
      </div>
	   <div class="panel panel-default">
        
        <div class="panel-body">
           <dl  class="dl-horizontal">  
		                        <dt>Collected by:</dt><dd>${payment.collectedby}</dd>
								<dt>Collected On:</dt><dd><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${payment.collectedon}" /></dd>
								<br>
								<dt>Comments:</dt><dd>${payment.comments}</dd>
								</dl>
        </div>
      </div>

	  
	  

    </div>
  </div>

								
                                          

                                    <div class="row">
                                       <div align="center">
                                          <c:choose>
                                             <c:when test="${browse}">
											 <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                                                <a href="<c:url value='/edit-payment-${payment.paymentsid}'/>" role="button" class="btn btn-success btn-sm"><i class="fa fa-edit"></i>&nbsp;Edit</a>
												</sec:authorize>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="< c:url value='/paymentlist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
                                             </c:when>
                                             <c:otherwise>
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i>&nbsp;Save</button>&nbsp;<a class="btn btn-danger btn-sm" role="button" href="<c:url value='/paymentlist' />"><i class="fa fa-times"></i>&nbsp;Cancel</a>
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
		<c:if test="${not empty payment.createdate}">
		<b>Created on </b>${payment.createdate}&nbsp;<b>by  </b>${payment.createuser}
		</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${not empty payment.updateuser}">
		
		<b>Updated on </b>${payment.updatedate}&nbsp;<b>by  </b>${payment.updateuser}
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
                                          <h3 class = "panel-title" align="center">PAYMENTS</h3></div>
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
								<a class="btn btn-default" href="<c:url value='/newpayment' />">
								<i class="fa fa-plus-square"></i>&nbsp;Add Payment</a>
								</div>
								</div>
								   <table class="table table-list-search table-striped table-bordered  dt-responsive table-hover dt-responsive display nowrap" id="customer_dataTable">
                                    <thead>
                                       <tr>
                                         <th>Payment ID</th>
										<th>Payment Date</th>
										<th>TRIP1</th>
										<th>TRIP2</th>
										<th>TRIP3</th>
										<th>TRIP4</th>
										<th>TRIP5</th>
										<th>TRIP6</th>
										<th>TRIP7</th>
										<th>TRIP8</th>
										<th>TRIP9</th>
										<th>TRIP10</th>
										<th>Expenses</th>
										<th>Amount</th>
										<th>Collected By</th>
										<th>Collected On</th>
										  <th>Action</th>
                                         
                                       </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach items="${payments}" var="payments">
                                          <tr>
                                                                                   
											 <td>${payments.paymentsid}</td>
											  <td>
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${payments.paymentDate}"/>
                                             </td>
											 <td>${payments.tripid1}</td>
											  <td>${payments.tripid2}</td>
											   <td>${payments.tripid3}</td>
											   <td>${payments.tripid4}</td>
											   <td>${payments.tripid5}</td>
											   <td>${payments.tripid6}</td>
											   <td>${payments.tripid7}</td>
											   <td>${payments.tripid8}</td>
											   <td>${payments.tripid9}</td>
											   <td>${payments.tripid10}</td>
											   <td>${payments.totalExpense}</td>
											   <td>${payments.totalAmount}</td>
											   <td>${payments.collectedby}</td>
											   <td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${payments.collectedon}" /></td>
                                                <td>
                                                   <a data-toggle="tooltip" data-placement="bottom" title="View" href="<c:url value='/browse-payment-${payments.paymentsid}' />" class="btn btn-primary custom-width btn-sm"><i class="fa fa-eye"></i></a>
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
    
 <script>var table;</script>
   <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/js/jquery-ui.min.js"></script>
   <script src="static/js/formValidation.min.js"></script>
   <script src="static/js/bootstrap.min.js"></script>
   <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="static/js/datatablejs/moment.min.js"></script>
   <script src="static/vendor/CustomDateTimePicker/js/bootstrap-datetimepicker.min.js"></script>
   <script src="static/js/bootstrap-datepicker.min.js"></script>
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
    $(document).ready(function() {


        $('#customer_dataTable').DataTable({
            responsive: true,
			"order": [[ 1, "asc" ]]
            
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

	

    $(document).ready(function() {
    	 $('#formmain').formValidation({
    	    framework: 'bootstrap',
    	    icon: {
			   valid: 'glyphicon glyphicon-ok',
    	      invalid: 'glyphicon glyphicon-remove',
    	      validating: 'glyphicon glyphicon-refresh'
    	    },
    	    fields: {
    	    	 paymentDate:{
						 group: '.group',
						validators: {
						  notEmpty: {
							message: 'PAYMENT Date is required'
						  },
						  date: {
							format: 'DD/MM/YYYY',
							message: 'PAYMENT date is not valid'
						  }
						}
					  },
    	    	 
				
			   tripid1: {
    	    		  group: '.group',
      	    		 	 validators: {
      	    	          notEmpty: {
      	    	            message: 'TRIP ID is required'
      	    	          }
      	    	          
      	    	        }
      	    	      },
				 driverBata: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Driver Bata must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
		       food: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Food must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
		       diesel: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Diesel must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
			 other: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Other must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },
             advanceAmount: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'TRIP Advance must be a number'
                                    }
          	    	          
          	    	        }
          	    	      },

				tollExpense: {
        	    		  group: '.group',
          	    		 	 validators: {
          	    	          numeric: {
                                        message: 'Toll Expense must be a number'
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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount1").val('');
					  $("#tripid1").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount1").val(json);
				 $('#tripamount1').attr('readonly', true);
				}
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json2=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount2").val('');
					  $("#tripid2").val('');
					display(json2);
				} else{
				 display('');
				 $("#tripamount2").val(json);
				 $('#tripamount2').attr('readonly', true);
				}
				 var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				 if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount3").val('');
					  $("#tripid3").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount3").val(json);
				 $('#tripamount3').attr('readonly', true);
				}
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount4").val('');
					  $("#tripid4").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount4").val(json);
				 $('#tripamount4').attr('readonly', true);
				}
				 var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount5").val('');
					  $("#tripid5").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount5").val(json);
				 $('#tripamount5').attr('readonly', true);
				}
				 var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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

  $("#tripid6").blur(function(event) { 
  var search = {}
		search["tripid6"] = document.getElementById("tripid6").value;
		  $.ajax({
			type : "POST",
			contentType : "application/json",
			url : "gettripamount6",
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
				 if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount6").val('');
					  $("#tripid6").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount6").val(json);
				 $('#tripamount6').attr('readonly', true);
				}
				 var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount7").val('');
					  $("#tripid7").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount7").val(json);
				 $('#tripamount7').attr('readonly', true);
				}
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount8").val('');
					  $("#tripid8").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount8").val(json);
				 $('#tripamount8').attr('readonly', true);
				}
				 var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount9").val('');
					  $("#tripid9").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount9").val(json);
				 $('#tripamount9').attr('readonly', true);
				}
				  var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
				if(json=='Invlaid trip or Amount is already paid. Please select other Trip..!') {
					 $("#tripamount10").val('');
					  $("#tripid10").val('');
					display(json);
				} else{
				 display('');
				 $("#tripamount10").val(json);
				 $('#tripamount10').attr('readonly', true);
				}
				var tripamt1 = 0,tripamt2=0, tripamt3=0,tripamt4=0,tripamt5=0,tripamt6=0, tripamount7=0, tripamount8=0, tripamount9=0, tripamount10=0;
				  
				 if($("#tripamount1").val().length>0 && $("#tripamount1").val() != 'NaN'){
					tripamt1 = parseInt($("#tripamount1").val());
					$("#income").val(tripamt1);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				}
				 if($("#tripamount2").val().length>0 && $("#tripamount2").val() != 'NaN'){
					tripamt2 = parseInt($("#tripamount2").val());
					$("#income").val(tripamt1+tripamt2);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount3").val().length>0 && $("#tripamount3").val() != 'NaN'){
					tripamt3 = parseInt($("#tripamount3").val());
					$("#income").val(tripamt1+tripamt2+tripamt3);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount4").val().length>0 && $("#tripamount4").val() != 'NaN'){
					tripamt4 = parseInt($("#tripamount4").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount5").val().length>0 && $("#tripamount5").val() != 'NaN'){
					tripamt5 = parseInt($("#tripamount5").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount6").val().length>0 && $("#tripamount6").val() != 'NaN'){
					tripamt6 = parseInt($("#tripamount6").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount7").val().length>0 && $("#tripamount7").val() != 'NaN'){
					tripamt7 = parseInt($("#tripamount7").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount8").val().length>0 && $("#tripamount8").val() != 'NaN'){
					tripamt8 = parseInt($("#tripamount8").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount9").val().length>0 && $("#tripamount9").val() != 'NaN'){
					tripamt9 = parseInt($("#tripamount9").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if($("#tripamount10").val().length>0 && $("#tripamount10").val() != 'NaN'){
					tripamt10 = parseInt($("#tripamount10").val());
					$("#income").val(tripamt1+tripamt2+tripamt3+tripamt4+tripamt5+tripamt6+tripamt7+tripamt8+tripamt9+tripamt10);
					var totalamt = $("#income").val();
					$("#totalamount").val(totalamt);
				} 
				if(($("#tripamount1").val().length==0 && $("#tripamount1").val() != 'NaN') && ($("#tripamount2").val().length==0 && $("#tripamount2").val() != 'NaN') && ($("#tripamount3").val().length==0 && $("#tripamount3").val() != 'NaN') && ($("#tripamount4").val().length==0 && $("#tripamount4").val() != 'NaN') && ($("#tripamount5").val().length==0 && $("#tripamount5").val() != 'NaN') && ($("#tripamount6").val().length==0 && $("#tripamount6").val() != 'NaN') && ($("#tripamount7").val().length==0 && $("#tripamount7").val() != 'NaN') && ($("#tripamount8").val().length==0 && $("#tripamount8").val() != 'NaN') && ($("#tripamount9").val().length==0 && $("#tripamount9").val() != 'NaN') && ($("#tripamount10").val().length==0 && $("#tripamount10").val() != 'NaN')){
						$("#income").val('');
						var totalamt = $("#income").val();
						$("#totalamount").val(totalamt);

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
					var tripdv =0,driversbata = 0, tollexpense=0, food=0, diesel=0,other=0, totalexpense=0,income=0; 
					if($("#income").val().length>0 && $("#income").val() != 'NaN'){
						income = parseInt($("#income").val());
					}
					if($("#tripadvance").val().length>0 && $("#tripadvance").val() != 'NaN'){
						tripdv = parseInt($("#tripadvance").val());
						$("#totalamount").val(income+tripdv);
					}
					if($("#driverbata").val().length>0 && $("#driverbata").val() != 'NaN'){
						driversbata = parseInt($("#driverbata").val());
						$("#totalexpenses").val(driversbata);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income+tripdv-totalexpense);
					}

					if($("#tollexpenses").val().length>0 && $("#tollexpenses").val() != 'NaN'){
						tollexpense = parseInt($("#tollexpenses").val());
						$("#totalexpenses").val(driversbata+tollexpense);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income+tripdv-totalexpense);
					} 
					if($("#food").val().length>0 && $("#food").val() != 'NaN'){
						food = parseInt($("#food").val());
						$("#totalexpenses").val(driversbata+tollexpense+food);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income+tripdv-totalexpense);
					} 
					if($("#diesel").val().length>0 && $("#diesel").val() != 'NaN'){
						diesel = parseInt($("#diesel").val());
						$("#totalexpenses").val(driversbata+tollexpense+food+diesel);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income+tripdv-totalexpense);
					} 
					if($("#other").val().length>0 && $("#other").val() != 'NaN'){
						other = parseInt($("#other").val());
						$("#totalexpenses").val(driversbata+tollexpense+food+diesel+other);
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income+tripdv-totalexpense);
					} 
					if(($("#driverbata").val().length==0 && $("#driverbata").val() != 'NaN') && ($("#diesel").val().length==0 && $("#diesel").val() != 'NaN') && ($("#food").val().length==0 && $("#food").val() != 'NaN') && ($("#other").val().length==0 && $("#other").val() != 'NaN')){
						$("#totalexpenses").val('');
						totalexpense = $("#totalexpenses").val();
						$("#totalamount").val(income+tripdv-totalexpense);

					}
					if(($("#tripadvance").val().length==0 && $("#tripadvance").val() != 'NaN')){

						$("#tripadvance").val('');
						tripdv = $("#tripadvance").val();
						$("#totalamount").val(income+tripdv-totalexpense);

					}
				}
				});

				 jQuery(function() {
        if(jQuery(".datepicker") != null && jQuery(".datepicker").length) {
        jQuery(".datepicker")
        .datepicker({
        autoclose: true,			
        todayHighlight: true,
        format: "dd/mm/yyyy"			
        }).on('changeDate show', function(e) {
    	      $('#formmain').formValidation('revalidateField', 'paymentDate');
    	    });
        }
        
        
        });

		 $(document).ready(function() {
		$(function() {
			  jQuery(".datetimepicker").datetimepicker({
				  format: "dd/mm/yyyy HH:ii P",
				  showMeridian: true,
				  autoclose: true,
				  todayBtn: true,
				  minuteStep: 1
			  });
			});
	   });
     

	 function display(data) {
		
		var json = "<h5 style='color:red' align='center'>"+data+"</h5>";
		$('#feedback').html(json);
		
	}	
	
    $(document).ready(function() {
			  
           
	  
      var tableload =  $('#customer_dataTable').DataTable();
	  tableload.draw();

	 
	  }); 
	  
	  
     
      

</script>
</body>
</html>