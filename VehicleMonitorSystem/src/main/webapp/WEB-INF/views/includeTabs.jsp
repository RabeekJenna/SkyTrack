<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<head>
<style>
.nav-tabs > li {
    float:none;
    display:inline-block;
    zoom:1;
}

.nav-tabs {
    text-align:right;
}
.nav-tabs>li>a {
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 8px 8px 0 0;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 5px 15px;
}

/* tab color */
.nav-tabs li a {
  background-color: #ddd;
  color:#555;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: white;
    cursor: default;
    background-color: #23707cd1;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
}

</style>

</head>
   <!-- /.navbar-top-links --> 
  <ul class="nav nav-tabs nav justify-content-end">
  <c:choose>
  <c:when test="${tab =='Admin'}">
   <li class="active"><a data-toggle="tab" href="#admin"><i class="fa fa-user-secret"></i>&nbsp;<span class="caption">Admin</span></a></li>
   </c:when>
   <c:otherwise>
   <li ><a data-toggle="tab" href="#admin">Admin</a></li>
   </c:otherwise>   
   </c:choose> 
    <c:choose>
  <c:when test="${tab=='dashboard'}">
    <li class="active"><a data-toggle="tab" href="#dashboard">Dash Board</a></li>
   </c:when>
   <c:otherwise>
    <li><a data-toggle="tab" href="#dashboard">Dash Board</a></li>
   </c:otherwise>   
   </c:choose> 
    <c:choose>
  <c:when test="${tab=='track'}">
     <li class="active"><a data-toggle="tab" href="track">Track</a></li>
   </c:when>
   <c:otherwise>
     <li><a data-toggle="tab" href="#track">Track</a></li>
    </c:otherwise>   
   </c:choose> 
    <c:choose>
  <c:when test="${tab=='report'}">
   <li class="active"><a data-toggle="tab" href="#report">Report</a></li>
  </c:when>
   <c:otherwise>
     <li><a data-toggle="tab" href="#report">Report</a></li>
  </c:otherwise>   
   </c:choose>
 
     </ul>
     
    
       <script type="text/javascript">
     $("a[data-tab-destination]").on('click', function() {
         var tab = $(this).attr('data-tab-destination');
         $("#"+tab).click();
     });
</script>