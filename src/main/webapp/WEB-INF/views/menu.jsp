<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<nav>
	<ul>
		<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
		<li><a href="${pageContext.request.contextPath}/about">About</a></li>
		<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
		<li><a href="${pageContext.request.contextPath}/services">Services</a></li>
		<sec:authorize access="isAuthenticated()">
    	<li><a href="${pageContext.request.contextPath}/accomodations">Accommodation</a></li>
    	<li><a href="${pageContext.request.contextPath}/logout">
    					Logout(<sec:authentication property="name"/>)</a></li>
		</sec:authorize>
		<sec:authorize access="!isAuthenticated()">
    	<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
		</sec:authorize>
	</ul>
</nav>