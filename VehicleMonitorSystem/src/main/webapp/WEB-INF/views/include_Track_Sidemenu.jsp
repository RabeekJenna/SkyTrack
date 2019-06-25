<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.sidenav {
  width: 50px;
  
}
.main {
  margin-left: 60px; 
}
</style>

    <div class="navbar-default sidebar" role="navigation" style="top:50px">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
						  <c:choose>
						  <c:when test="${menu =='Trips'}">
						   <li><a href="<c:url value='/toptab-Track-Trips-trips'/>" class='active'><i class="fa fa-automobile"></i> Trips</a></li>
						   </c:when>
						   <c:otherwise>
						   <li><a href="<c:url value='/toptab-Track-Trips-trips' />"><i class="fa fa-automobile"></i> Trips</a></li>
						   </c:otherwise>   
						   </c:choose> 
						   <c:choose>
						  <c:when test="${menu =='Payments'}">
						    <li><a href="<c:url value='/toptab-Track-Payments-payment' />" class='active'><i class="fa fa-money"></i> Payments</a></li>
						   </c:when>
						   <c:otherwise>
						    <li><a href="<c:url value='/toptab-Track-Payments-payment' />"><i class="fa fa-money"></i> Payments</a></li>
						   </c:otherwise>   
						   </c:choose> 
						   <c:choose>
						  <c:when test="${menu =='Accounts'}">
						    <li><a href="<c:url value='/toptab-Track-Accounts-account' />" class='active'><i class="fa fa-book"></i> Accounts</a></li>
						   </c:when>
						   <c:otherwise>
						    <li><a href="<c:url value='/toptab-Track-Accounts-account' />"><i class="fa fa-book"></i> Accounts</a></li>
						   </c:otherwise>   
						   </c:choose> 
                       	 
						 
                     
                    </ul>
                </div>
               
            </div>
           