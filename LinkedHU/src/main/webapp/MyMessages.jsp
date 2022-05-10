<%@page
	import="com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.sym"%>

<%@page
	import="java.util.TreeMap,java.util.List,java.util.ArrayList,Model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="general.MyConstants"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="en">
<!-- begin::Head -->
<head>
<!--begin::Base Path (base relative path for assets of this page) -->


<title>My Messages</title>
<meta name="description" content="List columns 1 example">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--begin::Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">
<!--end::Fonts -->
<link href="./assets/css/demo9/pages/inbox/inbox.css" rel="stylesheet"
	type="text/css" />
<!--begin:: Global Mandatory Vendors -->
<link
	href="./assets/vendors/general/perfect-scrollbar/css/perfect-scrollbar.css"
	rel="stylesheet" type="text/css" />
<!--end:: Global Mandatory Vendors -->

<!--begin:: Global Optional Vendors -->
<link href="./assets/vendors/general/tether/dist/css/tether.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-timepicker/css/bootstrap-timepicker.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-select/dist/css/bootstrap-select.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/select2/dist/css/select2.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/ion-rangeslider/css/ion.rangeSlider.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/nouislider/distribute/nouislider.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/owl.carousel/dist/assets/owl.carousel.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/owl.carousel/dist/assets/owl.theme.default.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/dropzone/dist/dropzone.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/quill/dist/quill.snow.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/summernote/dist/summernote.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/bootstrap-markdown/css/bootstrap-markdown.min.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/animate.css/animate.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/toastr/build/toastr.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/dual-listbox/dist/dual-listbox.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/morris.js/morris.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/sweetalert2/dist/sweetalert2.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/general/socicon/css/socicon.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/custom/vendors/line-awesome/css/line-awesome.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/custom/vendors/flaticon/flaticon.css"
	rel="stylesheet" type="text/css" />
<link href="./assets/vendors/custom/vendors/flaticon2/flaticon.css"
	rel="stylesheet" type="text/css" />
<link
	href="./assets/vendors/general/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css" />
<!--end:: Global Optional Vendors -->

<!--begin::Global Theme Styles(used by all pages) -->
<link href="./assets/css/demo9/style.bundle.css" rel="stylesheet"
	type="text/css" />
<!--end::Global Theme Styles -->

<link href="./css/sidenavbar.css" rel="stylesheet" type="text/css" />

</head>
<!-- end::Head -->

<!-- begin::Body -->
<body
	class="kt-page--loading-enabled kt-page--loading kt-app__aside--left kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header--minimize-menu kt-header-mobile--fixed kt-subheader--enabled kt-subheader--transparent kt-aside--enabled kt-aside--left kt-aside--fixed kt-page--loading">

	<!-- begin:: Page -->
	<div class="kt-grid kt-grid--hor kt-grid--root">
		<div
			class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page">
			
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
							 
								<img id="sb_profile_picture" alt="Pic" src="${currentUser.profilePictureSrc }" />
								
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
							<form action="MessageController" method="POST" id="form_viewMessages">
								<input type="hidden" name="operation" value="${MyConstants.OPP_VIEW_INBOX}">
							
								<a href="#" onclick='this.parentNode.submit(); return false;'>
									<i class="fa fa-comments"></i>
									<!-- <i class="fa fa-envelope"></i> -->
									<span class="links_name">Messages</span>
								</a>

							</form>
						</li>
						<li>
							<a href="#" onclick = "window.location = 'UpdateProfile.jsp'">
								<i class="fa fa-key"></i>
								<span class="links_name">Change Password</span>
							</a>
						</li>
						
						<c:if test="${currentUser.userType == MyConstants.TYPE_ADMIN }">
							<li>

								<a href="#" onclick = "window.location = 'AdminPanel.jsp'">
									<i class="fa fa-info"></i>
									<span class="links_name">Administrator</span>
								</a>

							</li>
						</c:if>
						<li>
							<a href="#" onclick = "window.location = 'FileUpload.jsp'">
								<i class="fa fa-upload"></i>
								<c:if test="${currentUser.userType != MyConstants.TYPE_STUDENT }">										
									<span class="links_name">Upload File</span>
								</c:if>
								<c:if test="${currentUser.userType == MyConstants.TYPE_STUDENT }">										
									<span class="links_name">File Portal</span>
								</c:if>
							</a>
						</li>
					</ul>
					<!-- side bar:: navigation list end-->
					
				</div>
			</div>
			<!-- end:: side bar -->


			
			<!-- 3 wrapper class start-->
			<div
				class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper"
				id="kt_wrapper">
				<div
					class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch"
					id="kt_body">
					<div
						class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor"
						id="kt_content">


