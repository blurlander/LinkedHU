<%@page import="java.io.PrintWriter"%>
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

        <title>Home Page</title>
        <meta name="description" content="List columns 1 example">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


		<!--begin::Fonts -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">       
		 <!--end::Fonts -->
		         
		<!--begin:: Global Mandatory Vendors -->
		<link href="./assets/vendors/general/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
		<!--end:: Global Mandatory Vendors -->
		<link href="./assets/css/demo9/pages/inbox/inbox.css" rel="stylesheet"
	type="text/css" />
	
	<link href="./assets/vendors/custom/uppy/uppy.bundle.css"
	rel="stylesheet" type="text/css" />
		
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
								 
									<c:if test="${currentUser.userType == MyConstants.TYPE_ADMIN}">
									<img id="sb_profile_picture" alt="Pic" src="./ProfilePictures/amdin.jpg" />
									</c:if>
								 	
								 	
								 	<c:if test="${currentUser.userType != MyConstants.TYPE_ADMIN}">
									<img id="sb_profile_picture" alt="Pic" src="${currentUser.profilePictureSrc }" />
									</c:if>
									
									<div class="sb_fullname ">
										<c:out value="${currentUser.username }"></c:out>
									</div>
										
							        <form action="UserController" method="POST" style="display: none">
								        <button type="submit" class="btn btn-label btn-label-brand btn-sm btn-bold" >Sign Out</button>
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
							<c:if test ="${currentUser.userType != MyConstants.TYPE_ADMIN }">
							<li>
								<a href="#" onclick = "window.location = 'UpdateProfile.jsp'">
									<i class="fa fa-user-edit"></i>
									<span class="links_name">Update Profile</span>
								</a>
							</li>
							</c:if>
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
							<c:if test ="${currentUser.userType != MyConstants.TYPE_ADMIN }">
							<li>
								<a href="#" onclick = "window.location = 'UpdateProfile.jsp'">
									<i class="fa fa-key"></i>
									<span class="links_name">Change Password</span>
								</a>
							</li>
							</c:if>
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

