<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
                       	  <li><a href="<c:url value='/toptab-Track-Drivers-tripdrivers' />"><i class="fa fa-money"></i> Payments</a></li>
						 
                     
                    </ul>
                </div>
               
            </div>
           