<!-- begin:: Content -->
<div
	class="kt-container  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch">
	<div
		class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch">
		<div
			class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor">
			<div
				class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch"
				id="kt_body">
				<div
					class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor"
					id="kt_content">

					<!-- begin:: Subheader -->
					<div class="kt-subheader   kt-grid__item" id="kt_subheader">
						<div class="kt-container ">
							<div class="kt-subheader__main">
								<h3 class="kt-subheader__title">
									<button
										class="kt-subheader__mobile-toggle kt-subheader__mobile-toggle--left"
										id="kt_subheader_mobile_toggle">
										<span></span>
									</button>

									Inbox
								</h3>

								<span class="kt-subheader__separator kt-hidden"></span>
								<div class="kt-subheader__breadcrumbs">
									<a href="#" class="kt-subheader__breadcrumbs-home"><i
										class="flaticon2-shelter"></i></a> <span
										class="kt-subheader__breadcrumbs-separator"></span> <a
										href="" class="kt-subheader__breadcrumbs-link"> Apps
									</a> <span class="kt-subheader__breadcrumbs-separator"></span>
									<a href="" class="kt-subheader__breadcrumbs-link">
										Inbox </a>
									<!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
								</div>
							</div>
							<div class="kt-subheader__toolbar">
								<div class="kt-subheader__wrapper">
									<a href="#" class="btn kt-subheader__btn-primary">
										Actions &nbsp; <!--<i class="flaticon2-calendar-1"></i>-->
															</a>

															<div class="dropdown dropdown-inline"
																data-toggle="kt-tooltip" title="Quick actions"
																data-placement="left">
																<a href="#" class="btn btn-icon" data-toggle="dropdown"
																	aria-haspopup="true" aria-expanded="false"> <svg
																		xmlns="http://www.w3.org/2000/svg"
																		xmlns:xlink="http://www.w3.org/1999/xlink"
																		width="24px" height="24px" viewBox="0 0 24 24"
																		version="1.1"
																		class="kt-svg-icon kt-svg-icon--success kt-svg-icon--md">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <polygon id="Shape" points="0 0 24 0 24 24 0 24" />
        <path
																			d="M5.85714286,2 L13.7364114,2 C14.0910962,2 14.4343066,2.12568431 14.7051108,2.35473959 L19.4686994,6.3839416 C19.8056532,6.66894833 20,7.08787823 20,7.52920201 L20,20.0833333 C20,21.8738751 19.9795521,22 18.1428571,22 L5.85714286,22 C4.02044787,22 4,21.8738751 4,20.0833333 L4,3.91666667 C4,2.12612489 4.02044787,2 5.85714286,2 Z"
																			id="Combined-Shape" fill="#000000"
																			fill-rule="nonzero" opacity="0.3" />
        <path
																			d="M11,14 L9,14 C8.44771525,14 8,13.5522847 8,13 C8,12.4477153 8.44771525,12 9,12 L11,12 L11,10 C11,9.44771525 11.4477153,9 12,9 C12.5522847,9 13,9.44771525 13,10 L13,12 L15,12 C15.5522847,12 16,12.4477153 16,13 C16,13.5522847 15.5522847,14 15,14 L13,14 L13,16 C13,16.5522847 12.5522847,17 12,17 C11.4477153,17 11,16.5522847 11,16 L11,14 Z"
																			id="Combined-Shape" fill="#000000" />
    </g>
</svg> <!--<i class="flaticon2-plus"></i>-->
										</a>
										<div
											class="dropdown-menu dropdown-menu-fit dropdown-menu-md dropdown-menu-right">
											<!--begin::Nav-->
											<ul class="kt-nav">
												<li class="kt-nav__head">Add anything or jump to:
													<i class="flaticon2-information"
													data-toggle="kt-tooltip" data-placement="right"
													title="Click to learn more..."></i>
												</li>
												<li class="kt-nav__separator"></li>
												<li class="kt-nav__item"><a href="#"
													class="kt-nav__link"> <i
														class="kt-nav__link-icon flaticon2-drop"></i> <span
														class="kt-nav__link-text">Order</span>
												</a></li>
												<li class="kt-nav__item"><a href="#"
													class="kt-nav__link"> <i
														class="kt-nav__link-icon flaticon2-calendar-8"></i>
														<span class="kt-nav__link-text">Ticket</span>
												</a></li>
												<li class="kt-nav__item"><a href="#"
													class="kt-nav__link"> <i
														class="kt-nav__link-icon flaticon2-telegram-logo"></i>
														<span class="kt-nav__link-text">Goal</span>
												</a></li>
												<li class="kt-nav__item"><a href="#"
													class="kt-nav__link"> <i
														class="kt-nav__link-icon flaticon2-new-email"></i> <span
														class="kt-nav__link-text">Support Case</span> <span
														class="kt-nav__link-badge"> <span
															class="kt-badge kt-badge--success">5</span>
													</span>
												</a></li>
												<li class="kt-nav__separator"></li>
												<li class="kt-nav__foot"><a
													class="btn btn-label-brand btn-bold btn-sm" href="#">Upgrade
														plan</a> <a class="btn btn-clean btn-bold btn-sm"
													href="#" data-toggle="kt-tooltip"
													data-placement="right" title="Click to learn more...">Learn
														more</a></li>
											</ul>
											<!--end::Nav-->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end:: Subheader -->

					<!-- begin:: Content -->
					<div class="kt-container  kt-grid__item kt-grid__item--fluid">
						<!--Begin::Inbox-->
						<div
							class="kt-grid kt-grid--desktop kt-grid--ver-desktop  kt-inbox"
							id="kt_inbox">
							<!--Begin::Aside Mobile Toggle-->
							<button class="kt-inbox__aside-close"
								id="kt_inbox_aside_close">
								<i class="la la-close"></i>
							</button>
							<!--End:: Aside Mobile Toggle-->

							<!--Begin:: Inbox Aside-->
													<div class="kt-grid__item   kt-portlet  kt-inbox__aside"
														id="kt_inbox_aside">
														<button type="button"
															class="btn btn-brand  btn-upper btn-bold  kt-inbox__compose"
															id="msgModalBtnInbox">new message</button>


														<div class="kt-inbox__nav">
															<ul class="kt-nav">
																<li class="kt-nav__item kt-nav__item--active"><a
																	href="#" class="kt-nav__link" data-action="list"
																	data-type="inbox"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewBox="0 0 24 24"
																			version="1.1" class="kt-svg-icon kt-nav__link-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																				d="M6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,13 C19,13.5522847 18.5522847,14 18,14 L6,14 C5.44771525,14 5,13.5522847 5,13 L5,3 C5,2.44771525 5.44771525,2 6,2 Z M13.8,4 C13.1562,4 12.4033,4.72985286 12,5.2 C11.5967,4.72985286 10.8438,4 10.2,4 C9.0604,4 8.4,4.88887193 8.4,6.02016349 C8.4,7.27338783 9.6,8.6 12,10 C14.4,8.6 15.6,7.3 15.6,6.1 C15.6,4.96870845 14.9396,4 13.8,4 Z"
																				id="Combined-Shape" fill="#000000" opacity="0.3" />
        <path
																				d="M3.79274528,6.57253826 L12,12.5 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 Z"
																				id="Combined-Shape" fill="#000000" />
    </g>