<!-- begin:: Content Head (search post, create post)-->
<div class="kt-subheader " id="kt_subheader">
	<div class="kt-container ">
		
		<!-- sub-header main -->
		<div class="kt-subheader__main">
		
			<h3 class="kt-subheader__title">Post</h3>
			<span class="kt-subheader__separator kt-subheader__separator--v"></span>
			
            <div class="kt-subheader__group" id="kt_subheader_search">
            	
                <span class="kt-subheader__desc" id="kt_subheader_total"><c:out value="${map.size()} "/> Total</span>
                
                <!-- search form -->
				<form class="kt-margin-l-20" id="kt_subheader_search_form">
                       <div class="kt-input-icon kt-input-icon--right kt-subheader__search">
						<input type="text" class="form-control" placeholder="Search..." id="generalSearch">
						<span class="kt-input-icon__icon kt-input-icon__icon--right">
							<span><i class="flaticon2-search-1"></i></span>
						</span>
					</div>
				</form>
				<!-- search form end-->
				
			</div>
			
		</div>
		<!-- sub-header main end-->
		
		<c:if test="${currentUser.userType != MyConstants.TYPE_STUDENT }">
			<!-- begin:: right buttons (create post and plus sign)-->
			<div class="kt-subheader__toolbar">
	           <div class="kt-subheader__wrapper">
	           
				    <div class="kt-grid__item   kt-portlet  kt-inbox__aside" id="kt_inbox_aside">
				        <button type="button" class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#kt_inbox_compose">Create Post</button>
				    </div>
   					 <!--End:: create Message button-->
					<!--Begin:: Inbox Compose-->
					<div class="modal modal-sticky-bottom-right modal-sticky-lg" id="kt_inbox_compose" role="dialog" data-backdrop="false"
						style="">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content kt-inbox">
					            <div class="kt-inbox__form" id="kt_inbox_compose_form">
					                <div class="kt-inbox__head">
					                    <div class="kt-inbox__title">Write a Post</div>
					                    <div class="kt-inbox__actions">
					                        <button type="button" class="kt-inbox__icon kt-inbox__icon--md kt-inbox__icon--light" data-dismiss="modal">
					                            <i class="flaticon2-cross"></i>
					                        </button>
					                    </div>
					                </div>
					               
					                <form method="POST" action="PostController" id = "create-post-form">
						                <input type="hidden" id = "5" name = "operation" value="${MyConstants.OPP_CREATE_POST }">
						                <input id="input-id-post-text" type="hidden" class="form-control" name="text" value="hello">
						                <input id="postType" type ="hidden" name= "type"  value ="Normal">
						                <input id="input-id-fileList" type ="hidden" name= "uploadedFiles"  value ="">
						                
								                
						                <div class="kt-inbox__body">
						  					
						                    <div class="kt-inbox__subject">
						                        <input class="form-control" name="title" placeholder="Title"></input>
						                    </div>
						
						                    <div class="kt-inbox__editor" id="kt_inbox_compose_editor" style="height: 300px">
						                    </div>
						
						                    <div class="kt-inbox__attachments">
						                        <div class="dropzone dropzone-multi" id="kt_inbox_compose_attachments">
						                            <div class="dropzone-items">
						                                <div class="dropzone-item" style="display:none">
						                                    <div class="dropzone-file">
						                                        <div class="dropzone-filename" title="some_image_file_name.jpg">
						                                            <span data-dz-name>some_image_file_name.jpg</span> <strong>(<span  data-dz-size>340kb</span>)</strong>
						                                        </div>
						                                        <div class="dropzone-error" data-dz-errormessage></div>
						                                    </div>
						                                    <div class="dropzone-progress">
						                                        <div class="progress">
						                                            <div class="progress-bar kt-bg-brand" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" data-dz-uploadprogress></div>
						                                        </div>
						                                    </div>
						                                    <div class="dropzone-toolbar">
						                                        <span class="dropzone-delete" data-dz-remove><i class="flaticon2-cross"></i></span>
						                                    </div>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						                
						                <div class="kt-inbox__foot">
					                    <div class="kt-inbox__primary">
					                        <div class="btn-group">
					                            <button type="submit" class="btn btn-brand btn-bold " id="button-id-send-post">
					                                Send As
					                            </button>
					
					                            <button type="button" class="btn btn-brand btn-bold dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					                            </button>
					
					                            <div class="dropdown-menu dropup dropdown-menu-fit dropdown-menu-right">
					                            	
					                                <ul class="kt-nav">
					                                    <li class="kt-nav__item sendPost-li" data-li="intern">
					                                        <a href="#" class="kt-nav__link button-id-send-post" >					                                        	<i class="kt-nav__link-icon flaticon2-writing"></i>
					                                            <span class="kt-nav__link-text">Internship</span>
					                                        </a>
					                                    </li>
					                                    <li class="kt-nav__item sendPost-li" data-li="job">
					                                        <a href="#" class="kt-nav__link button-id-send-post">
					                                        <i class="kt-nav__link-icon flaticon2-medical-records"></i>
					                                            <span class="kt-nav__link-text">Job opportunity</span>
					                                        </a>
					                                    </li>
					                                    <li class="kt-nav__item sendPost-li" data-li="scholar">
					                                        <a href="#" class="kt-nav__link button-id-send-post">
					                                        <i class="kt-nav__link-icon flaticon2-hourglass-1"></i>
					                                            <span class="kt-nav__link-text">Scholarship</span>
					                                        </a>
					                                    </li>
					                                    <li class="kt-nav__item sendPost-li" data-li="standart">
					                                        <a href="#" class="kt-nav__link button-id-send-post">
					                                        <i class="kt-nav__link-icon flaticon2-hourglass-1"></i>
					                                            <span class="kt-nav__link-text">Standart</span>
					                                        </a>
					                                    </li>
					                                </ul>
					                            </div>
					                        </div>
					
											<div class="kt-uppy" id="kt_uppy_5">
												<div class="kt-uppy__wrapper"></div>
												<div class="kt-uppy__list"></div>
												<div class="kt-uppy__status"></div>
				                                <div class="kt-uppy__informer kt-uppy__informer--min"></div>
											</div>
					
					                        <div class="kt-inbox__panel" style="display: none;">
					                            <label class="kt-inbox__icon kt-inbox__icon--light" id="kt_inbox_compose_attachments_select">
					                                <i class="flaticon2-clip-symbol"></i>
					                            </label>
					                        </div>
					                        
					                        <div class="kt-uppy" id="kt_uppy_6" style="display: none;">

												<button
													class="kt-uppy__btn btn btn-label-success btn-bold btn-sm">
													<i class="fa fa-upload" style="margin-right: 10px"></i>Choose
													Files
												</button>

												<div class="kt-uppy__dashboard"></div>
												<div class="kt-uppy__progress"></div>
											</div>
					                    </div>
					
					                </div>
					            	</form>
					            </div>
					        </div>
					    </div>
					</div>
					<!--End:: Inbox Compose-->
				
	            </div>
	        </div>
			<!-- end:: right buttons (create post and plus sign)-->
		</c:if>
                         
    </div><!-- container div -->
