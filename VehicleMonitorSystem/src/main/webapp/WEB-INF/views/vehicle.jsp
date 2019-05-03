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
<meta name="author" content="balaji">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Users List</title>
<link href="static/css/adminpage.css" rel="stylesheet" media="screen">
<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="static/css/formValidation.min.css" rel="stylesheet" media="screen">
<link href="static/css/datepicker.min.css" rel="stylesheet" media="screen">
<link href="static/css/datepicker3.min.css" rel="stylesheet" media="screen">
</head>

<body style="margin: 0; height: 100%; overflow: hidden ">
	<div id="wrapper" style="max-height: 100vh;overflow-y:none;overflow-x:none">
		<jsp:include page="includeHeaders.jsp" />  
		<jsp:include page="includeTabs.jsp" />  
		<div class="tab-content">
			<div id="admin" class="tab-pane fade in active" >  
			<jsp:include page="Include_Admin_Sidemenu.jsp" />  
			<div id="page-wrapper" style="max-height: 100vh;overflow-y:none;overflow-x:none">
                  <div class="col-lg-2 thirty" style="padding-right:0px;padding-left:0px; 
                     margin-bottom: 0px;overflow-y:scroll;overflow-x:scroll;top: 50px">
                     <div class="form-group has-feedback">
                        <input class="form-control" id="myInput" type="text" placeholder="Search.."> 
                        <i class="glyphicon glyphicon-search form-control-feedback"></i>
                        <ul class="list-group" id="myList" style="list-style-type: none;">
                           <c:forEach items="${vehicles}" var="vehicle" varStatus="counter">
                              <li class="list-group-item" id="empListActive-${vehicle.id}">
                                 <a href="<c:url value='/edit-vehicle-${vehicle.id}' />" >${vehicle.model}</a>
                              </li>
                           </c:forEach>
                        </ul>
                     </div>
                  </div>
				<div class="col-lg-10 seventy" style="padding-right:0px;padding-left:10px;top: 50px" >
                     <div id="containerPage" class="row-fluid">
                        <div align="center">
                           <h4 class="page-title">Vehicle</h4>
						    <a class="btn btn-default" href="<c:url value='/newVehicle' />"><i class="fa fa-user-plus"></i>&nbsp;Add Vehicle</a>
                        </div>
				<c:choose>
				<c:when test="${create || edit}">
				 <form:form method="POST" modelAttribute="vehicle" class="form-horizontal" id="formmain" name="formmain">
                                 <form:input type="hidden" path="id" id="id"/>
                                 <c:if test="${not empty success}">
                                    <div class="alert alert-success" role="alert">
                                       ${success}
                                    </div>
                                 </c:if>
                                 <div class = "panel panel-primary mypanel">
                                    <div class = "panel-heading">
                                    <h3 class = "panel-title" align="center">
  											Vehicle&nbsp;
 									<a data-toggle="tooltip" data-placement="bottom" title="Add Trip" href="<c:url value='/newVehicle' />"><i class="fa fa-plus-square pull-right"></i></a>
									</h3>
                                    </div>
                                    <div class = "panel-body">
                                        <div class="form-group">
                                              <label class="col-md-2 control-label">Vechile Type<sup>*</sup></label>
											  <div class="col-md-4  inputGroupContainer">
                                             <div class="input-group">
                                             <form:select path="model" class="form-control" id="model">
                                                <option value=""></option>
                                                <c:choose>
                                                   <c:when test="${vehicle.model.equals('Sedan')}">
                                                      <option value="Sedan" selected>Sedan</option>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <option value="Sedan">Sedan</option>
                                                   </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                   <c:when test="${vehicle.model.equals('Hatchback')}">
                                                      <option value="Hatchback" selected>Hatchback</option>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <option value="Hatchback">Hatchback</option>
                                                   </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                	<c:when test="${vehicle.model.equals('SUV')}">
                                                	   <option value ="SUV" selected> SUV </option>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<option value ="SUV" selected>SUV</option>
                                                	</c:otherwise>
                                                </c:choose>
                                             </form:select>
											 </div></div>
                                         
                                       </div>
                                       <div class="form-group">
                                          <label class="col-md-2 control-label">Vehcile No<sup>*</sup></label>
                                          <div class="col-md-4  inputGroupContainer">
                                             <div class="input-group">
                                                  <form:input type="text" path="regNo" id="regNo" class="form-control input" placeHolder="XXXXXXXXXX"/>
                                             </div>
                                          </div>
                                       </div>
                                        <div class="form-group">
                                          <label class="col-md-2 control-label">Engine Chase No<sup>*</sup></label>
										  <div class="col-md-4  inputGroupContainer">
                                           <div class="input-group">
                                          <form:input type="text" path="engChaseNo" id="engChaseNo" class="form-control input" placeHolder="XXXXXXXXXX"/>
										  </div></div>
										  </div>
										  <div class="form-group">
                                          <label class="col-md-2 control-label">IMEI No<sup>*</sup></label>
										  <div class="col-md-4  inputGroupContainer">
                                           <div class="input-group">
                                          <form:input type="text" path="imeiNO" id="imeiNO" class="form-control input" placeHolder="XXXXXXXXXX"/>
										  </div></div>
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
                     
			 </div>
			</div>
			
			<div id="dashboard" class="tab-pane fade"><h3>Dashboard 1</h3></div>
			<div id="customer" class="tab-pane fade"><h3>Track</h3></div>
			<div id="report" class="tab-pane fade"><h3>Report</h3></div>
     	</div>
    </div>  

<script src="static/vendor/jquery/jquery.min.js"></script>
<script src="static/js/formValidation.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="static/js/bootstrap-datepicker.min.js"></script>
<script src="static/vendor/metisMenu/metisMenu.min.js"></script>
<script src="static/vendor/raphael/raphael.min.js"></script>
<script src="static/dist/js/sb-admin-2.js"></script>
<style>
	table.table-hover thead tr:first-child{
	background: #41bbf4;
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

	    $(document).ready(function() {
    	 $('#formmain').formValidation({
    	    framework: 'bootstrap',
    	    icon: {
			  valid: 'glyphicon glyphicon-ok',
    	      invalid: 'glyphicon glyphicon-remove',
    	      validating: 'glyphicon glyphicon-refresh'
    	    },
    	    fields: {
    	    	 fullName: {
    	    		 	group: '.group',
    	    	        validators: {
    	    	          notEmpty: {
    	    	            message: 'Name is required'
    	    	          }
    	    	          
    	    	        }
    	    	      },
    	    	
				gender: {
    	    		  group: '.group',
      	    		 	 validators: {
      	    	          notEmpty: {
      	    	            message: 'Gender is required'
      	    	          }
      	    	          
      	    	        }
      	    	      },

				phone: {
    	    		  group: '.group',
      	    		 	 validators: {
      	    	          notEmpty: {
      	    	            message: 'Phone number is required'
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
</script>

</body>
</html>