</svg> <span class="kt-nav__link-text inboxBtn">Inbox</span> <span
																		class="kt-nav__link-badge"> <span
																			class="kt-badge kt-badge--unified-success kt-badge--md kt-badge--rounded kt-badge--boldest">3</span>
																	</span>
																</a></li>

																<li class="kt-nav__item"><a href="#"
																	class="kt-nav__link" data-action="list"
																	data-type="sent"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewBox="0 0 24 24"
																			version="1.1" class="kt-svg-icon kt-nav__link-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																				d="M8,13.1668961 L20.4470385,11.9999863 L8,10.8330764 L8,5.77181995 C8,5.70108058 8.01501031,5.63114635 8.04403925,5.56663761 C8.15735832,5.31481744 8.45336217,5.20254012 8.70518234,5.31585919 L22.545552,11.5440255 C22.6569791,11.5941677 22.7461882,11.6833768 22.7963304,11.794804 C22.9096495,12.0466241 22.7973722,12.342628 22.545552,12.455947 L8.70518234,18.6841134 C8.64067359,18.7131423 8.57073936,18.7281526 8.5,18.7281526 C8.22385763,18.7281526 8,18.504295 8,18.2281526 L8,13.1668961 Z"
																				id="Combined-Shape" fill="#000000" />
        <path
																				d="M4,16 L5,16 C5.55228475,16 6,16.4477153 6,17 C6,17.5522847 5.55228475,18 5,18 L4,18 C3.44771525,18 3,17.5522847 3,17 C3,16.4477153 3.44771525,16 4,16 Z M1,11 L5,11 C5.55228475,11 6,11.4477153 6,12 C6,12.5522847 5.55228475,13 5,13 L1,13 C0.44771525,13 6.76353751e-17,12.5522847 0,12 C-6.76353751e-17,11.4477153 0.44771525,11 1,11 Z M4,6 L5,6 C5.55228475,6 6,6.44771525 6,7 C6,7.55228475 5.55228475,8 5,8 L4,8 C3.44771525,8 3,7.55228475 3,7 C3,6.44771525 3.44771525,6 4,6 Z"
																				id="Combined-Shape" fill="#000000" opacity="0.3" />
    </g>
</svg> <span class="kt-nav__link-text sentBtn">Sent</span>
																</a></li>
																<li class="kt-nav__item"><a href="#"
																	class="kt-nav__link" data-action="list"
																	data-type="trash"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewBox="0 0 24 24"
																			version="1.1" class="kt-svg-icon kt-nav__link-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																				d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
																				id="round" fill="#000000" fill-rule="nonzero" />
        <path
																				d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
																				id="Shape" fill="#000000" opacity="0.3" />
    </g>
</svg> <span class="kt-nav__link-text">Trash</span>
																</a></li>

															</ul>
														</div>
													</div>
													<!--End::Aside-->

							<!--Begin:: Inbox List-->
													<div
														class="kt-grid__item kt-grid__item--fluid    kt-portlet    kt-inbox__list kt-inbox__list--shown"
														id="kt_inbox_list">
														<div class="kt-portlet__head">
															<div
																class="kt-inbox__toolbar kt-inbox__toolbar--extended">
																<div
																	class="kt-inbox__actions kt-inbox__actions--expanded">
																	<div class="kt-inbox__check">
																		<label
																			class="kt-checkbox kt-checkbox--single kt-checkbox--tick kt-checkbox--brand">
																			<input type="checkbox"> <span></span>
																		</label>

																		<div class="btn-group">
																			<button type="button"
																				class="kt-inbox__icon kt-inbox__icon--sm kt-inbox__icon--light"
																				data-toggle="dropdown">
																				<i class="flaticon2-down-arrow"></i>
																			</button>
																			<div
																				class="dropdown-menu dropdown-menu-left dropdown-menu-fit dropdown-menu-xs">
																				<ul class="kt-nav">
																					<li class="kt-nav__item kt-nav__item--active">
																						<a href="#" class="kt-nav__link"> <span
																							class="kt-nav__link-text">All</span>
																					</a>
																					</li>
																					<li class="kt-nav__item"><a href="#"
																						class="kt-nav__link"> <span
																							class="kt-nav__link-text">Read</span>
																					</a></li>
																					<li class="kt-nav__item"><a href="#"
																						class="kt-nav__link"> <span
																							class="kt-nav__link-text">Unread</span>
																					</a></li>
																					<li class="kt-nav__item"><a href="#"
																						class="kt-nav__link"> <span
																							class="kt-nav__link-text">Starred</span>
																					</a></li>
																					<li class="kt-nav__item"><a href="#"
																						class="kt-nav__link"> <span
																							class="kt-nav__link-text">Unstarred</span>
																					</a></li>
																				</ul>
																			</div>
																		</div>
																	</div>

																	<div class="kt-inbox__panel">
																		<button class="kt-inbox__icon"
																			data-toggle="kt-tooltip" title="Delete">
																			<svg xmlns="http://www.w3.org/2000/svg"
																				xmlns:xlink="http://www.w3.org/1999/xlink"
																				width="24px" height="24px" viewBox="0 0 24 24"
																				version="1.1" class="kt-svg-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																					d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
																					id="round" fill="#000000" fill-rule="nonzero" />
        <path
																					d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
																					id="Shape" fill="#000000" opacity="0.3" />
    </g>
</svg>
																		</button>
																		<button class="kt-inbox__icon"
																			data-toggle="kt-tooltip" title="Mark as read">
																			<svg xmlns="http://www.w3.org/2000/svg"
																				xmlns:xlink="http://www.w3.org/1999/xlink"
																				width="24px" height="24px" viewBox="0 0 24 24"
																				version="1.1" class="kt-svg-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																					d="M15.9956071,6 L9,6 C7.34314575,6 6,7.34314575 6,9 L6,15.9956071 C4.70185442,15.9316381 4,15.1706419 4,13.8181818 L4,6.18181818 C4,4.76751186 4.76751186,4 6.18181818,4 L13.8181818,4 C15.1706419,4 15.9316381,4.70185442 15.9956071,6 Z"
																					id="Combined-Shape" fill="#000000"
																					fill-rule="nonzero" opacity="0.3" />
        <path
																					d="M10.1818182,8 L17.8181818,8 C19.2324881,8 20,8.76751186 20,10.1818182 L20,17.8181818 C20,19.2324881 19.2324881,20 17.8181818,20 L10.1818182,20 C8.76751186,20 8,19.2324881 8,17.8181818 L8,10.1818182 C8,8.76751186 8.76751186,8 10.1818182,8 Z"
																					id="Rectangle-19-Copy-3" fill="#000000" />
    </g>
