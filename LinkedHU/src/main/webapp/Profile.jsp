<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="general.MyConstants" %>     

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>

<html lang="en" >
    <!-- begin::Head -->
    <head><!--begin::Base Path (base relative path for assets of this page) -->
        <meta charset="utf-8"/>

        <title>Profile</title>
        <meta name="description" content="List columns 1 example">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


		<!--begin::Fonts -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">       
		 <!--end::Fonts -->
		 <link href="./assets/css/demo9/pages/inbox/inbox.css" rel="stylesheet" type="text/css" />         
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
		<!--end::Global Theme Styles -->
		<link href="./css/sidenavbar.css" rel="stylesheet" type="text/css" />
		
    </head>
    <!-- end::Head -->

    <!-- begin::Body -->
    <body  class="kt-page--loading-enabled kt-page--loading kt-app__aside--left kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header--minimize-menu kt-header-mobile--fixed kt-subheader--enabled kt-subheader--transparent kt-aside--enabled kt-aside--left kt-aside--fixed kt-page--loading"  >

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


			<!-- begin:: 3 wrapper classes for content-->
			<div
				class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper"
				id="kt_wrapper" style="padding: 0px !important">
				<div
					class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch"
					id="kt_body">
					<div
						class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor"
						id="kt_content">

<!-- begin:: content of the page -->
<div class="kt-container  kt-grid__item kt-grid__item--fluid" style="padding-top: 30px;">


	<c:if test="${otherUser.userType == MyConstants.TYPE_ACADEMICIAN}">
		<div class="row">
			<div class="col-xl-12">
				<!--begin:: Widgets/Applications/User/Profile3-->
				<div class="kt-portlet kt-portlet--height-fluid">
					<div class="kt-portlet__body">
						
	
						<!-- begin delete profile pop up -->
						<div class="modal fade show" id="del-modal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Are
											You Sure?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div
										style="display: flex; justify-content: center; align-content: space-between; margin-top: 2rem;">
	
										<p>Warning! This operation cannot be undone!</p>
									</div>
									<div class="modal-body"
										style="display: flex; justify-content: center; align-content: space-between;">
										<form method="POST" action="UserController">
											<div class="form-group">
	
												<button type="submit" value="submit"
													class="btn btn-primary">Delete This Account</button>
												<input type="hidden" id="31" name="operation"
													value="${MyConstants.OPP_DELETE_SELF}">
											</div>
										</form>
	
									</div>
									<div class="modal-footer"></div>
								</div>
							</div>
						</div>
						<!-- begin delete profile pop up end-->
	
						<div class="kt-widget kt-widget--user-profile-3">
							<div class="kt-widget__top">
								<div class="kt-widget__media kt-hidden-">
									<img src="${otherUser.profilePictureSrc}" alt="image">
	
								</div>
								<div
									class="kt-widget__pic kt-widget__pic--danger kt-font-danger kt-font-boldest kt-font-light kt-hidden">
									JM</div>
								<div class="kt-widget__content">
									<div class="kt-widget__head">
										<a href="#" class="kt-widget__username"> <c:out
												value="${otherUser.fullName}">name</c:out> <i
											class="flaticon2-correct"></i>
										</a>
	
										<div class="kt-widget__action" style="display:flex">
											
											<!-- fallow button -->
											<c:if test="${currentUser.userID != otherUser.userID}">
											<button type="button" class="btn btn-label-success btn-sm btn-upper follow-btn" id="msgModalBtnOtherUser">Send Message</button>
											</c:if>
											<c:if
												test="${ (currentUser.userID != otherUser.userID) && (currentUser.userType == MyConstants.TYPE_STUDENT)}">
												<form id="followform">
													<input type="hidden" name="operation"
														value="${MyConstants.OPP_FOLLOW }"> <input
														type="hidden" name="userID"
														value="${currentUser.userID }"> <input
														type="hidden" name="otherID"
														value="${otherUser.userID }">
												</form>
												<form id="unfollowform">
													<input type="hidden" name="operation"
														value="${MyConstants.OPP_UNFOLLOW }"> <input
														type="hidden" name="userID"
														value="${currentUser.userID }"> <input
														type="hidden" name="otherID"
														value="${otherUser.userID }">
												</form>
	
												<!-- bir buton daha koy c if e al rengine g�re -->
												<c:if
													test="${!currentUser.follows.contains(otherUser.userID)}">
													<button type="button"
														class="btn btn-label-success btn-sm btn-upper follow-btn">Follow User</button>
													<button type="button"
														class="btn btn-label-danger btn-sm btn-upper follow-btn"
														style="display: none;">Unfollow User</button>
												</c:if>
												
												
												
												
												
												<c:if
													test="${currentUser.follows.contains(otherUser.userID)}">
													<button type="button"
														class="btn btn-label-success btn-sm btn-upper follow-btn"
														style="display: none;">Follow User</button>
													<button type="button"
														class="btn btn-label-danger btn-sm btn-upper follow-btn">Unfollow User</button>
												</c:if>
	
											</c:if>
											<!-- fallow button end -->
											
											<!-- delete account button -->
											<c:if
												test="${ currentUser.userID == otherUser.userID }">
												<button type="button"
													class="btn btn-label-danger btn-sm btn-upper"
													data-toggle="modal" data-target="#del-modal">Delete
													Account</button>
											</c:if>
											
											
										</div>
									</div>
	
									<div class="kt-widget__subhead">
										<a href="#"><i class="flaticon2-new-email"></i> <c:out
												value="${otherUser.email}">email</c:out></a> <a href="#"><i
											class="flaticon2-calendar-3"></i> <c:out
												value="${otherUser.academicTitle}">academicTitle</c:out>
										</a> <a href="https://cs.hacettepe.edu.tr/index_tr.html"><i
											class="flaticon2-placeholder"></i> Hacettepe University
											CS</a> <a href="#"><i class="flaticon-home"></i> Office
											Number: <c:out value="${otherUser.officeNumber}">officeNumber</c:out>
										</a>
	
									</div>
	
									<div class="kt-widget__info">
										<div class="kt-widget__desc">
											<c:out value="${otherUser.bio}">bio</c:out>
											<div
												class="kt-portlet kt-portlet--bordered-semi kt-portlet--height-fluid">
												<div class="kt-portlet__head">
													<div class="kt-portlet__head-label">
														<h3 class="kt-portlet__head-title">Profile</h3>
													</div>
												</div>
												<div class="kt-portlet__body">
													<div class="kt-widget4">
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Professional History</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line">${ otherUser.professionalHistory }
															</div>
														</div>
	
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Research History</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line">${ otherUser.researchHistory }
															</div>
														</div>
	
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Proficiencies</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line;">
																${otherUser.proficiencies}</div>
														</div>
													</div>
												</div>
											</div>
	
										</div>
	
									</div>
								</div>
							</div>
							<div class="kt-widget__bottom">
	
								<div class="kt-widget__item">
									<div class="kt-widget__icon">
										<i class="flaticon-users"></i>
									</div>
									<div class="kt-widget__details">
										<span class="kt-widget__title">Followers</span> <span
											id="followercount" class="kt-widget__value">${followerCount}</span>
									</div>
								</div>
	
								<div class="kt-widget__item">
									<div class="kt-widget__icon">
										<i class="flaticon-chat-1"></i>
									</div>
									<div class="kt-widget__details">
										<span class="kt-widget__title">${otherUser.authorOf.size()}
											Posts</span> <a href="#"
											class="kt-widget__value kt-font-brand"
											onclick="togglePostView()" id="viewControl">View</a>
										<script type="text/javascript">
											function togglePostView() {
												var x = document
														.getElementById('postProfileDiv');
												if (x.style.display === 'none') {
													x.style.display = 'block';
													document
															.getElementById('viewControl').textContent = "Hide";
												} else {
													x.style.display = 'none';
													document
															.getElementById('viewControl').textContent = "View";
												}
											}
										</script>
									</div>
								</div>
								<!-- 
	
		<div class="kt-widget__item">
			<div class="kt-widget__icon">
				<i class="flaticon-network"></i>
			</div>
			<div class="kt-widget__details">
				<div class="kt-section__content kt-section__content--solid">
					<div class="kt-media-group">
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="John Myer">
							<img src="./assets/media/users/100_1.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Alison Brandy">
							<img src="./assets/media/users/100_10.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Selina Cranson">
							<img src="./assets/media/users/100_11.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Luke Walls">
							<img src="./assets/media/users/100_2.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<img src="./assets/media/users/100_3.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<span>+3</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		-->
	
							</div>
						</div>
					</div>
				</div>
				<!--end:: Widgets/Applications/User/Profile3-->
			</div>
		</div>
	
	</c:if>
	
	<c:if test="${otherUser.userType == MyConstants.TYPE_GRADUATE}">
		<div class="row">
			<div class="col-xl-12">
				<!--begin:: Widgets/Applications/User/Profile3-->
				<div class="kt-portlet kt-portlet--height-fluid">
					<div class="kt-portlet__body">
						
	
						<!-- begin delete profile pop up -->
						<div class="modal fade show" id="del-modal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							style="display: none; padding-right: 16px;"
							aria-modal="true">
							<div class="modal-dialog modal-dialog-centered"
								role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Are You Sure?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div
										style="display: flex; justify-content: center; align-content: space-between; margin-top: 2rem;">
	
										<p>Warning! This operation cannot be undone!</p>
									</div>
									<div class="modal-body"
										style="display: flex; justify-content: center; align-content: space-between;">
										<form method="POST" action="UserController">
											<div class="form-group">
	
												<button type="submit" value="submit"
													class="btn btn-primary">Delete This Account</button>
												<input type="hidden" id="31" name="operation"
													value="${MyConstants.OPP_DELETE_SELF}">
											</div>
										</form>
	
									</div>
									<div class="modal-footer"></div>
								</div>
							</div>
						</div>
						<!-- begin delete profile pop up end-->
	
						<div class="kt-widget kt-widget--user-profile-3">
							<div class="kt-widget__top">
								<div class="kt-widget__media kt-hidden-">
									<img src="${otherUser.profilePictureSrc}" alt="image">
	
								</div>
								<div
									class="kt-widget__pic kt-widget__pic--danger kt-font-danger kt-font-boldest kt-font-light kt-hidden">
									JM</div>
								<div class="kt-widget__content">
									<div class="kt-widget__head">
										<a href="#" class="kt-widget__username"> <c:out
												value="${otherUser.fullName}">name</c:out> <i
											class="flaticon2-correct"></i>
										</a>
	
										<div class="kt-widget__action">
											
											<!-- fallow button -->
											<c:if test="${currentUser.userID != otherUser.userID}">
												<button type="button" class="btn btn-label-success btn-sm btn-upper" id="msgModalBtnOtherUser">Send Message</button>
											</c:if>
											<c:if
												test="${ (currentUser.userID != otherUser.userID) && (currentUser.userType == MyConstants.TYPE_STUDENT)}">
												<form id="followform">
													<input type="hidden" name="operation"
														value="${MyConstants.OPP_FOLLOW }"> <input
														type="hidden" name="userID"
														value="${currentUser.userID }"> <input
														type="hidden" name="otherID"
														value="${otherUser.userID }">
												</form>
												<form id="unfollowform">
													<input type="hidden" name="operation"
														value="${MyConstants.OPP_UNFOLLOW }"> <input
														type="hidden" name="userID"
														value="${currentUser.userID }"> <input
														type="hidden" name="otherID"
														value="${otherUser.userID }">
												</form>
	
												<!-- bir buton daha koy c if e al rengine g�re -->
												<c:if
													test="${!currentUser.follows.contains(otherUser.userID)}">
													<button type="button"
														class="btn btn-label-success btn-sm btn-upper follow-btn">Follow User</button>
													<button type="button"
														class="btn btn-label-danger btn-sm btn-upper follow-btn"
														style="display: none;">Unfollow User</button>
												</c:if>
	
												<c:if
													test="${currentUser.follows.contains(otherUser.userID)}">
													<button type="button"
														class="btn btn-label-success btn-sm btn-upper follow-btn"
														style="display: none;">Follow User</button>
													<button type="button"
														class="btn btn-label-danger btn-sm btn-upper follow-btn">Unfollow User</button>
												</c:if>
	
											</c:if>
											<!-- fallow button end -->
											
											<!-- delete account button -->
											<c:if
												test="${ currentUser.userID == otherUser.userID }">
												<button type="button"
													class="btn btn-label-danger btn-sm btn-upper"
													data-toggle="modal" data-target="#del-modal">Delete Account</button>
											</c:if>
											
											
										</div>
									</div>
	
									<div class="kt-widget__subhead">
										<a href="#">
											<i class="flaticon2-new-email"></i> 
											email: <c:out value="${otherUser.email}">email</c:out>
										</a>
										<a href="#">
											<i class="flaticon2-new-email"></i> 
											Graduation Year: <c:out value="${otherUser.graduationYear}">year</c:out>
										</a>  
									</div>
	
									<div class="kt-widget__info">
										<div class="kt-widget__desc">
											<c:out value="${otherUser.bio}">bio</c:out>
											
											<div
												class="kt-portlet kt-portlet--bordered-semi kt-portlet--height-fluid">
												<div class="kt-portlet__head">
													<div class="kt-portlet__head-label">
														<h3 class="kt-portlet__head-title">Profile</h3>
													</div>
												</div>
												
												<div class="kt-portlet__body">
													<div class="kt-widget4">
	
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Proficiencies</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line;">
																${otherUser.proficiencies}</div>
														</div>
													</div>
												</div>
											</div>
	
										</div>
	
									</div>
								</div>
							</div>
							<div class="kt-widget__bottom">
	
								<div class="kt-widget__item">
									<div class="kt-widget__icon">
										<i class="flaticon-users"></i>
									</div>
									<div class="kt-widget__details">
										<span class="kt-widget__title">Followers</span> <span
											id="followercount" class="kt-widget__value">${followerCount}</span>
									</div>
								</div>
	
								<div class="kt-widget__item">
									<div class="kt-widget__icon">
										<i class="flaticon-chat-1"></i>
									</div>
									<div class="kt-widget__details">
										<span class="kt-widget__title">${otherUser.authorOf.size()}
											Posts</span> <a href="#"
											class="kt-widget__value kt-font-brand"
											onclick="togglePostView()" id="viewControl">View</a>
										<script type="text/javascript">
											function togglePostView() {
												var x = document
														.getElementById('postProfileDiv');
												if (x.style.display === 'none') {
													x.style.display = 'block';
													document
															.getElementById('viewControl').textContent = "Hide";
												} else {
													x.style.display = 'none';
													document
															.getElementById('viewControl').textContent = "View";
												}
											}
										</script>
									</div>
								</div>
								<!-- 
	
		<div class="kt-widget__item">
			<div class="kt-widget__icon">
				<i class="flaticon-network"></i>
			</div>
			<div class="kt-widget__details">
				<div class="kt-section__content kt-section__content--solid">
					<div class="kt-media-group">
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="John Myer">
							<img src="./assets/media/users/100_1.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Alison Brandy">
							<img src="./assets/media/users/100_10.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Selina Cranson">
							<img src="./assets/media/users/100_11.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Luke Walls">
							<img src="./assets/media/users/100_2.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<img src="./assets/media/users/100_3.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<span>+3</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		-->
	
							</div>
						</div>
					</div>
				</div>
				<!--end:: Widgets/Applications/User/Profile3-->
			</div>
		</div>
	
	</c:if>
	
	<c:if test="${otherUser.userType == MyConstants.TYPE_STUDENT }">
		<div class="row">
			<div class="col-xl-12">
				<!--begin:: Widgets/Applications/User/Profile3-->
				<div class="kt-portlet kt-portlet--height-fluid">
					<div class="kt-portlet__body">
						<div class="kt-widget kt-widget--user-profile-3">
							<div class="kt-widget__top">
								<div class="kt-widget__media kt-hidden-">
									<img src="${otherUser.profilePictureSrc}" alt="image">
	
								</div>
								<div
									class="kt-widget__pic kt-widget__pic--danger kt-font-danger kt-font-boldest kt-font-light kt-hidden">
									JM</div>
								<div class="kt-widget__content">
									<div class="kt-widget__head">
										<a href="#" class="kt-widget__username"> <c:out
												value="${otherUser.fullName}">name</c:out> <i
											class="flaticon2-correct"></i>
										</a>
										<c:if test="${currentUser.userID != otherUser.userID}">
											<button type="button" class="btn btn-label-success btn-sm btn-upper follow-btn" id="msgModalBtnOtherUser">Send Message</button>
										</c:if>
									</div>
	
									<div class="kt-widget__subhead">
										<a href="#"><i class="flaticon2-new-email"></i> <c:out
												value="${otherUser.email}">email</c:out></a> <a href="#"><i
											class="flaticon2-calendar-3"></i>Expected graduation: <c:out
												value="${otherUser.graduation}"></c:out> </a> <a
											href="https://cs.hacettepe.edu.tr/index_tr.html"><i
											class="flaticon2-placeholder"></i> Hacettepe University CS</a> <a href="#"><i class="flaticon-home"></i>GPA: <c:out
												value="${otherUser.gpa}"></c:out> </a>
	
									</div>
	
									<div class="kt-widget__info">
										<div class="kt-widget__desc">
	
											<div
												class="kt-portlet kt-portlet--bordered-semi kt-portlet--height-fluid">
												<div class="kt-portlet__head">
													<div class="kt-portlet__head-label">
														<h3 class="kt-portlet__head-title">Profile</h3>
													</div>
												</div>
												<div class="kt-portlet__body">
													<div class="kt-widget4">
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Skills</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line;">
																${otherUser.skills}</div>
														</div>
	
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Bio</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line;">
																${otherUser.bio}</div>
														</div>
	
													</div>
												</div>
											</div>
	
										</div>
	
									</div>
								</div>
							</div>
							<div class="kt-widget__bottom">
	
	
	
								<div class="kt-widget__item">
									<div class="kt-widget__icon">
										<i class="flaticon-chat-1"></i>
									</div>
									<div class="kt-widget__details">
										<%--                         <span class="kt-widget__title">${otherUser.authorOf.size()} Posts</span> --%>
	
										<a href="#" class="kt-widget__value kt-font-brand"
											onclick="togglePostView()" id="viewControl">View</a>
										<script type="text/javascript">
											function togglePostView() {
												var x = document
														.getElementById('postProfileDiv');
												if (x.style.display === 'none') {
													x.style.display = 'block';
													document
															.getElementById('viewControl').textContent = "Hide";
												} else {
													x.style.display = 'none';
													document
															.getElementById('viewControl').textContent = "View";
												}
											}
										</script>
									</div>
								</div>
								<!-- 
	
		<div class="kt-widget__item">
			<div class="kt-widget__icon">
				<i class="flaticon-network"></i>
			</div>
			<div class="kt-widget__details">
				<div class="kt-section__content kt-section__content--solid">
					<div class="kt-media-group">
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="John Myer">
							<img src="./assets/media/users/100_1.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Alison Brandy">
							<img src="./assets/media/users/100_10.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Selina Cranson">
							<img src="./assets/media/users/100_11.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Luke Walls">
							<img src="./assets/media/users/100_2.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<img src="./assets/media/users/100_3.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<span>+3</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		-->
	
							</div>
						</div>
					</div>
				</div>
				<!--end:: Widgets/Applications/User/Profile3-->
			</div>
		</div>
	</c:if>
	
	<c:if test="${otherUser.userType == MyConstants.TYPE_ADMIN }">
		<div class="row">
			<div class="col-xl-12">
				<!--begin:: Widgets/Applications/User/Profile3-->
				<div class="kt-portlet kt-portlet--height-fluid">
					<div class="kt-portlet__body">
						<div class="kt-widget kt-widget--user-profile-3">
							<div class="kt-widget__top">
								<div class="kt-widget__media kt-hidden-">
									<img src="./ProfilePictures/amdin.jpg" alt="image">
	
								</div>
								<div
									class="kt-widget__pic kt-widget__pic--danger kt-font-danger kt-font-boldest kt-font-light kt-hidden">
									JM</div>
								<div class="kt-widget__content">
									<div class="kt-widget__head">
										<a href="#" class="kt-widget__username"> <c:out
												value="${otherUser.fullName}">name</c:out> <i
											class="flaticon2-correct"></i>
										</a>
										<c:if test="${currentUser.userID != otherUser.userID}">
											<button type="button" class="btn btn-label-success btn-sm btn-upper follow-btn" id="msgModalBtnOtherUser">Send Message</button>
										</c:if>

									</div>
	
									<div class="kt-widget__subhead">
										<a href="#"><i class="flaticon2-new-email"></i> <c:out
												value="${otherUser.email}">email</c:out></a> <a
											href="https://cs.hacettepe.edu.tr/index_tr.html"><i
											class="flaticon2-placeholder"></i> Hacettepe University CS</a>
	
	
									</div>
	
									<div class="kt-widget__info">
										<div class="kt-widget__desc">
	
											<div
												class="kt-portlet kt-portlet--bordered-semi kt-portlet--height-fluid">
												<div class="kt-portlet__head">
													<div class="kt-portlet__head-label">
														<h3 class="kt-portlet__head-title">Profile</h3>
													</div>
												</div>
												<div class="kt-portlet__body">
													<div class="kt-widget4">
	
	
														<div class="kt-widget4__item">
															<div class="kt-portlet__head-label"
																style="min-width: 200px !important">
																<h4 class="kt-portlet__head-title" style="">
																	Bio</h4>
															</div>
															&nbsp
															<div class="kt-widget4__info"
																style="white-space: pre-line;">
																${otherUser.bio}</div>
														</div>
	
													</div>
												</div>
											</div>
	
										</div>
	
									</div>
								</div>
							</div>
							<div class="kt-widget__bottom">
	
	
	
								<div class="kt-widget__item">
									<div class="kt-widget__icon">
										<i class="flaticon-chat-1"></i>
									</div>
									<div class="kt-widget__details">
										<%--                         <span class="kt-widget__title">${otherUser.authorOf.size()} Posts</span> --%>
	
										<a href="#" class="kt-widget__value kt-font-brand"
											onclick="togglePostViewW()" id="viewControl">View</a>
										<script type="text/javascript">
											function togglePostViewW() {
												var x = document
														.getElementById('postProfileDiv');
												if (x.style.display === 'none') {
													x.style.display = 'block';
													document
															.getElementById('viewControl').textContent = "Hide";
												} else {
													x.style.display = 'none';
													document
															.getElementById('viewControl').textContent = "View";
												}
											}
										</script>
									</div>
								</div>
								<!-- 
	
		<div class="kt-widget__item">
			<div class="kt-widget__icon">
				<i class="flaticon-network"></i>
			</div>
			<div class="kt-widget__details">
				<div class="kt-section__content kt-section__content--solid">
					<div class="kt-media-group">
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="John Myer">
							<img src="./assets/media/users/100_1.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Alison Brandy">
							<img src="./assets/media/users/100_10.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Selina Cranson">
							<img src="./assets/media/users/100_11.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Luke Walls">
							<img src="./assets/media/users/100_2.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<img src="./assets/media/users/100_3.jpg" alt="image">
						</a>
						<a href="#" class="kt-media kt-media--sm kt-media--circle" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="Micheal York">
							<span>+3</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		-->
	
							</div>
						</div>
					</div>
				</div>
				<!--end:: Widgets/Applications/User/Profile3-->
			</div>
		</div>
	</c:if>
	
	
	<div id="postProfileDiv" style="display: none">
		<c:if test="${targetType == MyConstants.TARGET_TYPE_CREATOR}">
			<c:forEach items="${otherUser.authorOf}" var="post">
				<!--Begin::Section-->
				<div class="row">
					<div class="col-xl-12">
						<!--begin:: Portlet-->
						<div class="kt-portlet kt-portlet--height-fluid">
							<div class="kt-portlet__body kt-portlet__body--fit">
								<!--begin::Widget -->
								<div class="kt-widget kt-widget--project-1">
	
									<div class="kt-widget__head">
										<div class="kt-widget__label">
											<div class="kt-widget__media">
	
												<form action="UserController" method="POST">
													<span class="kt-media--circle"> <input
														type="image" src="${otherUser.profilePictureSrc }"
														alt="image"
														style="height: 100px; width: 100px; cursor: pointer; border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
														<input type="hidden" name="operation"
														value="${MyConstants.OPP_VIEW_PROFILE }"> <input
														type="hidden" name="userID"
														value="${otherUser.userID }">
													</span>
												</form>
	
											</div>
											<div class="kt-widget__info kt-margin-t-5">
												<a href="#" class="kt-widget__title"> ${ post.title }
	
												</a> <span class="kt-widget__desc">
													${otherUser.fullName} <br> ${post.dateFormat}
												</span>
											</div>
										</div>
	
										<!-- DELETE POST ENABLE OR DISABLE -->
										<c:if test="${currentUser.userID ==  otherUser.userID}">
											<div class="kt-portlet__head-toolbar">
												<a href="#"
													class="btn btn-clean btn-sm btn-icon btn-icon-md"
													data-toggle="dropdown"> <i
													class="flaticon-more-1"></i>
												</a>
												<div
													class="dropdown-menu dropdown-menu-fit dropdown-menu-right">
													<form action="PostController" method="POST">
														<ul class="kt-nav">
															<li class="kt-nav__item">
																<button type="submit"
																	class="kt-nav__link-icon flaticon2-trash"
																	style="color: tomato; border: none; background-color: white; font-size: 14px;">
																	<span class="kt-nav__link-text"
																		style="color: black; margin-left: 14px">Delete Post</span>
																</button> <input type="hidden" name="operation"
																value="${MyConstants.OPP_DELETE_POST }">
																<input type="hidden" name="delPost"
																value=${String.valueOf(post.postID) }>
															</li>
														</ul>
													</form>
												</div>
											</div>
										</c:if>
									</div>
	
									<div class="kt-widget__body">
										<span class="kt-widget__text"
											style="font-size: 17px; white-space: pre-line; margin-top: 0px">
											${post.messageText} </span>
									</div>
	
									<div class="kt-widget__footer">
										<div class="kt-widget__wrapper">
											<div class="kt-widget__section">
												<div class="kt-demo-icon__preview">
													<c:if
														test="${currentUser.likes.contains(post.postID)}">
	
														<button type="button"
															class="flaticon-black like-btn"
															style="border: none; background-color: white; font-size: 25px; color: red;"></button>
														<a href="#" style="font-size: 15px; color: black;">${post.likeCount} Likes</a>
														<input type="hidden" value=${post.postID }>
	
													</c:if>
	
													<c:if
														test="${currentUser.likes.contains(post.postID) == false}">
	
														<button type="button"
															class="flaticon-black like-btn"
															style="border: none; background-color: white; font-size: 25px; color: gray;"></button>
														<a href="#" style="font-size: 15px; color: black;">${post.likeCount} Likes</a>
														<input type="hidden" value=${post.postID }>
	
													</c:if>
	
												</div>
												<div class="kt-demo-icon__preview">
													<button type="button" class="flaticon2-chat-1"
														style="border: none; background-color: white; font-size: 25px;"></button>
													<a href="#" style="font-size: 15px; color: black;">
														<span class="comment-count">${post.commentCount}</span> Comments
													</a>
												</div>
											</div>
											<div class="kt-widget__section">
												<form action="PostController" method="POST">
													<button class="btn btn-outline-dark" type="submit">Details</button>
													<input type="hidden"
														value="${MyConstants.OPP_POST_DETAILS }"
														name="operation"> <input type="hidden"
														name="postID" value=${post.postID }>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!--end::Widget -->
							</div>
						</div>
						<!--end:: Portlet-->
					</div>
	
				</div>
				<!--End::Section-->
			</c:forEach>
		</c:if>
	
		<c:if test="${targetType == MyConstants.TARGET_TYPE_STUDENT}">
			<c:forEach items="${followedPosts}" var="post">
				<!--Begin::Section-->
				<div class="row">
					<div class="col-xl-12">
						<!--begin:: Portlet-->
						<div class="kt-portlet kt-portlet--height-fluid">
							<div class="kt-portlet__body kt-portlet__body--fit">
								<!--begin::Widget -->
								<div class="kt-widget kt-widget--project-1">
	
									<div class="kt-widget__head">
										<div class="kt-widget__label">
											<div class="kt-widget__media">
	
												<form action="UserController" method="POST">
													<span class="kt-media--circle"> <input
														type="image" src="" alt="image"
														style="height: 100px; width: 100px; cursor: pointer; border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
														<input type="hidden" name="operation"
														value="${MyConstants.OPP_VIEW_PROFILE }"> <input
														type="hidden" name="userID" value="${post.authorID}">
													</span>
												</form>
	
											</div>
											<div class="kt-widget__info kt-margin-t-5">
												<a href="#" class="kt-widget__title"> ${ post.title }
	
												</a> <span class="kt-widget__desc"> <br>
													${post.dateFormat}
												</span>
											</div>
										</div>
	
										<!-- DELETE POST ENABLE OR DISABLE -->
										<c:if test="${currentUser.userID ==  otherUser.userID}">
											<div class="kt-portlet__head-toolbar">
												<a href="#"
													class="btn btn-clean btn-sm btn-icon btn-icon-md"
													data-toggle="dropdown"> <i
													class="flaticon-more-1"></i>
												</a>
												<div
													class="dropdown-menu dropdown-menu-fit dropdown-menu-right">
													<form action="PostController" method="POST">
														<ul class="kt-nav">
															<li class="kt-nav__item">
																<button type="submit"
																	class="kt-nav__link-icon flaticon2-trash"
																	style="color: tomato; border: none; background-color: white; font-size: 14px;">
																	<span class="kt-nav__link-text"
																		style="color: black; margin-left: 14px">Delete Post</span>
																</button> <input type="hidden" name="operation"
																value="${MyConstants.OPP_DELETE_POST }">
																<input type="hidden" name="delPost"
																value=${String.valueOf(post.postID) }>
															</li>
														</ul>
													</form>
												</div>
											</div>
										</c:if>
									</div>
	
									<div class="kt-widget__body">
										<span class="kt-widget__text"
											style="font-size: 17px; white-space: pre-line; margin-top: 0px">
											${post.messageText} </span>
									</div>
	
									<div class="kt-widget__footer">
										<div class="kt-widget__wrapper">
											<div class="kt-widget__section">
												<div class="kt-demo-icon__preview">
													<c:if
														test="${currentUser.likes.contains(post.postID)}">
	
														<button type="button"
															class="flaticon-black like-btn"
															style="border: none; background-color: white; font-size: 25px; color: red;"></button>
														<a href="#" style="font-size: 15px; color: black;">${post.likeCount} Likes</a>
														<input type="hidden" value=${post.postID }>
	
													</c:if>
	
													<c:if
														test="${currentUser.likes.contains(post.postID) == false}">
	
														<button type="button"
															class="flaticon-black like-btn"
															style="border: none; background-color: white; font-size: 25px; color: gray;"></button>
														<a href="#" style="font-size: 15px; color: black;">${post.likeCount} Likes</a>
														<input type="hidden" value=${post.postID }>
	
													</c:if>
	
												</div>
												<div class="kt-demo-icon__preview">
													<button type="button" class="flaticon2-chat-1"
														style="border: none; background-color: white; font-size: 25px;"></button>
													<a href="#" style="font-size: 15px; color: black;">
														<span class="comment-count">${post.commentCount}</span> Comments
													</a>
												</div>
											</div>
											<div class="kt-widget__section">
												<form action="PostController" method="POST">
													<button class="btn btn-outline-dark" type="submit">Details</button>
													<input type="hidden"
														value="${MyConstants.OPP_POST_DETAILS }"
														name="operation"> <input type="hidden"
														name="postID" value=${post.postID }>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!--end::Widget -->
							</div>
						</div>
						<!--end:: Portlet-->
					</div>
	
				</div>
				<!--End::Section-->
	
			</c:forEach>
	
		</c:if>
	
		<form id="likeForm">
			<input type="hidden" name="operation"
				value="${MyConstants.OPP_LIKE_POST }"> <input
				type="hidden" id="likedPost" name="likedPost" value="">
			<input type="hidden" name="pageCode"
				value="${MyConstants.CODE_PROFILEPAGE }">
		</form>
		<form id="dislikeForm">
			<input type="hidden" name="operation"
				value="${MyConstants.OPP_DISLIKE_POST }"> <input
				type="hidden" id="dislikedPost" name="dislikedPost" value="">
			<input type="hidden" name="pageCode"
				value="${MyConstants.CODE_PROFILEPAGE }">
		</form>
	</div>
	
	<!-- begin:: Footer -->
	<div class="kt-footer kt-grid__item" id="kt_footer">
		<div class="kt-container ">
			<div class="kt-footer__wrapper">
				<div class="kt-footer__copyright">
	
					2022&nbsp;&copy;&nbsp;<a href="#" target="_blank"
						class="kt-link">HelloWorld Inc.</a>
				</div>
				<div class="kt-footer__menu">
					<a href="#" target="_blank" class="kt-link">About</a> <a
						href="#" target="_blank" class="kt-link">Team</a> <a
						href="#" target="_blank" class="kt-link">Contact</a>
	
				</div>
			</div>
		</div>
	</div>
	<!-- end:: Footer -->

