<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${pageContext.request.contextPath }/admin/home">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">eTravel Admin</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/admin/home"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Manage</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseMembership"
			aria-expanded="true" aria-controls="collapseMembership">
			<i class="fas fa-fw fa-user-plus"></i>
			<span>Membership</span>
		</a>
		<div id="collapseMembership" class="collapse"
			aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Manage Membership:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/membership/add">Add</a>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/membership/show#data_table">Show</a>
			</div>
		</div>
	</li>
	
	<li class="nav-item">
		<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTransportation"
			aria-expanded="true" aria-controls="collapseTransportation">
			<i class="fas fa-fw fa-bus"></i>
			<span>Transportation</span>
		</a>
		<div id="collapseTransportation" class="collapse"
			aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Manage Transportation:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/transportation/add">Add</a>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/transportation/show#data_table">Show</a>
			</div>
		</div>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseAccommodation"
			aria-expanded="true" aria-controls="collapseAccommodation">
			<i class="fas fa-fw fa-hotel"></i> 
			<span>Accommodation</span>
		</a>
		<div id="collapseAccommodation" class="collapse"
			aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Manage Hotel:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/accommodation/add">Add</a>
				
			</div>
		</div>
	</li>
		
	
		
		
	<li class="nav-item">
		<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseBooking"
			aria-expanded="true" aria-controls="collapseBooking">
			<i class="fas fa-fw fa-book"></i>
			<span>Booking</span>
		</a>
		<div id="collapseBooking" class="collapse"
			aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Manage Booking:</h6>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/booking/add">Add</a>
				<a class="collapse-item"
					href="${pageContext.request.contextPath }/admin/booking/show">Show</a>
			</div>
		</div>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	
	
	

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>