</div>
<!-- end:: Content Head (search post, create post)-->

<!-- begin:: Content (posts, footer)-->
<div id = "1234567" class="kt-container  kt-grid__item kt-grid__item--fluid" >
	
	<!-- begin:: all posts -->	
	<c:forEach items="${map.entrySet()}" var="entry">
		<div class="row postRow" id =${ String.valueOf(entry.getKey().postID)} >
			
			<c:if test="${String.valueOf(entry.getKey().postType) == \"post-intern\" }">
				<c:set var="bgcolor_post" value="${\"#e6ffe6\"}" scope="request"/>			
			</c:if>
			<c:if test="${String.valueOf(entry.getKey().postType) == \"post-job\" }">
				<c:set var="bgcolor_post" value="${\"#ffffe6\"}" scope="request"/>			
			</c:if>
			<c:if test="${String.valueOf(entry.getKey().postType) == \"post-scholar\" }">
				<c:set var="bgcolor_post" value="${\"#e6ffff\"}" scope="request"/>			
			</c:if>
			<c:if test="${String.valueOf(entry.getKey().postType) == \"Normal\" }">
				<c:set var="bgcolor_post" value="${\"#ffffff\"}" scope="request"/>			
			</c:if>
			
		
		    <div class="col-xl-12">
		        <!--begin:: single post (3 wrapper class)-->
		        <div class="kt-portlet kt-portlet--height-fluid">
		            <div class="kt-portlet__body kt-portlet__body--fit" style="background-color:${bgcolor_post};">
		                <div class="kt-widget kt-widget--project-1">
		                	
		                	<!-- post head -->
		                    <div class="kt-widget__head">
		                        <div class="kt-widget__label">
		                            <div class="kt-widget__media">
		                            	
		                            	<form action="UserController" method="POST">
		                                <span>   
		                                    <c:if test = "${entry.getValue().userType == MyConstants.TYPE_ADMIN}">                           
		                                    <input type="image" src="./ProfilePictures/amdin.jpg" alt="image" style="height:100px;width:100px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    </c:if>
		                                    
		                                    <c:if test = "${entry.getValue().userType != MyConstants.TYPE_ADMIN}">                           
		                                    <input type="image" src="${entry.getValue().profilePictureSrc}" alt="image" style="height:100px;width:100px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    </c:if>
		                                    
		                                    
		                                    
		                                    <input type="hidden" name="operation" value="${MyConstants.OPP_VIEW_PROFILE }">
		                                    <input type="hidden" name="userID" value="${entry.getValue().userID }">                                	
		                                </span>
		                            	</form>
		                            	
		                            </div>
		                            <div class="kt-widget__info kt-margin-t-5">
		                                <a href="#" class="kt-widget__title" id="${ entry.getKey().postID}title">
		                                ${ entry.getKey().title }
		                                                                        
		                                </a>
		                                
		                                <span class="kt-widget__desc" id="${ entry.getKey().postID}author">
		                                ${entry.getValue().fullName}
		                                		                                
		                                </span>
		                                ${ entry.getKey().createdAt}
		                                
		                            </div>
		                        </div>
		                        
		                        <!-- DELETE POST ENABLE OR DISABLE -->
		                        <c:if test="${currentUser.userID  ==  entry.getValue().userID || currentUser.userType == MyConstants.TYPE_ADMIN }">
		                        <div class="kt-portlet__head-toolbar">
		                            <a href="#" class="btn btn-clean btn-sm btn-icon btn-icon-md" data-toggle="dropdown">
		                                <i class="flaticon-more-1"></i>
		                            </a>
		                            <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right">
		                                <form action = "PostController" method = "POST">
		                                <ul class="kt-nav">
		                                    <li class="kt-nav__item">
		                                        <button type = "submit" class="kt-nav__link-icon flaticon2-trash" style = "color:  tomato ;border: none; background-color: white; font-size: 14px; ">
		                                            <span class="kt-nav__link-text" style = "color: black; margin-left: 14px">Delete Post</span>
		                                        </button>
		                                        <input type = "hidden" name = "operation" value = "${MyConstants.OPP_DELETE_POST }" >
		                                        <input type = "hidden" name = "delPost" value = ${ String.valueOf(entry.getKey().postID)}>
		                                        
		                                    </li>
		                                </ul>
		                                </form>
		                            </div>
		                        </div>
		                        </c:if>
		                        
		                    </div>
							<!-- post head end-->
							
							<!-- post body -->
		                    <div class="kt-widget__body">
		                    	<span class="kt-widget__text" style="font-size: 17px; white-space: pre-line;margin-top:0px" id="${ entry.getKey().postID}messageText">
		                    		${entry.getKey().messageText}
		                    		
		                    		
		                    	</span>	
		                    </div>
		                    <!-- post body end -->
		                    
		                    <div class="kt-widget__body">
			                    <c:forEach items="${entry.getKey().uploadedFiles }" var="file">
									<div class="kt-uppy__list-item" style="display: flex;margin-bottom: 5px" >
										
										<c:choose>
											<c:when test="${file.extension == 'pdf'}">
												<i class="fa fa-file-pdf"></i>
											</c:when>
											
											<c:when test="${file.extension == 'jpg' || 
												file.extension == 'jpeg' || 
												file.extension == 'png' || 
												file.extension == 'img' }">
												<i class="fa fa-file-image"></i>
											</c:when>
											
											<c:when test="${file.extension == 'docx'}">
												<i class="fa fa-file-word"></i>
											</c:when>
											
											<c:when test="${file.extension == 'csv'}">
												<i class="fa fa-file-csv"></i>
											</c:when>
											
											<c:when test="${file.extension == 'xlsx'}">
												<i class="fa fa-file-excel"></i>
											</c:when>
											
											<c:when test="${file.extension == 'txt'}">
												<i class="fa fa-file-alt"></i>
											</c:when>
											
											<c:otherwise>
												<i class="fa fa-file"></i>
									        </c:otherwise>
											
										</c:choose>
										
										<a href="${file.uploadUrl }" class="kt-uppy__list-label" style="margin-left: 5px" >
											<c:out value="${file.name }"></c:out>
										</a>
									</div>
								</c:forEach>
		                    </div>
		                    
		                    
		                    <!-- post footer -->
		                    <div class="kt-widget__footer">
		                        <div class="kt-widget__wrapper">
		                           	<div class="kt-widget__section">
		                           		<div class="kt-demo-icon__preview">
		                           			 <c:if test="${currentUser.likes.contains(entry.getKey().postID)}">
		                           		
		                          				<button type="button" class="flaticon-black like-btn" style="border: none; background-color: white; font-size: 25px; color: red;" ></button>
		                                    	<a href="#" style="font-size: 15px; color: black;">${entry.getKey().likeCount} Likes</a>
		                                    	<input type="hidden" value=${entry.getKey().postID }>
		                           			
		                           			</c:if>
		                           			
		                           			<c:if test="${currentUser.likes.contains(entry.getKey().postID) == false}">
		                           			
		                          				<button type="button" class="flaticon-black like-btn" style="border: none; background-color: white; font-size: 25px; color: gray;" ></button>
		                                    	<a href="#" style="font-size: 15px; color: black;">${entry.getKey().likeCount} Likes</a>
		                           				<input type="hidden" value=${entry.getKey().postID }>
		                           			
		                           			</c:if>
		                           			
		                           		</div>
		                           		<div class="kt-demo-icon__preview">
		                           			<button type="button" class="flaticon2-chat-1" style="border: none; background-color: white; font-size: 25px;"></button>
		                           			<a href="#" style="font-size: 15px; color: black;"> <span class="comment-count">${entry.getKey().commentCount}</span> Comments</a>
		                           		</div>
		                           	</div>
		                           	<div class="kt-widget__section" style="display: flex">
		                           	
		                           		<c:if test="${String.valueOf(entry.getKey().postType) != \"Normal\" && 
		                           			(currentUser.userType == MyConstants.TYPE_STUDENT ||  currentUser.userType == MyConstants.TYPE_GRADUATE  ) }">
			                           		
			                           		
			                           		<label for="myfile" style="margin-bottom: 0px !important; margin-right: 5px"><span class="btn btn-outline-dark" >Apply</span> </label>
											<input type="file" id="myfile" name="myfile" style="display: none;" onchange="successApply()" >
											
		                           		</c:if>
		                           		
		                           		<form action="PostController" method="POST">
			                           		<button class="btn btn-outline-dark" type="submit">Details</button>
			                           		<input type="hidden" value="${MyConstants.OPP_POST_DETAILS }" name="operation" > 
				               				<input type="hidden" name="postID" value=${entry.getKey().postID }>  
		                           		</form>
		                           		
		                           		
		                           	</div>
		                        </div>
		                    </div>
		                    <!-- post footer end-->
		                    
		                </div>
		            </div>
		        </div>
		        <!--end:: single post (3 wrapper class)-->
		    </div>
		</div>
	</c:forEach>
	<!-- end:: all posts -->
	
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

	<form id="likeForm">
		<input type = "hidden" name = "operation" value = "${MyConstants.OPP_LIKE_POST }" >
		<input type = "hidden" id = "likedPost" name = "likedPost" value = "">
		<input type = "hidden" name = "pageCode" value = "${MyConstants.CODE_HOMEPAGE}">
	</form>
	<form id="dislikeForm">
		<input type = "hidden" name = "operation" value = "${MyConstants.OPP_DISLIKE_POST }" >
		<input type = "hidden" id = "dislikedPost" name = "dislikedPost" value = "">
		<input type = "hidden" name = "pageCode" value = "${MyConstants.CODE_HOMEPAGE}">
	</form>

</div>	
<!-- end:: Content -->	
			
						</div>
					</div>
				</div>
				<!-- end:: 3 wrapper classes for content-->
				
			</div>
		</div><!-- root end -->
<!-- end:: Page -->

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
<script src="./js/postSearch.js" type="text/javascript"></script>
<script src="./js/pageRefreshForSession.js" type="text/javascript"></script>
<script src="./js/sendPost.js" type="text/javascript"></script>

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
	<script src="./assets/js/demo9/pages/custom/inbox/inbox.js"
		type="text/javascript"></script>
        
        	<script src="./assets/vendors/custom/uppy/uppy.bundle.js"
		type="text/javascript"></script>
	 <script src="./assets/js/demo9/pages/crud/file-upload/uppy.js"
		type="text/javascript"></script>
        
        
        
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		function  successApply() {
			swal({
				title : "Success!",
				text : "Your file has been sent successfully !",
				icon : "success",
				button : "Ok",
			});
		}
		
	</script>
        
            </body>
    <!-- end::Body -->
</html>
    