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
			<tr height="10"></tr>
			<marquee width = "50%"><h2>Accounts will be updated soon...</h2></marquee>
			</div>
			</div>
			</div>
			</div>
			</html>