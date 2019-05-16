<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<% 
String requestURL = request.getScheme() + "://" + request.getServerName()+ ":" + request.getServerPort() + request.getContextPath();
%>

<!--META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL=login" /-->
<head>
 <!-- Bootstrap Core CSS -->
<link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
 <!-- Custom CSS -->
 <link href="static/dist/css/sb-admin-2.css" rel="stylesheet"></link>
 <!-- Morris Charts CSS -->
 <link href="static/vendor/morrisjs/morris.css" rel="stylesheet"></link>
 <!-- Custom Fonts -->
 <link href="static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"></link>
 <link href="static/css/formValidation.min.css" rel="stylesheet" media="screen">
 <link href="static/css/datepicker.min.css" rel="stylesheet" media="screen">
 <style>
 pre{
		font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
		font-size: 14px;
       	color: #333;
		word-break: break-all;
		word-wrap: break-word;
		background-color: #ffffff;
		border: 0px solid #fff;
		border-radius: 0px;
	}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: #fcf8e3;
    cursor: default;
    background-color: #337ab7;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
}


.sidebar ul li a.active {

    background-color: #31708f;
	 color: white;
}

 @media (min-width: 768px) {
  .sidebar {
    z-index: 1;
    position: fixed;
	width: 80px;
  }
  @media (min-width: 768px) {
  #page-wrapper {
    position: inherit;
    margin: 0 0 0 80px;
	}
 </style>
 </head>
 <body>
    <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="width: 165px;">SKY Travels</a>
    </div>
	<div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
    </div>

	 <ul class="nav nav-pills pull-right">
			
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
	
  <ul class="nav nav-tabs">

  
     <c:choose>
  <c:when test="${tab =='Admin'}">
   <li class="active"><a data-toggle="tab" href="#admin"><i class="fa fa-user-secret"></i>&nbsp;Admin</a></li>
   </c:when>
   <c:otherwise>
   <li ><a data-toggle="tab" href="#admin"><i class="fa fa-user-secret"></i>&nbsp;Admin</a></li>
   </c:otherwise>   
   </c:choose> 
    <c:choose>
  <c:when test="${tab=='dashboard'}">
    <li class="active"><a data-toggle="tab" href="#dashboard"><i class="fa fa-bar-chart"></i>&nbsp;Dash Board</a></li>
   </c:when>
   <c:otherwise>
    <li><a data-toggle="tab" href="#dashboard"><i class="fa fa-bar-chart"></i>&nbsp;Dash Board</a></li>
   </c:otherwise>   
   </c:choose> 
    <c:choose>
  <c:when test="${tab=='Track'}">
     <li class="active"><a data-toggle="tab" href="#track"><i class="fa fa-automobile"></i>&nbsp;Trips</a></li>
   </c:when>
   <c:otherwise>
     <li><a data-toggle="tab" href="#track"><i class="fa fa-automobile"></i>&nbsp;Trips</a></li>
    </c:otherwise>   
   </c:choose> 
   
 </ul>
  
  </div>
</nav>