</div>
<!-- end:: content of the page -->

				<!-- end of rows -->
					</div>
				</div>
			</div>
			

<!-- begin:: of messeage pop up -->			
<div class="modal modal-sticky-bottom-right modal-sticky-lg show" id="kt_inbox_compose" role="dialog" data-backdrop="false" aria-modal="true" style="padding-right: 17px; display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content kt-inbox">
			<div class="kt-inbox__form" id="kt_inbox_compose_form">
				<div class="kt-inbox__head">
					<div class="kt-inbox__title">New Message</div>
					<div class="kt-inbox__actions">
						<button type="button" class="kt-inbox__icon kt-inbox__icon--md kt-inbox__icon--light" id="msgModelCloseBtn">
							<i class="flaticon2-cross"></i>
						</button>
					</div>
				</div>
				<form id="msgInfoFormProfile">
					<div class="kt-inbox__body">
						<div class="kt-inbox__to">
							<div class="kt-inbox__wrapper">
								<div class="kt-inbox__field kt-inbox__field--to">
									<div class="kt-inbox__label">
										To:
									</div>
									<input class = "form-control" type="text" name="receiverName" value="${otherUser.fullName}" style="border: 1px solid #F0F8FF; border-radius: 5px; background-color:#F0F8FF;width:300px;height:30px">
									<input type="hidden" name="receiverID" value="${otherUser.userID}">
								</div>
							</div>
						</div>
	
						<div class="kt-inbox__subject" style="border-bottom:1px inset">
							<input id="msgsbjct" class="form-control msgSubjectArea" name="messageSubject" placeholder="Subject" ><hr>
						
						</div>
						
						<textarea name="messageText" class="form-control msgTextArea" placeholder="Type your message here" style="height: 300px;width:%100;border:none"></textarea>
						<input type="hidden" name="operation" value="${MyConstants.OPP_SEND_MESSAGE}">
	
						<div class="kt-inbox__attachments">
							<div class="dropzone dropzone-multi" id="kt_inbox_compose_attachments">
								<div class="dropzone-items">
									
								</div>
							<div class="dz-default dz-message"><span>Drop files here to upload</span></div></div>
						</div>
					</div>
				</form>
			
				<div class="kt-inbox__foot">
					<div class="kt-inbox__primary">
						<div class="btn-group">
							<button type="button" class="btn btn-brand btn-bold msg-PushButton">
								Send
							</button>
							<input type="hidden" value="msgInfoFormProfile">
							<div class="dropdown-menu dropup dropdown-menu-fit dropdown-menu-right">
								<ul class="kt-nav">
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-writing"></i>
											<span class="kt-nav__link-text">Schedule Send</span>
										</a>
									</li>
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-medical-records"></i>
											<span class="kt-nav__link-text">Save &amp; archive</span>
										</a>
									</li>
									<li class="kt-nav__item">
										<a href="#" class="kt-nav__link">
											<i class="kt-nav__link-icon flaticon2-hourglass-1"></i>
											<span class="kt-nav__link-text">Cancel</span>
										</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="kt-inbox__panel">
							<label class="kt-inbox__icon kt-inbox__icon--light dz-clickable" id="kt_inbox_compose_attachments_select">
								<i class="flaticon2-clip-symbol"></i>
							</label>
						</div>
					</div>

					<div class="kt-inbox__secondary">
						<button class="kt-inbox__icon kt-inbox__icon--remove kt-inbox__icon--light" data-toggle="kt-tooltip" title="" data-original-title="Dismiss reply">
							<i class="flaticon2-rubbish-bin-delete-button"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Form to send message -->

