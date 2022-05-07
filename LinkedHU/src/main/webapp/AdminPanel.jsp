<%@page import="com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.sym"%>

<%@page import="java.util.TreeMap,java.util.List,java.util.ArrayList,Model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="general.MyConstants" %>     

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>

<html lang="en" >
    <!-- begin::Head -->
    <head><!--begin::Base Path (base relative path for assets of this page) -->
        <meta charset="utf-8"/>

        <title>Post Detail Page</title>
        <meta name="description" content="List columns 1 example">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


		<!--begin::Fonts -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">       
		 <!--end::Fonts -->
		 
		  <!--begin::Page Vendors Styles(used by this page) -->
                            <link href="./assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
                        <!--end::Page Vendors Styles -->
		         
		<!--begin:: Global Mandatory Vendors -->
		<link href="./assets/vendors/general/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
		<!--end:: Global Mandatory Vendors -->
		
		<!--begin:: Global Optional Vendors -->
		<link href="./assets/vendors/general/tether/dist/css/tether.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/ion-rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/nouislider/distribute/nouislider.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/owl.carousel/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/owl.carousel/dist/assets/owl.theme.default.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/quill/dist/quill.snow.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/summernote/dist/summernote.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/animate.css/animate.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/toastr/build/toastr.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/dual-listbox/dist/dual-listbox.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/morris.js/morris.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/sweetalert2/dist/sweetalert2.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/socicon/css/socicon.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/custom/vendors/line-awesome/css/line-awesome.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/custom/vendors/flaticon/flaticon.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/custom/vendors/flaticon2/flaticon.css" rel="stylesheet" type="text/css" />
		<link href="./assets/vendors/general/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
		<!--end:: Global Optional Vendors -->

		<!--begin::Global Theme Styles(used by all pages) -->
		<link href="./assets/css/demo9/style.bundle.css" rel="stylesheet" type="text/css" />
		<link href="./css/sidenavbar.css" rel="stylesheet" type="text/css" />
		
		<!--end::Global Theme Styles -->

    </head>
    <!-- end::Head -->

    <!-- begin::Body -->
    <body  class="kt-page--loading-enabled kt-page--loading kt-app__aside--left kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header--minimize-menu kt-header-mobile--fixed kt-subheader--enabled kt-subheader--transparent kt-aside--enabled kt-aside--left kt-aside--fixed kt-page--loading"  >
  
    	<!-- begin:: Page -->
    	
		<!-- begin:: Header Mobile -->
		<div id="kt_header_mobile" class="kt-header-mobile  kt-header-mobile--fixed " >
			<div class="kt-header-mobile__logo">
				<a href="#">
					<img alt="Logo" src="./assets/media/logos/4060logos.png"/>
				</a>
			</div>
			<div class="kt-header-mobile__toolbar">
							<button class="kt-header-mobile__toolbar-toggler kt-header-mobile__toolbar-toggler--left" id="kt_aside_mobile_toggler"><span></span></button>
				
				<button class="kt-header-mobile__toolbar-toggler" id="kt_header_mobile_toggler"><span></span></button>
				<button class="kt-header-mobile__toolbar-topbar-toggler" id="kt_header_mobile_topbar_toggler"><i class="flaticon-more-1"></i></button>
			</div>
		</div>
		<!-- end:: Header Mobile -->
		

	<div class="kt-grid kt-grid--hor kt-grid--root">
		<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page">
		
		
			
		<!-- begin:: side bar -->
		<div class="sb_sidebar ">
			<div class="sb_top_content">
				
				<!-- side bar:: brand-->
				<div class="sb_logo_content">
					<div class="sb_logo">
						<a class="kt-header__brand-logo" href="#">
							<img alt="Logo" src="./assets/media/logos/4060logos.png"/>		
						</a>	
					</div>
				</div>
				<!-- side bar:: brand end-->
				
				<!-- side bar:: profile picture -->
				<div class="sb_profile_content">
					<div class="sb_profile"> 
						<div class="sb_profile_details">
						 
							<img id="sb_profile_picture" alt="Pic" src="./ProfilePictures/amdin.jpg" />
							
							<div class="sb_fullname " style="display: none">
								<c:out value="${currentUser.username }"></c:out>
							</div>
								
					        <form action="UserController" method="POST">
						        <button type="submit" class="btn btn-label btn-label-brand btn-sm btn-bold">Sign Out</button>
						        <input type = "hidden" value = "${MyConstants.OPP_LOGOUT }" name = "operation">        
					        </form>
							
						</div>
					</div>
				</div>
				<!-- side bar:: profile picture end-->
				
				<!-- side bar:: navigation list -->
				<ul class="sb_nav_list">
					<li>
						<form action="UserController" method="POST">
							<a href="#" onclick = "window.location = 'HomePage.jsp'">
								<i class="fa fa-home"></i>
								<span class="links_name">Home Page</span>
							</a>
						</form>
					</li>
					<li>
						<form action="UserController" method="POST">
							<a href="#" onclick='this.parentNode.submit(); return false;'>					
								<i class="fa fa-user-alt"></i>
								<span class="links_name">Profile</span>
							</a>
							<input type="hidden" name="operation" value="${MyConstants.OPP_VIEW_PROFILE }">
							<input type="hidden" name="userID" value="${currentUser.userID }">
						</form>
					</li>
					<li>
						<a href="#" onclick = "window.location = 'UpdateProfile.jsp'">
							<i class="fa fa-user-edit"></i>
							<span class="links_name">Update Profile</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-comments"></i>
							<!-- <i class="fa fa-envelope"></i> -->
							<span class="links_name">Messages</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-key"></i>
							<span class="links_name">Change Password</span>
						</a>
					</li>
					<li>

						<a href="#" onclick = "window.location = 'AdminPanel.jsp'">
							<i class="fa fa-info"></i>
							<span class="links_name">Administrator</span>
						</a>

					</li>
					<li>
						<a href="#" onclick = "window.location = 'FileUpload.jsp'">
							<i class="fa fa-upload"></i>
							<span class="links_name">Update Profile</span>
						</a>
					</li>
				</ul>
				<!-- side bar:: navigation list end-->
				
			</div>
		</div>
		<!-- end:: side bar -->
			
		
		<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper" style="padding: 0px !important">
			<div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body">
				<div class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content">

