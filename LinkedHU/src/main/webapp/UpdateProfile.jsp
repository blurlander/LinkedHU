<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="general.MyConstants" %>    

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>

<html lang="en" >
    <!-- begin::Head -->
    <head><!--begin::Base Path (base relative path for assets of this page) -->
        <meta charset="utf-8"/>

        <title>Update Profile</title>
        <meta name="description" content="List columns 1 example">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


		<!--begin::Fonts -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">       
		 <!--end::Fonts -->
		         
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
				<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper" style="padding: 0px !important">
					<div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body">
						<div class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content">


<div class="kt-container  kt-grid__item kt-grid__item--fluid" style="padding-top: 30px;">
	
	<!-- begin:: profile update -->
	<div class="row">
   	<div class="col-lg-12">	
		<!--begin::Portlet-->
		<div class="kt-portlet kt-portlet--last kt-portlet--head-lg kt-portlet--responsive-mobile" id="kt_page_portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h3 class="kt-portlet__head-title">Update Account</h3>
				</div>
				<div class="kt-portlet__head-toolbar">
					<a href="Profile.jsp" class="btn btn-clean kt-margin-r-10">
						<i class="la la-arrow-left"></i>
						<span href="Profile.jsp" class="kt-hidden-mobile">Back</span>
					</a>
					<div class="btn-group">
						
						<button type="submit" form = "blablabla" class="btn btn-brand">
							<i class="la la-check"></i> 
							<span class="kt-hidden-mobile">Save</span>
														
						</button>
						
						
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
			
									<c:if test="${userexists == MyConstants.USERNAME_EXISTS}">
                                    	<div class="alert alert-outline-warning fade show" role="alert">
			                            <div class="alert-icon"><i class="flaticon-warning"></i></div>
			                            <div class="alert-text">This username is already used.</div>
			                            <div class="alert-close">
			                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			                                    <span aria-hidden="true"><i class="la la-close"></i></span>
			                                </button>
			                            </div>
                        				</div>
                                    </c:if> 
                                    <c:if test="${userexists == MyConstants.EMAIL_EXISTS}">
                                    	<div class="alert alert-outline-warning fade show" role="alert">
			                            <div class="alert-icon"><i class="flaticon-warning"></i></div>
			                            <div class="alert-text">This email is already used.</div>
			                            <div class="alert-close">
			                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			                                    <span aria-hidden="true"><i class="la la-close"></i></span>
			                                </button>
			                            </div>
                        				</div>
                                    </c:if> 
			
			
				<form class="kt-form" action = "UserController" method = "POST" id= "blablabla" enctype="multipart/form-data">
				
					<div class="row">
						<div class="col-xl-2"></div>
						<div class="col-xl-8">
							<div class="kt-section kt-section--first">
								<div class="kt-section__body">
									<h3 class="kt-section__title kt-section__title-lg">Profile:</h3>
									
									<div class="form-group row">
                                        <label class="col-xl-3 col-lg-3 col-form-label">Avatar</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <div class="kt-avatar kt-avatar--outline" id="kt_user_avatar">
                                            	
                                            	
                                                	<img class="kt-avatar__holder" src="${otherUser.profilePictureSrc}">
                                            	
                                            	
                                                <label class="kt-avatar__upload" data-toggle="kt-tooltip" title="" data-original-title="Change avatar">
                                                    <i class="fa fa-pen"></i>
                                                    <input type="file" name="profilePicture" accept=".png, .jpg, .jpeg">
                                                </label>
                                                <span class="kt-avatar__cancel" data-toggle="kt-tooltip" title="" data-original-title="Cancel avatar">
                                                    <i class="fa fa-times"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    

                                    <c:set var="dateParts" value="${fn:split(otherUser.fullName, ' ')}" />
									<div class="form-group row">
										<label class="col-3 col-form-label">First Name</label>
										<div class="col-9">
											<input required class="form-control " name ="firstName" type="text" value="${dateParts[0]}">

										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label">Last Name</label>
										<div class="col-9">

											<input required class="form-control" name ="lastName" type="text" value="${dateParts[1] } ">

										</div>
									</div>
									
									<c:if test="${otherUser.userType == MyConstants.TYPE_ACADEMICIAN}"> 
									<!-- Graduate icin ayrı yapılacak  -->
									
									<div class="form-group row">
										<label class="col-3 col-form-label">Academic Title</label>
										<div class="col-9">

											<input required class="form-control" name ="acadTitle" type="text" value="${otherUser.academicTitle}">

										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-3 col-form-label">Office Number </label>
										<div class="col-9">

											<input required class="form-control" name ="officeNumber" type="text" value="${otherUser.officeNumber }">

										</div>
									</div>

									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Professional History</label>
										<div class="col-9">
											<div class="input-group">

												<textarea required class="form-control" name="professionalHistory" rows="5" cols="100" >${otherUser.professionalHistory }</textarea>

											</div>
										</div>
									</div>
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Research History</label>
										<div class="col-9">
											<div class="input-group">

												<textarea required class="form-control" name="researchHistory" rows="5" cols="100" >${otherUser.researchHistory }</textarea>

											</div>
										</div>
									</div>
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Proficiencies</label>
										<div class="col-9">
											<div class="input-group">

												<textarea required class="form-control" name="proficiencies" rows="5" cols="100">${otherUser.proficiencies }</textarea>

											</div>
										</div>
									</div>
									</c:if>
									
									<c:if test = "${otherUser.userType == MyConstants.TYPE_STUDENT}">
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Skills</label>
										<div class="col-9">
											<div class="input-group">

												<textarea required class="form-control" name="skills" rows="5" cols="100">${otherUser.skills}</textarea>

											</div>
										</div>
									</div>
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">GPA</label>
										<div class="col-9">
											<div class="input-group">

												<input required class="form-control" name ="gpa" type="text" value="${otherUser.gpa }">	

											</div>
										</div>
									</div>
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Graduation</label>
										<div class="col-9">
											<div class="input-group">
												
												<input required class="form-control" name ="graduation" type="text" value="${otherUser.graduation }">

											</div>
										</div>
									</div>
									</c:if>
									
									<c:if test = "${otherUser.userType == MyConstants.TYPE_GRADUATE}">
									
									
									
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Graduation</label>
										<div class="col-9">
											<div class="input-group">
												
												<input required class="form-control" name ="graduation" type="text" value="${otherUser.graduationYear }">

											</div>
										</div>
									</div>
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label">Proficiencies</label>
										<div class="col-9">
											<div class="input-group">

												<textarea required class="form-control" name="proficiencies" rows="5" cols="100">${otherUser.proficiencies }</textarea>

											</div>
										</div>
									</div>
									
									
									</c:if>
									
									
									
									
									<div class="form-group form-group-last row" style="margin-bottom:20px">
										<label class="col-3 col-form-label"> Bio</label>
										<div class="col-9">
											<div class="input-group">

												<textarea required name="bio" class="form-control" rows="5" cols="100">${otherUser.bio }</textarea>

											</div>
										</div>
									</div>
									
								</div>
							</div>
					
							<div class="kt-separator kt-separator--border-dashed kt-separator--space-lg"></div>
							<div class="kt-section">
								<div class="kt-section__body">
									<h3 class="kt-section__title kt-section__title-lg">Account:</h3>
									<div class="form-group row">
										<label class="col-3 col-form-label">Username</label>
										<div class="col-9">

												<input required class="form-control" name ="userName" type="text" value="${otherUser.username }">				

										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label">Password</label>
										<div class="col-9">

												<input required class="form-control" name ="password" type="password" pattern=".{8,}"   required title="8 characters minimum" value="${otherUser.password }">				

										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label">Email Address</label>
										<div class="col-9">
											<div class="input-group">
												<div class="input-group-prepend"><span class="input-group-text"><i class="la la-at"></i></span></div>

												<input required type="email" class="form-control" name ="email" value="${otherUser.email }" placeholder="Email" aria-describedby="basic-addon1">

												
												<c:if test = "${status != MyConstants.CONTINUE_REGISTER}">
												<input type = "hidden" value = "${MyConstants.OPP_UPDATE_PROFILE }" name = "operation">
												</c:if>
												
												<c:if test="${status == MyConstants.CONTINUE_REGISTER}"> 
												<!-- Checking if we are here after register -->
												<input type = "hidden" value = "${MyConstants.OPP_FINISH_REGISTER }" name = "operation">
												</c:if>
												
											</div>
											<span class="form-text text-muted">Email will not be publicly displayed. <a href="#" class="kt-link">Learn more</a>.</span>
										</div>
									</div>																					
								</div>
							</div>
							<div class="kt-separator kt-separator--border-dashed kt-separator--space-lg"></div>
						</div>
						<div class="col-xl-2"></div>
					</div>
				</form>
				
			</div>
		</div>	
		<!--end::Portlet-->
	</div>
