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

	<style>
	.mypanel{
	
	overflow-x: hidden; 
     	
	}
	
	</style>
	<style type="text/css">
#formmain {
    margin-top: 15px;
	margin-left: 15px;
}
</style>
</head>

<body style="margin: 0; height: 100%; overflow: hidden ">

    <div id="wrapper" style="max-height: 100vh;overflow-y:none;overflow-x:none">
  <jsp:include page="includeHeaders.jsp" />  
    <jsp:include page="includeTabs.jsp" />  
  <div class="tab-content">
    <div id="admin" class="tab-pane fade in active" >  
      <jsp:include page="Include_Admin_Sidemenu.jsp" />  
       
          <!-- Page Content -->
        <div id="page-wrapper" style="max-height: 100vh;overflow-y:none;overflow-x:none">
            
                
			  <!-- Default panel contents -->
		  	
			 <div class="col-lg-12" style="width:100%;max-height: 90vh; padding-right:0px;padding-left:0px; overflow-y:scroll;overflow-x:scroll;" >
  		  	<div id="containerPage" class="row-fluid">
  		  	<table>
  		  	<tr>
  		  	<td width="20%">  
      		 <form action="#" method="get">
                <div class="input-group">
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
    
  		  	</td> <td><div align="center"><h4 class="page-title">Users</h4></div></td>
			<sec:authorize access="hasRole('ADMIN')">
  		  	<td width="20%"> 
  		  	 <a class="btn btn-default pull-right" href="<c:url value='/newuser' />"><i class="fa fa-user-plus"></i>&nbsp;Add User</a>
  		  	</td>
			</sec:authorize>
  		  	</tr>
  		  	</table>
  		  	<div class="container-fluid">
  		  	  <table class="table table-list-search table-hover" id="customer_dataTable">
   	    		<thead>
		      		<tr>
				        <th>First name</th>
				        <th>Last name</th>
				        <th>Email</th>
				        <th>User name</th>
						 <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
				        	<th width="100"></th>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
				        	<th width="100"></th>
				        </sec:authorize>
				        
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.email}</td>
						<td> <c:forEach var="role" items="${user.userProfiles}" varStatus="counter">
						 ${role.type}<c:if test="${counter.last ne true}">,</c:if></c:forEach></td>
						 
						  <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
							<td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success custom-width btn-sm">Edit</a></td>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
							<td><a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-danger custom-width btn-sm">Delete</a></td>
        				</sec:authorize>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table></div>
		</div>
		
   	</div>
		</div>
			</div>
				

		<div id="dashboard" class="tab-pane fade">
      <h3>Dashboard 1</h3>
      
    </div>
    <div id="customer" class="tab-pane fade">
   <h3>Track</h3>
   
    </div>
    <div id="report" class="tab-pane fade">
     <h3>Report</h3>
       </div>

			
   
				</div>
					</div>  <!-- jQuery -->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
   
    <script src="static/js/formValidation.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
	    <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="static/js/bootstrap-datepicker.min.js"></script>
    
    
    <!-- Metis Menu Plugin JavaScript -->
    <script src="static/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="static/vendor/raphael/raphael.min.js"></script>

    <!-- Custom Theme JavaScript -->
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