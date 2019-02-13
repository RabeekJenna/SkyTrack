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
				<c:choose>
				<c:when test="${search}">
					<c:if test="${not empty success}">
						<div class="alert alert-success" role="alert">
							${success}
						</div>
					</c:if>  
					<div class="col-lg-12" style="width:100%;max-height: 90vh; padding-right:0px;padding-left:0px; overflow-y:scroll;overflow-x:scroll;" >
						<div id="containerPage" class="row-fluid">
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
								<td><div align="center"><h4 class="page-title">Drivers</h4></div></td>
								<td width="20%">
								<sec:authorize access="hasRole('ADMIN')">
									<a class="btn btn-default pull-right" href="<c:url value='/newdriver' />"><i class="fa fa-user-plus"></i>&nbsp;Add Driver</a>
								</sec:authorize>
								</td>
								</tr>
								</table>
								</td>
							</div>
							<div class="container-fluid">
								<table class="table table-list-search table-hover" id="customer_dataTable">
								<thead>
								<tr>
								<th>Name</th>
								<th>Mobile</th>
								<th>Status</th>
								 <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
									<th width="100"></th>
								</sec:authorize>
								<sec:authorize access="hasRole('ADMIN')">
									<th width="100"></th>
								</sec:authorize>
								</tr>
								</thead>
								<tbody>
								   <c:forEach items="${drivers}" var="driver">
								   <tr>
								   <td>${driver.fullName}</td>
								   <td>${driver.phone}</td>
								   <td></td>
								    <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
										<td><a href="<c:url value='/edit-driver-${driver.fullName}' />" class="btn btn-success custom-width btn-sm"><i class="fa fa-edit"></i>&nbsp;Edit</a></td>
									</sec:authorize>
									<sec:authorize access="hasRole('ADMIN')">
										<td><a href="<c:url value='/delete-driver-${driver.fullName}' />" class="btn btn-danger custom-width btn-sm"><i class="fa fa-trash"></i>&nbsp;Delete</a></td>
									</sec:authorize>
									</tr>
								 </c:forEach>
								</tbody>
								</table>
							</div>
						</div>
					</div>
			    </c:when>
				</c:choose>
				<c:choose>
				<c:when test="${create || edit}">
				<div class="col-lg-12" style="max-height: 90vh; padding-right:0px;padding-left:0px; overflow-y:scroll;overflow-x:scroll;" >
  		  			<div id="containerPage" class="row-fluid">
						<div align="center"><h4 class="page-title">Driver</h4></div>
						<form:form method="POST" modelAttribute="driver" class="form-horizontal" id="formmain" name="formmain">
							<form:input type="hidden" path="id" id="id"/>
							<div class="well">

							 <div class="form-group">                       
                            	  <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								
								 <span><b>Full Name<sup>*</sup></b></span>
								<form:input type="text" path="fullName" id="fullName" class="form-control input" /></div></div>
                            	 </div></div>

								 <div class="form-group">    
								 <div class="group">                   
                            	 <div class="col-md-3"> 
                            	  <span>Birth Date<sup>*</sup></span>
								  <div class="input-group input-append date" id="birthdate">
								 <form:input class="form-control" path="birthdate" name="birthdate" type="text" placeholder="DD/MM/YYYY"/>
								 <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
             				</div></div>	 </div> 
             				
								 <div class="col-md-3  inputGroupContainer">
								        <div class="group">
 										 <span>Gender<sup>*</sup></span>
										<form:select path="gender" class="form-control" id="gender">
											<option value=""></option>
											<c:choose>
    										<c:when test="${driver.gender.equals('Male')}">
    										<option value="Male" selected>Male</option>
       										</c:when>
       										<c:otherwise><option value="Male">Male</option></c:otherwise></c:choose>
       										<c:choose>
    										<c:when test="${driver.gender.equals('Female')}">
    										 <option value="Female" selected>Female</option>
      									    </c:when><c:otherwise> <option value="Female">Female</option></c:otherwise></c:choose>
      									   </form:select>
									 
							</div> 
						
                    </div>
					 <div class="col-md-4  inputGroupContainer">
					 
								 <span >Phone</span>
								<form:input type="text" path="phone" id="phone" class="form-control input" placeHolder="XXXXXXXXXX"/></div>
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
					</div>
				</div>
				</c:when>
				</c:choose>
			 </div>
			</div>
			<div id="dashboard" class="tab-pane fade"><h3>Dashboard 1</h3></div>
			<div id="track" class="tab-pane fade"><h3>Track</h3></div>
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