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
<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="static/css/formValidation.min.css" rel="stylesheet" media="screen">
<link href="static/css/datepicker.min.css" rel="stylesheet" media="screen">
<link href="static/css/datepicker3.min.css" rel="stylesheet" media="screen">
</head>

<body style="margin: 0; height: 100%; overflow: hidden ">
	<div id="wrapper" style="max-height: 100vh;overflow-y:scroll;overflow-x:none">
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
					<div class="col-lg-12" style="width:100%;max-height: 90vh;" >
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
								<td><div align="center"><h4 class="page-title">Users</h4></div></td>
								<td width="20%">
								<sec:authorize access="hasRole('ADMIN')">
									<a class="btn btn-default pull-right" href="<c:url value='/newuser' />"><i class="fa fa-user-plus"></i>&nbsp;Add User</a>
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
								<th>First name</th>
								<th>Last name</th>
								<th>Email</th>
								<th>User name</th>
								<th>Role</th>
								 <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
									<th>Action</th>
								</sec:authorize>
								</tr>
								</thead>
								<tbody>
								   <c:forEach items="${users}" var="user">
								   <tr>
								   <td>${user.firstName}</td>
								   <td>${user.lastName}</td>
								   <td>${user.email}</td>
								   <td>${user.ssoId}</td>
								   <td>
								   <c:forEach var="role" items="${user.userProfiles}" varStatus="counter">
										${role.type}
										<c:if test="${counter.last ne true}">,</c:if>
									</c:forEach>
								   </td>
								   <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
										<td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success custom-width btn-sm"><i class="fa fa-edit"></i>&nbsp;Edit</a>
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
			    </c:when>
				</c:choose>
				<c:choose>
				<c:when test="${create || edit}">
				<div class="col-lg-12" style="max-height: 90vh; padding-right:0px;padding-left:0px; overflow-y:scroll;overflow-x:scroll;" >
  		  			<div id="containerPage" class="row-fluid">
						<div align="center"><h4 class="page-title">User</h4></div>
						<form:form method="POST" modelAttribute="user" class="form-horizontal" id="formmain" name="formmain">
							<form:input type="hidden" path="id" id="id"/>
							<div class="well">

							<div class="form-group">                       
                            	  <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								
								 <span><b>First Name<sup>*</sup></b></span>
								<form:input type="text" path="firstName" id="firstName" class="form-control input" /></div></div>
								
                            	 <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								 <span><b>Last Name</b></span>
								<form:input type="text" path="lastName" id="lastName" class="form-control input"/></div></div>
                            	 
								</div>

								
							<div class="form-group">                       
                            	  <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								 <span><b>User Name<sup>*</sup></b></span>
								<c:choose>
								<c:when test="${edit}">
									<form:input type="text" path="ssoId" id="ssoId" class="form-control" disabled="true"/>
								</c:when>
								<c:otherwise>
									<form:input type="text" path="ssoId" id="ssoId" class="form-control" />
								 </c:otherwise>
								</c:choose></div></div>
								
                            	 <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								 <span><b>Password<sup>*</sup></b></span>
								<form:input type="password" path="password" id="password" class="form-control input"/></div></div>
                            	 
								</div>

								<div class="form-group">                       
                            	  <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								 <span><b>Email</b></span>
								<form:input type="text" path="email" id="email" class="form-control"/>
								</div></div>
								
                            	 <div class="group">
								 <div class="col-md-3  inputGroupContainer">
								 <span><b>Roles<sup>*</sup></b></span>
								<form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control" /></div></div>
                            	 
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
				userName: {
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

</body>
</html>