</div>	
	<!--  end:: profile update-->
	
	<!-- begin:: Footer -->
	<div class="kt-footer kt-grid__item" id="kt_footer">
		<div class="kt-container ">
			<div class="kt-footer__wrapper">
				<div class="kt-footer__copyright">
	
					2022&nbsp;&copy;&nbsp;<a href="#" target="_blank" class="kt-link">HelloWorld Inc.</a>
				</div>
				<div class="kt-footer__menu">
					<a href="#" target="_blank" class="kt-link">About</a>
					<a href="#" target="_blank" class="kt-link">Team</a>
					<a href="#" target="_blank" class="kt-link">Contact</a>
	
				</div>
			</div>
		</div>
	</div>
	<!-- end:: Footer -->

</div>	
	
	
										
						</div>
					</div>
				</div>
				<!-- end:: 3 wrapper classes for content-->
				
			</div>
		</div><!-- root end -->
<!-- end:: Page -->
<% session.removeAttribute("userexists"); %>

    

 <!-- begin::Global Config(global config for global JS sciprts) -->
 <script>
     var KTAppOptions = {"colors":{"state":{"brand":"#591df1","light":"#ffffff","dark":"#282a3c","primary":"#5867dd","success":"#34bfa3","info":"#36a3f7","warning":"#ffb822","danger":"#fd3995"},"base":{"label":["#c5cbe3","#a1a8c3","#3d4465","#3e4466"],"shape":["#f0f3ff","#d9dffa","#afb4d4","#646c9a"]}}};
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

        
            </body>
    <!-- end::Body -->
</html>
    