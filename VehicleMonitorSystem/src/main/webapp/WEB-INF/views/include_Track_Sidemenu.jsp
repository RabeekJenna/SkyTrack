<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

    <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                          <li><a href="<c:url value='/toptab-Track-Trips-trips' />"><i class="fa fa-users"></i> Trips</a></li>
						  <li><a href="<c:url value='/toptab-Track-Drivers-tripdrivers' />"><i class="fa fa-users"></i> Drivers</a></li>
						  <li><a href="<c:url value='/toptab-Track-Vehicles-tripvehicles' />"><i class="fa fa-car"></i> Vehicles</a></li>
						 
                     
                    </ul>
                </div>
               
            </div>
           