<!-- begin:: Content -->
<div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid" style="padding: 30px !important">
	<c:if test="${userexists == MyConstants.USERNAME_EXISTS}">
		<div class="alert alert-outline-warning fade show" role="alert">
			<div class="alert-icon">
				<i class="flaticon-warning"></i>
			</div>
			<div class="alert-text">This username is already used.</div>
			<div class="alert-close">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true"><i class="la la-close"></i></span>
				</button>
			</div>
		</div>
	</c:if>
	<c:if test="${userexists == MyConstants.EMAIL_EXISTS}">
		<div class="alert alert-outline-warning fade show" role="alert">
			<div class="alert-icon">
				<i class="flaticon-warning"></i>
			</div>
			<div class="alert-text">This email is already used.</div>
			<div class="alert-close">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true"><i class="la la-close"></i></span>
				</button>
			</div>
		</div>
	</c:if>
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<span class="kt-portlet__head-icon"> <i
					class="kt-font-brand flaticon2-line-chart"></i>
				</span>
				<h3 class="kt-portlet__head-title">All Users</h3>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-wrapper">
					<div class="kt-portlet__head-actions">

						&nbsp;
						<button type="button"
							class="btn btn-bold btn-label-brand btn-sm"
							data-toggle="modal" data-target="#add_user_modal">
							<i class="la la-plus"></i> Add User
						</button>

					</div>
				</div>
			</div>
		</div>

		<div class="kt-portlet__body">
			<!--begin: Datatable -->
			<table
				class="table table-striped- table-bordered table-hover table-checkable"
				id="kt_table_1">
				<thead>
					<tr>
						<th>User ID</th>
						<th>Username</th>
						<th>Email</th>
						<th>Full Name</th>
						<th>Academic Title</th>
						<th>Office Number</th>
						<th>Graduate Year</th>
						<th>Banned Until</th>
						<th>Status</th>
						<th>Type</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${studList}" var="stud">
						<tr>
							<td>${ String.valueOf(stud.userID) }</td>
							<td>${ stud.username }</td>
							<td>${ stud.email }</td>
							<td>${ stud.fullName }</td>
							<td></td>
							<td></td>
							<td></td>
							<td>${ stud.bannedUntil }</td>
							<td><span
								class="kt-badge  kt-badge--danger kt-badge--inline kt-badge--pill">Offline</span></td>
							<td><span
								class="kt-badge kt-badge--primary kt-badge--dot"></span>&nbsp;<span
								class="kt-font-bold kt-font-primary">Student</span></td>
							<td nowrap><span class="dropdown"> <a href="#"
									class="btn btn-sm btn-clean btn-icon btn-icon-md"
									data-toggle="dropdown" aria-expanded="true"> <i
										class="la la-ellipsis-h"></i>
								</a>
									<div class="dropdown-menu dropdown-menu-right">
										<form method="POST" action="UserController"
											id="${String.valueOf(stud.userID)}-profile">
											<button class="dropdown-item" type="submit"
												form="${String.valueOf(stud.userID)}-profile"
												value="submit">
												<i class="flaticon-user"></i> Go to Profile
											</button>
											<input type="hidden" name="userID"
												value="${stud.userID }"> <input type="hidden"
												value="${MyConstants.OPP_VIEW_PROFILE}"
												name="operation">
										</form>
										<form onsubmit="return false">
											<button class="dropdown-item" data-toggle="modal"
												data-target="#ban_modal_${String.valueOf(stud.userID)}">
												<i class="flaticon-cancel"></i> Ban User
											</button>
										</form>
										<form onsubmit="return false">
											<button class="dropdown-item" data-toggle="modal"
												data-target="#delete_modal_${String.valueOf(stud.userID)}">
												<i class="flaticon-delete"></i> Remove User
											</button>
										</form>
										<c:if test="${stud.bannedUntil != null}">
											<form method="POST" action="UserController"
												id="${String.valueOf(stud.userID)}-liftban">
												<button class="dropdown-item" type="submit"
													form="${String.valueOf(stud.userID)}-liftban"
													value="submit">
													<i class="flaticon2-checkmark"></i>Lift Ban
												</button>
												<input type="hidden" name="liftID"
													value="${stud.userID }"> <input type="hidden"
													value="${MyConstants.OPP_LIFT_BAN}" name="operation">
											</form>
										</c:if>
									</div>
							</span></td>


						</tr>
						<div class="modal fade show"
							id="ban_modal_${String.valueOf(stud.userID)}" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										Ban User ${String.valueOf(stud.userID)}
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="UserController" method="Post">
											<div class="form-group">
												<label for="ban-date" class="form-control-label">Ban
													User Until:</label> <input type="date" class="form-control"
													id="ban-date" name="banDate">
											</div>
											<div class="form-group">
												<label for="message-text" class="form-control-label">Message:</label>
												<textarea class="form-control" id="message-text"></textarea>
											</div>
											<input type="hidden" name="banID"
												value=${ String.valueOf(stud.userID) }> <input
												type="hidden" value="${MyConstants.OPP_BAN_USER}"
												name="operation">
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Ban
													User</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>

						<div class="modal fade show"
							id="delete_modal_${String.valueOf(stud.userID)}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Are
											You Sure?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; justify-content: center; align-content: space-between;">
										<form action="UserController" method="Post">
											<button type="submit" class="btn btn-primary">Delete
												User With Id ${ String.valueOf(stud.userID) }</button>
											<input type="hidden"
												value="${MyConstants.OPP_DELETE_USER }"
												name="operation"> <input type="hidden"
												name="deleteID" value=${ String.valueOf(stud.userID) }>
										</form>
									</div>

								</div>
							</div>
						</div>

					</c:forEach>


					<c:forEach items="${acadList}" var="acad">
						<tr>
							<td>${ String.valueOf(acad.userID) }</td>
							<td>${ acad.username }</td>
							<td>${ acad.email }</td>
							<td>${ acad.fullName }</td>
							<td>${ acad.academicTitle }</td>
							<td>${ acad.officeNumber }</td>
							<td></td>
							<td>${ acad.bannedUntil }</td>
							<td><span
								class="kt-badge  kt-badge--danger kt-badge--inline kt-badge--pill">Offline</span></td>
							<td><span
								class="kt-badge kt-badge--primary kt-badge--dot"></span>&nbsp;<span
								class="kt-font-bold kt-font-primary">Academician</span></td>
							<td nowrap><span class="dropdown"> <a href="#"
									class="btn btn-sm btn-clean btn-icon btn-icon-md"
									data-toggle="dropdown" aria-expanded="true"> <i
										class="la la-ellipsis-h"></i>
								</a>
									<div class="dropdown-menu dropdown-menu-right">
										<form method="POST" action="UserController"
											id="${String.valueOf(acad.userID)}-profile">
											<button class="dropdown-item" type="submit"
												form="${String.valueOf(acad.userID)}-profile"
												value="submit">
												<i class="flaticon-user"></i> Go to Profile
											</button>
											<input type="hidden" name="userID"
												value="${acad.userID }"> <input type="hidden"
												value="${MyConstants.OPP_VIEW_PROFILE}"
												name="operation">
										</form>
										<form onsubmit="return false">
											<button class="dropdown-item" data-toggle="modal"
												data-target="#ban_modal_${String.valueOf(acad.userID)}">
												<i class="flaticon-cancel"></i> Ban User
											</button>
										</form>
										<form onsubmit="return false">
											<button class="dropdown-item" data-toggle="modal"
												data-target="#delete_modal_${String.valueOf(acad.userID)}">
												<i class="flaticon-delete"></i> Remove User
											</button>
										</form>
										<c:if test="${acad.bannedUntil != null}">
											<form method="POST" action="UserController"
												id="${String.valueOf(acad.userID)}-liftban">
												<button class="dropdown-item" type="submit"
													form="${String.valueOf(acad.userID)}-liftban"
													value="submit">
													<i class="flaticon2-checkmark"></i>Lift Ban
												</button>
												<input type="hidden" name="liftID"
													value="${acad.userID }"> <input type="hidden"
													value="${MyConstants.OPP_LIFT_BAN}" name="operation">
											</form>
										</c:if>
									</div>
							</span></td>


						</tr>
						<div class="modal fade show"
							id="ban_modal_${String.valueOf(acad.userID)}" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										Ban User ${String.valueOf(acad.userID)}
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="UserController" method="Post">
											<div class="form-group">
												<label for="ban-date" class="form-control-label">Ban
													User Until:</label> <input type="date" class="form-control"
													id="ban-date" name="banDate">
											</div>
											<div class="form-group">
												<label for="message-text" class="form-control-label">Message:</label>
												<textarea class="form-control" id="message-text"></textarea>
											</div>
											<input type="hidden" name="banID"
												value=${ String.valueOf(acad.userID) }> <input
												type="hidden" value="${MyConstants.OPP_BAN_USER}"
												name="operation">
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Ban
													User</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>

						<div class="modal fade show"
							id="delete_modal_${String.valueOf(acad.userID)}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Are
											You Sure?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; justify-content: center; align-content: space-between;">
										<form action="UserController" method="Post">
											<button type="submit" class="btn btn-primary">Delete
												User With Id ${ String.valueOf(acad.userID) }</button>
											<input type="hidden"
												value="${MyConstants.OPP_DELETE_USER }"
												name="operation"> <input type="hidden"
												name="deleteID" value=${ String.valueOf(acad.userID) }>
										</form>
									</div>

								</div>
							</div>
						</div>

					</c:forEach>

					<c:forEach items="${gradList}" var="grad">
						<tr>
							<td>${ String.valueOf(grad.userID) }</td>
							<td>${ grad.username }</td>
							<td>${ grad.email }</td>
							<td>${ grad.fullName }</td>
							<td></td>
							<td></td>
							<td>${ grad.graduationYear }</td>
							<td>${ grad.bannedUntil }</td>
							<td><span
								class="kt-badge  kt-badge--danger kt-badge--inline kt-badge--pill">Offline</span></td>
							<td><span
								class="kt-badge kt-badge--primary kt-badge--dot"></span>&nbsp;<span
								class="kt-font-bold kt-font-primary">Graduate</span></td>
							<td nowrap><span class="dropdown"> <a href="#"
									class="btn btn-sm btn-clean btn-icon btn-icon-md"
									data-toggle="dropdown" aria-expanded="true"> <i
										class="la la-ellipsis-h"></i>
								</a>
									<div class="dropdown-menu dropdown-menu-right">
										<form method="POST" action="UserController"
											id="${String.valueOf(grad.userID)}-profile">
											<button class="dropdown-item" type="submit"
												form="${String.valueOf(grad.userID)}-profile"
												value="submit">
												<i class="flaticon-user"></i> Go to Profile
											</button>
											<input type="hidden" name="userID"
												value="${grad.userID }"> <input type="hidden"
												value="${MyConstants.OPP_VIEW_PROFILE}"
												name="operation">
										</form>
										<form onsubmit="return false">
											<button class="dropdown-item" data-toggle="modal"
												data-target="#ban_modal_${String.valueOf(grad.userID)}">
												<i class="flaticon-cancel"></i> Ban User
											</button>
										</form>
										<form onsubmit="return false">
											<button class="dropdown-item" data-toggle="modal"
												data-target="#delete_modal_${String.valueOf(grad.userID)}">
												<i class="flaticon-delete"></i> Remove User
											</button>
										</form>
										<c:if test="${grad.bannedUntil != null}">
											<form method="POST" action="UserController"
												id="${String.valueOf(grad.userID)}-liftban">
												<button class="dropdown-item" type="submit"
													form="${String.valueOf(grad.userID)}-liftban"
													value="submit">
													<i class="flaticon2-checkmark"></i>Lift Ban
												</button>
												<input type="hidden" name="liftID"
													value="${grad.userID }"> <input type="hidden"
													value="${MyConstants.OPP_LIFT_BAN}" name="operation">
											</form>
										</c:if>
									</div>
							</span></td>


						</tr>
						<div class="modal fade show"
							id="ban_modal_${String.valueOf(grad.userID)}" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										Ban User ${String.valueOf(grad.userID)}
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="UserController" method="Post">
											<div class="form-group">
												<label for="ban-date" class="form-control-label">Ban
													User Until:</label> <input type="date" class="form-control"
													id="ban-date" name="banDate">
											</div>
											<div class="form-group">
												<label for="message-text" class="form-control-label">Message:</label>
												<textarea class="form-control" id="message-text"></textarea>
											</div>
											<input type="hidden" name="banID"
												value=${ String.valueOf(grad.userID) }> <input
												type="hidden" value="${MyConstants.OPP_BAN_USER}"
												name="operation">
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<button type="submit" class="btn btn-primary">Ban
													User</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>

						<div class="modal fade show"
							id="delete_modal_${String.valueOf(grad.userID)}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Are
											You Sure?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; justify-content: center; align-content: space-between;">
										<form action="UserController" method="Post">
											<button type="submit" class="btn btn-primary">Delete
												User With Id ${ String.valueOf(grad.userID) }</button>
											<input type="hidden"
												value="${MyConstants.OPP_DELETE_USER }"
												name="operation"> <input type="hidden"
												name="deleteID" value=${ String.valueOf(grad.userID) }>
										</form>
									</div>

								</div>
							</div>
						</div>

					</c:forEach>
				</tbody>

			</table>
			<!--end: Datatable -->

			<div class="modal fade show" id="add_user_modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel"
				style="display: none; padding-right: 16px;" aria-modal="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add
								User</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form method="POST" action="UserController"
								id="add-user-form">
								<div class="form-group">
									<label for="firstname" class="form-control-label">First
										Name:</label> <input type="text" required class="form-control"
										name="firstname"> <label for="lastname"
										class="form-control-label">Last Name:</label> <input
										type="text" required class="form-control"
										name="lastname"> <label for="username"
										class="form-control-label">Username:</label> <input
										type="text" required class="form-control"
										name="username"> <label for="email"
										class="form-control-label">Email:</label> <input
										type="email" required class="form-control" name="email">
									<label for="password" class="form-control-label">Password:</label>
									<input class="form-control" type="text" pattern=".{8,}"
										required title="8 characters minimum" required
										placeholder="Password" name="password"> <label
										for="type" class="form-control-label">User Type:</label>
									<select class="form-control" name="type">
										<option value="${MyConstants.TYPE_STUDENT}">Student</option>
										<option value="${MyConstants.TYPE_ACADEMICIAN}">Academician</option>
										<option value="${MyConstants.TYPE_GRADUATE}">Graduate</option>
									</select> <input type="hidden" id="31" name="operation"
										value="${MyConstants.OPP_CREATED_BY_ADMIN}">
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" form="add-user-form" value="submit"
								class="btn btn-primary">Add User</button>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- end:: Content -->



						<!-- 3 wrapper div -->					
					</div>
				</div>
			</div>
			
			<!-- end root -->
		</div>
	</div>
	