<form id="msgSendForm">
	<input type="hidden" name="operation" value="${MyConstants.OPP_SEND_MESSAGE}">
	<input type="hidden" name="receiverID" value="${otherUser.userID}">
	<input type="hidden" id="msgSubject" name="subject" value="">
	<input type="hidden" id="msgText" name="messageText" value="">
</form>

<!-- end:: of messeage pop up -->			
				

			<!-- end:: Content -->
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
<script src="./js/follow.js" type="text/javascript"></script>
<script src="./js/Message.js" type="text/javascript"></script>
<script src="./js/pageRefreshForSession.js" type="text/javascript"></script>

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
<script src="./assets/vendors/general/jquery.repeater/src/lib.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery.repeater/src/jquery.input.js" type="text/javascript"></script>
<script src="./assets/vendors/general/jquery.repeater/src/repeater.js" type="text/javascript"></script>
<script src="./assets/vendors/general/dompurify/dist/purify.js" type="text/javascript"></script>
<!--end:: Global Optional Vendors -->

<!--begin::Global Theme Bundle(used by all pages) -->
    	    	   
		    	   <script src="./assets/js/demo9/scripts.bundle.js" type="text/javascript"></script>
				<!--end::Global Theme Bundle -->
				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				
				<script type="text/javascript">
					function messageSentSucces()
					{
						swal({
							  title: "Success!",
							  text: "Your message has been sent successfully !",
							  icon: "success",
							  button: "Ok",
							});
					}
				</script>
				
            </body>
    <!-- end::Body -->
</html>
    