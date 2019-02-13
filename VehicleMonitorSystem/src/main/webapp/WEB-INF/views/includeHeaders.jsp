<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<% 
String requestURL = request.getScheme() + "://" + request.getServerName()+ ":" + request.getServerPort() + request.getContextPath();
%>
<head>
  <!-- Bootstrap Core CSS -->
	<link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
 
    <link href="static/vendor/CustomDateTimePicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
   
    <!-- Custom CSS -->
     <link href="static/dist/css/sb-admin-2.css" rel="stylesheet"></link>

    <!-- Morris Charts CSS -->
     <link href="static/vendor/morrisjs/morris.css" rel="stylesheet"></link>
   
    <!-- Custom Fonts -->
     <link href="static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"></link>

	 <script src="static/vendor/jquery/jquery.min.js"></script>

  </head>
     <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/../../static/images/.jpg"></a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-links navbar-right">
       
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                   
                        <i class="fa fa-user fa-fw">&nbsp;</i>${loggedinuser}
                    </a>
                    <li><a data-toggle="tooltip" data-placement="bottom" title="Log out" href="<c:url value='/logout' />"><i class="fa fa-sign-out fa-fw"></i></a>
                        </li>
                  
                    <!-- /.dropdown-user -->
               
                <!-- /.dropdown -->
            </ul>
      </nav>
      
    
     
</script>