<!-- end:: Page -->


    

 <!-- begin::Global Config(global config for global JS sciprts) -->
 <script>
     var KTAppOptions = {"colors":{"state":{"brand":"#591df1","light":"#ffffff","dark":"#282a3c","primary":"#5867dd","success":"#34bfa3","info":"#36a3f7","warning":"#ffb822","danger":"#fd3995"},"base":{"label":["#c5cbe3","#a1a8c3","#3d4465","#3e4466"],"shape":["#f0f3ff","#d9dffa","#afb4d4","#646c9a"]}}};
 </script>
 <!-- end::Global Config -->
<% session.removeAttribute("userexists"); %>

    	<!--begin:: Global Mandatory Vendors -->
<script src="./assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>
<script src="./assets/vendors/general/popper.js/dist/umd/popper.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/js-cookie/src/js.cookie.js" type="text/javascript"></script>
<script src="./assets/vendors/general/moment/min/moment.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/tooltip.js/dist/umd/tooltip.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/perfect-scrollbar/dist/perfect-scrollbar.js" type="text/javascript"></script>
<script src="./assets/vendors/general/sticky-js/dist/sticky.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/wnumb/wNumb.js" type="text/javascript"></script>
<!--end:: Global Mandatory Vendors -->

<script src="./js/Like.js" type="text/javascript"></script>
<script src="./js/Comment.js" type="text/javascript"></script>
<script src="./js/sidenavbar.js" type="text/javascript"></script>