</svg>
																		</button>
																	</div>
																</div>
																<div class="kt-inbox__search">
																	<div class="input-group">
																		<input type="text" class="form-control"
																			placeholder="Search">
																		<div class="input-group-append">
																			<span class="input-group-text"> <!--<i class="la la-group"></i>-->
																				<svg xmlns="http://www.w3.org/2000/svg"
																					xmlns:xlink="http://www.w3.org/1999/xlink"
																					width="24px" height="24px" viewBox="0 0 24 24"
																					version="1.1" class="kt-svg-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																						d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
																						id="Path-2" fill="#000000" fill-rule="nonzero"
																						opacity="0.3" />
        <path
																						d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
																						id="Path" fill="#000000" fill-rule="nonzero" />
    </g>
</svg>
																			</span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="kt-portlet__body kt-portlet__body--fit-x">
															<div class="kt-inbox__items" data-type="inbox">
																<c:forEach items="${currentUser.messages.entrySet()}"
											var="entry">
											<c:if
												test="${entry.getKey().receiverID == currentUser.userID && entry.getKey().deletionStatus != MyConstants.CODE_DELETEDMESSAGE_BY_RECEIVER}">
												<c:if test="${entry.getKey().isRead == false}">
													<div
														class="kt-inbox__item kt-inbox__item--unread inbox-item"
														data-id="1" data-type="inbox"
														id="${entry.getKey().messageID}">
														<div class="kt-inbox__info">
															<div class="kt-inbox__actions">
																<label
																	class="kt-checkbox kt-checkbox--single kt-checkbox--tick kt-checkbox--brand">
																	<input type="checkbox"> <span></span>
																</label> <span
																	class="kt-inbox__icon kt-inbox__icon--on kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Star"> <i class="flaticon-star"></i>
																</span> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Mark as important"> <i
																	class="flaticon-add-label-button"></i>
																</span>
															</div>
															<div class="kt-inbox__sender" data-toggle="view">
																<!-- For admin,you will use c:if -->
																<span
																	class="kt-media kt-media--sm kt-media--danger"
																	id="${entry.getKey().messageID}senderImg"
																	style="background-image: url('${entry.getValue().profilePictureSrc}')">
																	<span></span>
																</span> <a href="#" class="kt-inbox__author"
																	id="${entry.getKey().messageID}sender">${entry.getValue().fullName}</a>
																<span id="NextReceiver" style="display: none">${entry.getValue().userID}</span>
															</div>
														</div>
														<div class="kt-inbox__details" data-toggle="view">
															<div class="kt-inbox__message">
																<span class="kt-inbox__subject"
																	id="${entry.getKey().messageID}topic">${entry.getKey().messageTopic}
																</span>
																<c:if test="${entry.getKey().text.length() > 100}">
																	<span class="kt-inbox__summary"
																		id="${entry.getKey().messageID}short_">${entry.getKey().text.substring(0,100)}...</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none">
																		${entry.getKey().text}</span>

																</c:if>
																<c:if
																	test="${entry.getKey().text.length() <= 100}">
																	<span class="kt-inbox__summary"
																		id="${entry.getKey().messageID}short_">${entry.getKey().text}</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none">
																		${entry.getKey().text}</span>
																</c:if>
															</div>
															<div class="kt-inbox__labels">
																<span
																	class="kt-inbox__label kt-badge kt-badge--unified-brand kt-badge--bold kt-badge--inline">inbox</span>
															</div>
														</div>
														<div class="kt-inbox__datetime"
															id="${entry.getKey().messageID}createdAt"
															data-toggle="view">
															${entry.getKey().formattedDateWithoutHours}</div>
														<span id="${entry.getKey().messageID}fullTime"
															style="display: none">
															${entry.getKey().formattedDate}</span>
													</div>
												</c:if>
												<c:if test="${entry.getKey().isRead == true}">
													<div class="kt-inbox__item inbox-item" data-id="3"
														data-type="inbox" id="${entry.getKey().messageID}">
														<div class="kt-inbox__info">
															<div class="kt-inbox__actions">
																<label
																	class="kt-checkbox kt-checkbox--single kt-checkbox--tick kt-checkbox--brand">
																	<input type="checkbox"> <span></span>
																</label> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Star"> <i class="flaticon-star"></i>
																</span> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Mark as important"> <i
																	class="flaticon-add-label-button"></i>
																</span>
															</div>
															<div class="kt-inbox__sender" data-toggle="view">
																<span
																	class="kt-media kt-media--sm kt-media--brand"
																	id="${entry.getKey().messageID}senderImg"
																	style="background-image: url('${entry.getValue().profilePictureSrc}')">
																	<span></span>
																</span> <a href="#" class="kt-inbox__author">${entry.getValue().fullName}</a>
																<span id="NextReceiver" style="display: none">${entry.getValue().userID}</span>

															</div>
														</div>

														<div class="kt-inbox__details" data-toggle="view">
															<div class="kt-inbox__message">
																<span class="kt-inbox__subject"
																	id="${entry.getKey().messageID}topic">${entry.getKey().messageTopic}
																</span>
																<c:if test="${entry.getKey().text.length() > 100}">
																	<span class="kt-inbox__summary">${entry.getKey().text.substring(0,100)}...</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none; white-space: pre">
																		${entry.getKey().text}</span>

																</c:if>
																<c:if
																	test="${entry.getKey().text.length() <= 100}">
																	<span class="kt-inbox__summary">${entry.getKey().text}</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none; white-space: pre">
																		${entry.getKey().text}</span>
																</c:if>
															</div>
														</div>
														<div class="kt-inbox__datetime"
															id="${entry.getKey().messageID}createdAt"
															data-toggle="view">
															${entry.getKey().formattedDateWithoutHours}</div>
														<span id="${entry.getKey().messageID}fullTime"
															style="display: none">
															${entry.getKey().formattedDate}</span>
													</div>
												</c:if>
											</c:if>
										</c:forEach>
										<c:forEach items="${currentUser.messages.entrySet()}" var="entry">
											<c:if
												test="${entry.getKey().senderID == currentUser.userID  && entry.getKey().deletionStatus != MyConstants.CODE_DELETEDMESSAGE_BY_SENDER}">
												<c:if test="${entry.getKey().isRead == false}">
													<div class="kt-inbox__item kt-inbox__item--unread"
														data-id="20" data-type="sent"
														id="${entry.getKey().messageID}">
														<div class="kt-inbox__info">
															<div class="kt-inbox__actions">
																<label
																	class="kt-checkbox kt-checkbox--single kt-checkbox--tick kt-checkbox--brand">
																	<input type="checkbox"> <span></span>
																</label> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Star"> <i class="flaticon-star"></i>
																</span> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Mark as important"> <i
																	class="flaticon-add-label-button"></i>
																</span>
															</div>
															<div class="kt-inbox__sender" data-toggle="view">
																<c:if
																	test="${entry.getValue().userType == MyConstants.TYPE_ADMIN}">
																	<span
																		class="kt-media kt-media--sm kt-media--brand"
																		style="background-image: url('./assets/media/users/100_5.jpg')"
																		id="${entry.getKey().messageID}senderImg"> <span></span>
																	</span>
																</c:if>
																<c:if
																	test="${entry.getValue().userType != MyConstants.TYPE_ADMIN}">
																	<span
																		class="kt-media kt-media--sm kt-media--brand"
																		style="background-image: url('${entry.getValue().profilePictureSrc}')"
																		id="${entry.getKey().messageID}senderImg"> <span></span>
																	</span>
																</c:if>
																<a href="#" class="kt-inbox__author"
																	id="${entry.getKey().messageID}sender">${entry.getValue().fullName}</a>
															</div>
														</div>
														<div class="kt-inbox__details" data-toggle="view">
															<div class="kt-inbox__message">
																<span class="kt-inbox__subject"
																	id="${entry.getKey().messageID}topic">${entry.getKey().messageTopic}
																</span>
																<c:if test="${entry.getKey().text.length() > 100}">
																	<span class="kt-inbox__summary"
																		id="${entry.getKey().messageID}short_">${entry.getKey().text.substring(0,100)}...</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none; white-space: pre">
																		${entry.getKey().text}</span>

																</c:if>
																<c:if test="${entry.getKey().text.length() <= 100}">
																	<span class="kt-inbox__summary"
																		id="${entry.getKey().messageID}short_">${entry.getKey().text}</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none; white-space: pre">
																		${entry.getKey().text}</span>
																</c:if>
															</div>
														</div>
														<div class="kt-inbox__datetime"
															id="${entry.getKey().messageID}createdAt"
															data-toggle="view">
															${entry.getKey().formattedDateWithoutHours}</div>
														<span id="${entry.getKey().messageID}fullTime"
															style="display: none">
															${entry.getKey().formattedDate}</span>
													</div>
												</c:if>
												<c:if test="${entry.getKey().isRead == true}">
													<div class="kt-inbox__item" data-id="19"
														data-type="sent" id="${entry.getKey().messageID}">
														<div class="kt-inbox__info">
															<div class="kt-inbox__actions">
																<label
																	class="kt-checkbox kt-checkbox--single kt-checkbox--tick kt-checkbox--brand">
																	<input type="checkbox"> <span></span>
																</label> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Star"> <i class="flaticon-star"></i>
																</span> <span
																	class="kt-inbox__icon kt-inbox__icon--light"
																	data-toggle="kt-tooltip" data-placement="right"
																	title="Mark as important"> <i
																	class="flaticon-add-label-button"></i>
																</span>
															</div>
															<div class="kt-inbox__sender" data-toggle="view">
																<c:if
																	test="${entry.getValue().userType == MyConstants.TYPE_ADMIN}">
																	<span
																		class="kt-media kt-media--sm kt-media--brand"
																		style="background-image: url('./assets/media/users/100_5.jpg')">
																		<span></span>
																	</span>
																</c:if>
																<c:if
																	test="${entry.getValue().userType != MyConstants.TYPE_ADMIN}">
																	<span
																		class="kt-media kt-media--sm kt-media--brand"
																		style="background-image: url('${entry.getValue().profilePictureSrc}')">
																		<span></span>
																	</span>
																</c:if>
																<a href="#" class="kt-inbox__author">${entry.getValue().fullName}</a>
															</div>
														</div>
														<div class="kt-inbox__details" data-toggle="view">
															<div class="kt-inbox__message">
																<span class="kt-inbox__subject">${entry.getKey().messageTopic}</span>
																<c:if test="${entry.getKey().text.length() > 100}">
																	<span class="kt-inbox__summary">${entry.getKey().text.substring(0,100)}...</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none; white-space: pre">
																		${entry.getKey().text}</span>

																</c:if>
																<c:if test="${entry.getKey().text.length() <= 100}">
																	<span class="kt-inbox__summary">${entry.getKey().text}</span>
																	<span id="${entry.getKey().messageID}fullText"
																		style="display: none; white-space: pre">
																		${entry.getKey().text}</span>
																</c:if>
															</div>
														</div>
														<div class="kt-inbox__datetime" data-toggle="view">
															${entry.getKey().formattedDateWithoutHours}</div>
													</div>
												</c:if>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<!--End:: Inbox List-->

							<!--Begin:: Inbox View-->
													<div
														class="kt-grid__item kt-grid__item--fluid    kt-portlet    kt-inbox__view kt-inbox__view--shown-"
														id="kt_inbox_view">
														<div class="kt-portlet__head">
															<div class="kt-inbox__toolbar">
																<div class="kt-inbox__actions">
																	<a href="#" class="kt-inbox__icon kt-inbox__icon--back"
																		id="inboxViewBack"> <i
																		class="flaticon2-left-arrow-1"></i>
																	</a> <a href="#" class="kt-inbox__icon"
																		data-toggle="kt-tooltip" title="Delete"
																		id="delFromInboxView"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewBox="0 0 24 24"
																			version="1.1" class="kt-svg-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																				d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z"
																				id="round" fill="#000000" fill-rule="nonzero" />
        <path
																				d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z"
																				id="Shape" fill="#000000" opacity="0.3" />
    </g>
