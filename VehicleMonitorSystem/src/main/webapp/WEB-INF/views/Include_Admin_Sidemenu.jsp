<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

    <div class="navbar-default sidebar" role="navigation" style="top:50px">
                <div >
                    <ul class="nav" id="side-menu">
                      <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                        <li><a href="<c:url value='/toptab-Admin-Users-userslist' />"><i class="fa fa-users"></i> Users</a></li>
						</sec:authorize>
                          <li><a href="<c:url value='/toptab-Admin-Drivers-driver' />"><i class="fa fa-users"></i> Drivers</a></li>
						  <li><a href="<c:url value='/toptab-Admin-Vehicles-vehicle' />"><i class="fa fa-car"></i> Vehicles</a></li>
						  
                     
                    </ul>
                </div>
               
            </div>
           