<!--begin:: Global Optional Vendors -->
<script src="./assets/vendors/general/jquery-form/dist/jquery.form.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/block-ui/jquery.blockUI.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/bootstrap-datepicker.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/bootstrap-timepicker.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-maxlength/src/bootstrap-maxlength.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-select/dist/js/bootstrap-select.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-switch/dist/js/bootstrap-switch.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/bootstrap-switch.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/select2/dist/js/select2.full.js" type="text/javascript"></script>
<script src="./assets/vendors/general/ion-rangeslider/js/ion.rangeSlider.js" type="text/javascript"></script>
<script src="./assets/vendors/general/typeahead.js/dist/typeahead.bundle.js" type="text/javascript"></script>
<script src="./assets/vendors/general/handlebars/dist/handlebars.js" type="text/javascript"></script>
<script src="./assets/vendors/general/inputmask/dist/jquery.inputmask.bundle.js" type="text/javascript"></script>
<script src="./assets/vendors/general/inputmask/dist/inputmask/inputmask.date.extensions.js" type="text/javascript"></script>
<script src="./assets/vendors/general/inputmask/dist/inputmask/inputmask.numeric.extensions.js" type="text/javascript"></script>
<script src="./assets/vendors/general/nouislider/distribute/nouislider.js" type="text/javascript"></script>
<script src="./assets/vendors/general/owl.carousel/dist/owl.carousel.js" type="text/javascript"></script>
<script src="./assets/vendors/general/autosize/dist/autosize.js" type="text/javascript"></script>
<script src="./assets/vendors/general/clipboard/dist/clipboard.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/dropzone/dist/dropzone.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/dropzone.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/quill/dist/quill.js" type="text/javascript"></script>
<script src="./assets/vendors/general/@yaireo/tagify/dist/tagify.polyfills.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/@yaireo/tagify/dist/tagify.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/summernote/dist/summernote.js" type="text/javascript"></script>
<script src="./assets/vendors/general/markdown/lib/markdown.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/bootstrap-markdown.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/bootstrap-notify/bootstrap-notify.min.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/bootstrap-notify.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery-validation/dist/additional-methods.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/jquery-validation.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/toastr/build/toastr.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/dual-listbox/dist/dual-listbox.js" type="text/javascript"></script>
<script src="./assets/vendors/general/raphael/raphael.js" type="text/javascript"></script>
<script src="./assets/vendors/general/morris.js/morris.js" type="text/javascript"></script>
<script src="./assets/vendors/general/chart.js/dist/Chart.bundle.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/vendors/jquery-idletimer/idle-timer.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/waypoints/lib/jquery.waypoints.js" type="text/javascript"></script>
<script src="./assets/vendors/general/counterup/jquery.counterup.js" type="text/javascript"></script>
<script src="./assets/vendors/general/es6-promise-polyfill/promise.min.js" type="text/javascript"></script>
<script src="./assets/vendors/general/sweetalert2/dist/sweetalert2.min.js" type="text/javascript"></script>
<script src="./assets/vendors/custom/js/vendors/sweetalert2.init.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery.repeater/src/lib.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery.repeater/src/jquery.input.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery.repeater/src/repeater.js" type="text/javascript"></script>
<script src="./assets/vendors/general/dompurify/dist/purify.js" type="text/javascript"></script>
<!--end:: Global Optional Vendors -->

<!--begin::Global Theme Bundle(used by all pages) -->
    	    	   
		    		    	   <script src="./assets/js/demo9/scripts.bundle.js" type="text/javascript"></script>
				<!--end::Global Theme Bundle -->

                    <!--begin::Page Vendors(used by this page) -->
                            <script src="./assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
                        <!--end::Page Vendors -->
         
                    <!--begin::Page Scripts(used by this page) -->
                            <script src="./assets/js/demo9/pages/crud/datatables/extensions/buttons.js" type="text/javascript"></script>
                        <!--end::Page Scripts -->
       
            </body>
    <!-- end::Body -->
</html>
    