</svg>
																	</a> <a href="#" class="kt-inbox__icon"
																		data-toggle="kt-tooltip" title="Mark as read"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewBox="0 0 24 24"
																			version="1.1" class="kt-svg-icon">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect id="bound" x="0" y="0" width="24" height="24" />
        <path
																				d="M15.9956071,6 L9,6 C7.34314575,6 6,7.34314575 6,9 L6,15.9956071 C4.70185442,15.9316381 4,15.1706419 4,13.8181818 L4,6.18181818 C4,4.76751186 4.76751186,4 6.18181818,4 L13.8181818,4 C15.1706419,4 15.9316381,4.70185442 15.9956071,6 Z"
																				id="Combined-Shape" fill="#000000"
																				fill-rule="nonzero" opacity="0.3" />
        <path
																				d="M10.1818182,8 L17.8181818,8 C19.2324881,8 20,8.76751186 20,10.1818182 L20,17.8181818 C20,19.2324881 19.2324881,20 17.8181818,20 L10.1818182,20 C8.76751186,20 8,19.2324881 8,17.8181818 L8,10.1818182 C8,8.76751186 8.76751186,8 10.1818182,8 Z"
																				id="Rectangle-19-Copy-3" fill="#000000" />
    </g>
</svg>
																	</a>
																</div>
															</div>
														</div>

														<div class="kt-portlet__body kt-portlet__body--fit-x">
															<div class="kt-inbox__subject">
																<div class="kt-inbox__title">
																	<h3 class="kt-inbox__text msg-topic"></h3>
																</div>
															</div>

															<div class="kt-inbox__messages">
																<div
																	class="kt-inbox__message kt-inbox__message--expanded">
																	<div class="kt-inbox__head">
																		<span class="kt-media sender_img" data-toggle="expand"
																			style="background-image: url('./assets/media/users/100_13.jpg')">
													<span></span>
												</span>
												<div class="kt-inbox__info">
													<div class="kt-inbox__author" data-toggle="expand">
														<a href="#" class="kt-inbox__name sender_name"></a>
														<div class="kt-inbox__status">
															<span class="msg_dateTime"> 1 day ago</span>
														</div>
														&nbsp
														&nbsp
														&nbsp
														<span id="replyIcon" class="kt-inbox__icon kt-inbox__icon--reply kt-inbox__icon--light" data-toggle="kt-tooltip" data-placement="top" title="" data-original-title="Reply">
					                                    <i class="flaticon2-reply-1"></i>
					                                	</span>
													</div>
													
													<div class="kt-inbox__details">
														<div class="kt-inbox__tome">
															<span class="kt-inbox__label _toWho"
																data-toggle="dropdown"> to me <i
																class="flaticon2-down"></i>
															</span>
															<div
																class="dropdown-menu dropdown-menu-fit dropdown-menu-md dropdown-menu-left">
																<table class="kt-inbox__details">
																	<tr>
																		<td>date:</td>
																		<td class="msgDate_">Jul 30, 2019, 11:27 PM</td>
																	</tr>
																	<tr>
																		<td>from:</td>
																		<td class="msgSender_">Mark Andre</td>
																	</tr>
																	<tr>
																		<td>subject:</td>
																		<td class="msgSubject_">Trip Reminder.
																			Thank you for flying with us!</td>
																	</tr>
																	<tr>
																		<td>reply to:</td>
																		<td class="msg_reply">mark.andre@gmail.com</td>
																	</tr>
																</table>
															</div>
														</div>
														<div class="kt-inbox__desc msgText_short"
															data-toggle="expand">With resrpect, i must
															disagree with Mr.Zinsser. We all know the most part
															of important part....</div>
													</div>
												</div>
											</div>
											<div class="kt-inbox__body">
												<div class="kt-inbox__text">
													<p class="kt-margin-t-25 msg_paragraph"
														style="white-space: pre-line">With resrpect, i
														must disagree with Mr.Zinsser. We all know the most
														part of important part of any article is the
														title.Without a compelleing title, your reader won't
														even get to the first sentence.After the title,
														however, the first few sentences of your article are
														certainly the most important part.</p>
												</div>
											</div>
										</div>
										<form id="deleteFromViewForm">
											<input type="hidden" name="operation"
												value="${MyConstants.OPP_DELETE_MESSAGE}"> <input
												id="deletedMessageInput" type="hidden"
												name="deletedMessage" value=""> <input
												id="currentUserRoleInput" type="hidden"
												name="currentUserRole" value="receiver">
										</form>

									</div>

									<div class="kt-inbox__reply kt-inbox__reply--on">
										<div class="kt-inbox__actions">
											<button class="btn btn-secondary btn-bold">
												<i class="flaticon2-reply-1 kt-font-brand"></i> Reply
											</button>

											<button class="btn btn-secondary btn-bold">
												<i class="flaticon2-left-arrow-1 kt-font-brand"></i>
												Forward
											</button>
										</div>

										<div class="kt-inbox__form" id="kt_inbox_compose_form"
											style="display: none">
											<div class="kt-inbox__head">
												<div class="kt-inbox__title">Reply</div>
												<div class="kt-inbox__actions">
													<button type="button"
														class="kt-inbox__icon kt-inbox__icon--md kt-inbox__icon--light"
														id="">
														<i class="flaticon2-cross"></i>
													</button>
												</div>
											</div>
											<form id="msgInfoFormReply">
												<div class="kt-inbox__body">
													<div class="kt-inbox__to">
														<div class="kt-inbox__wrapper">
															<div class="kt-inbox__field kt-inbox__field--to">
																<div class="kt-inbox__label">To:</div>
																<input id="reply__" type="text"
																	name="receiverName" value=""
																	style="border: 1px solid #F0F8FF; border-radius: 5px; background-color: #F0F8FF">
																<input id="receiverID__" type="hidden"
																	name="receiverID" value="">
															</div>
														</div>
													</div>

													<div class="kt-inbox__subject"
														style="border-bottom: 1px inset">
														<input id="msgsbjct"
															class="form-control replySubjectArea"
															name="messageSubject" placeholder="Subject">
														<hr>

													</div>

													<textarea name="messageText"
														class="form-control replyTextArea"
														placeholder="Type your message here"
														style="height: 300px; width: %100; border: none"></textarea>
													<input type="hidden" name="operation"
														value="${MyConstants.OPP_SEND_MESSAGE}">

													<div class="kt-inbox__attachments">
														<div class="dropzone dropzone-multi"
															id="kt_inbox_compose_attachments">
															<div class="dropzone-items"></div>
															<div class="dz-default dz-message">
																<span>Drop files here to upload</span>
															</div>
														</div>
													</div>
												</div>
											</form>

											<div class="kt-inbox__foot">
												<div class="kt-inbox__primary">
													<div class="btn-group">
														<button type="button"
															class="btn btn-brand btn-bold msg-PushButton">Send</button>
														<input type="hidden" value="msgInfoFormReply">
														<div
															class="dropdown-menu dropup dropdown-menu-fit dropdown-menu-right">
															<ul class="kt-nav">
																<li class="kt-nav__item"><a href="#"
																	class="kt-nav__link"> <i
																		class="kt-nav__link-icon flaticon2-writing"></i>
																		<span class="kt-nav__link-text">Schedule
																			Send</span>
																</a></li>
																<li class="kt-nav__item"><a href="#"
																	class="kt-nav__link"> <i
																		class="kt-nav__link-icon flaticon2-medical-records"></i>
																		<span class="kt-nav__link-text">Save
																			&amp; archive</span>
																</a></li>
																<li class="kt-nav__item"><a href="#"
																	class="kt-nav__link"> <i
																		class="kt-nav__link-icon flaticon2-hourglass-1"></i>
																		<span class="kt-nav__link-text">Cancel</span>
																</a></li>
															</ul>
														</div>
													</div>

													<div class="kt-inbox__panel">
														<label
															class="kt-inbox__icon kt-inbox__icon--light dz-clickable"
															id="kt_inbox_compose_attachments_select"> <i
															class="flaticon2-clip-symbol"></i>
														</label>
													</div>
												</div>

												<div class="kt-inbox__secondary">
													<button
														class="kt-inbox__icon kt-inbox__icon--remove kt-inbox__icon--light"
														data-toggle="kt-tooltip" title=""
														data-original-title="Dismiss reply">
														<i class="flaticon2-rubbish-bin-delete-button"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--End:: 
-->
						</div>
						<!--End::Inbox-->

						<!--Begin:: Inbox Compose-->
						<div
							class="modal modal-sticky-bottom-right modal-sticky-lg show"
							id="kt_inbox_composeFromMain" role="dialog"
							data-backdrop="false" aria-modal="true"
							style="padding-right: 17px; display: none;">
							<div class="modal-dialog" role="document">
								<div class="modal-content kt-inbox">
									<div class="kt-inbox__form" id="kt_inbox_compose_form">
										<div class="kt-inbox__head">
											<div class="kt-inbox__title">New Message</div>
											<div class="kt-inbox__actions">
												<button type="button"
													class="kt-inbox__icon kt-inbox__icon--md kt-inbox__icon--light"
													id="msgModelCloseBtnInbox">
													<i class="flaticon2-cross"></i>
												</button>
											</div>
										</div>
										<form id="msgInfoFormInbox">
											<div class="kt-inbox__body">
												<div class="kt-inbox__to">
													<div class="kt-inbox__wrapper">
														<div class="kt-inbox__field kt-inbox__field--to">
															<div class="kt-inbox__label">To:</div>
															<input id="receiverSelect" type="text"
																class="form-control" name="receiverName" value=""
																style="border: 1px solid #F0F8FF; border-radius: 5px; background-color: #F0F8FF; width: 300px; height: 30px">
															<input type="hidden" id="receiverFromInbox"
																name="receiverID" value="">
															<div class="tagify__dropdown color-blue"
																role="menu"
																style="left: 5px; top: 120.8px; width: 442.75px; display: none"
																id="systemUsers">

																<c:forEach items="${allSystemUsers}" var="user">
																	<c:if test="${user.userID != currentUser.userID}">
																		<div
																			class="tagify__dropdown__item tagify__dropdown__item">
																			<!--  --active -->
																			<div class="kt-media-card" id="${user.userID}">
																				<c:if
																					test="${user.userType != MyConstants.TYPE_ADMIN}">
																					<span class="kt-media kt-media--"
																						style="background-image: url('${user.profilePictureSrc}')"><span></span>
																					</span>
																				</c:if>
																				<c:if
																					test="${user.userType == MyConstants.TYPE_ADMIN}">
																					<span class="kt-media kt-media--"
																						style="background-image: url('./assets/media/users/100_6.jpg')"><span></span>
																					</span>
																				</c:if>

																				<div class="kt-media-card__info">
																					<a href="#"
																						class="kt-media-card__title ${user.userID}fullName">${user.fullName}</a>
																					<span class="kt-media-card__desc">${user.username}</span>
																				</div>
																			</div>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
														</div>
													</div>
												</div>

												<div class="kt-inbox__subject"
													style="border-bottom: 1px inset">
													<input id="msgsbjct"
														class="form-control inboxSubjectArea"
														name="messageSubject" placeholder="Subject">
													<hr>

												</div>

												<textarea name="messageText"
													class="form-control inboxTextArea"
													placeholder="Type your message here"
													style="height: 300px; width: %100; border: none"></textarea>
												<input type="hidden" name="operation"
													value="${MyConstants.OPP_SEND_MESSAGE}">

												<div class="kt-inbox__attachments">
													<div class="dropzone dropzone-multi"
														id="kt_inbox_compose_attachments">
														<div class="dropzone-items"></div>
														<div class="dz-default dz-message">
															<span>Drop files here to upload</span>
														</div>
													</div>
												</div>
											</div>
										</form>

										<div class="kt-inbox__foot">
											<div class="kt-inbox__primary">
												<div class="btn-group">
													<button type="button"
														class="btn btn-brand btn-bold msg-PushButton">Send</button>
													<input type="hidden" value="msgInfoFormInbox">
													<div
														class="dropdown-menu dropup dropdown-menu-fit dropdown-menu-right">
														<ul class="kt-nav">
															<li class="kt-nav__item"><a href="#"
																class="kt-nav__link"> <i
																	class="kt-nav__link-icon flaticon2-writing"></i>
																	<span class="kt-nav__link-text">Schedule
																		Send</span>
															</a></li>
															<li class="kt-nav__item"><a href="#"
																class="kt-nav__link"> <i
																	class="kt-nav__link-icon flaticon2-medical-records"></i>
																	<span class="kt-nav__link-text">Save &amp;
																		archive</span>
															</a></li>
															<li class="kt-nav__item"><a href="#"
																class="kt-nav__link"> <i
																	class="kt-nav__link-icon flaticon2-hourglass-1"></i>
																	<span class="kt-nav__link-text">Cancel</span>
															</a></li>
														</ul>
													</div>
												</div>

												<div class="kt-inbox__panel">
													<label
														class="kt-inbox__icon kt-inbox__icon--light dz-clickable"
														id="kt_inbox_compose_attachments_select"> <i
														class="flaticon2-clip-symbol"></i>
													</label>
												</div>
											</div>

											<div class="kt-inbox__secondary">
												<button
													class="kt-inbox__icon kt-inbox__icon--remove kt-inbox__icon--light"
													data-toggle="kt-tooltip" title=""
													data-original-title="Dismiss reply">
													<i class="flaticon2-rubbish-bin-delete-button"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--End:: Inbox Compose-->
					</div>
					<!-- end:: Content -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end:: Content -->
						
						<!-- 3 wrapper class end-->
					</div>
				</div>
			</div>
			
			<!-- end root -->
		</div>
	</div>

	<!-- end:: Page -->




	<!-- begin::Global Config(global config for global JS sciprts) -->
	<script>
		var KTAppOptions = {
			"colors" : {
				"state" : {
					"brand" : "#591df1",
					"light" : "#ffffff",
					"dark" : "#282a3c",
					"primary" : "#5867dd",
					"success" : "#34bfa3",
					"info" : "#36a3f7",
					"warning" : "#ffb822",
					"danger" : "#fd3995"
				},
				"base" : {
					"label" : [ "#c5cbe3", "#a1a8c3", "#3d4465", "#3e4466" ],
					"shape" : [ "#f0f3ff", "#d9dffa", "#afb4d4", "#646c9a" ]
				}
			}
		};
	</script>
	<!-- end::Global Config -->


	<!--begin:: Global Mandatory Vendors -->
	<script src="./assets/vendors/general/jquery/dist/jquery.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/popper.js/dist/umd/popper.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap/dist/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/js-cookie/src/js.cookie.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/moment/min/moment.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/tooltip.js/dist/umd/tooltip.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/perfect-scrollbar/dist/perfect-scrollbar.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/sticky-js/dist/sticky.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/wnumb/wNumb.js"
		type="text/javascript"></script>
	<!--end:: Global Mandatory Vendors -->

	<script src="./js/Like.js" type="text/javascript"></script>
	<script src="./js/Comment.js" type="text/javascript"></script>
	<script src="./js/Message.js" type="text/javascript"></script>
	<script src="./js/sidenavbar.js" type="text/javascript"></script>
	<script src="./js/pageRefreshForSession.js" type="text/javascript"></script>

	<!--begin:: Global Optional Vendors -->
	<script
		src="./assets/vendors/general/jquery-form/dist/jquery.form.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/block-ui/jquery.blockUI.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/js/vendors/bootstrap-datepicker.init.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-timepicker/js/bootstrap-timepicker.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/js/vendors/bootstrap-timepicker.init.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-maxlength/src/bootstrap-maxlength.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-select/dist/js/bootstrap-select.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-switch/dist/js/bootstrap-switch.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/js/vendors/bootstrap-switch.init.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/select2/dist/js/select2.full.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/ion-rangeslider/js/ion.rangeSlider.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/typeahead.js/dist/typeahead.bundle.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/handlebars/dist/handlebars.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/inputmask/dist/jquery.inputmask.bundle.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/inputmask/dist/inputmask/inputmask.date.extensions.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/inputmask/dist/inputmask/inputmask.numeric.extensions.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/nouislider/distribute/nouislider.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/owl.carousel/dist/owl.carousel.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/autosize/dist/autosize.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/clipboard/dist/clipboard.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/dropzone/dist/dropzone.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/custom/js/vendors/dropzone.init.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/quill/dist/quill.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/@yaireo/tagify/dist/tagify.polyfills.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/@yaireo/tagify/dist/tagify.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/summernote/dist/summernote.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/markdown/lib/markdown.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-markdown/js/bootstrap-markdown.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/js/vendors/bootstrap-markdown.init.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/bootstrap-notify/bootstrap-notify.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/js/vendors/bootstrap-notify.init.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/jquery-validation/dist/jquery.validate.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/jquery-validation/dist/additional-methods.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/js/vendors/jquery-validation.init.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/toastr/build/toastr.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/dual-listbox/dist/dual-listbox.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/raphael/raphael.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/morris.js/morris.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/chart.js/dist/Chart.bundle.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/custom/vendors/jquery-idletimer/idle-timer.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/waypoints/lib/jquery.waypoints.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/counterup/jquery.counterup.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/es6-promise-polyfill/promise.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/jquery.repeater/src/lib.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/general/jquery.repeater/src/jquery.input.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/jquery.repeater/src/repeater.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/general/dompurify/dist/purify.js"
		type="text/javascript"></script>
	<!--end:: Global Optional Vendors -->

	<!--begin::Global Theme Bundle(used by all pages) -->

	<script src="./assets/js/demo9/scripts.bundle.js"
		type="text/javascript"></script>
	<!--end::Global Theme Bundle -->
	<script src="./assets/js/demo9/pages/custom/inbox/inbox.js"
		type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		function messageSentSuccesInbox() {
			swal({
				title : "Success!",
				text : "Your message has been sent successfully !",
				icon : "success",
				button : "Ok",
			});
		}
		function messageDeleteSuccesInbox(){
			swal({
				title : "Success!",
				text : "Your message has been deleted successfully !",
				icon : "success",
				button : "Ok",
			});
	
		}
	</script>
</body>
<!-- end::Body -->
</html>
