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

        <title>Detail Page</title>
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
								 	
								 	
								 	<c:if test="${currentUser.userType == MyConstants.TYPE_ADMIN}">
									<img id="sb_profile_picture" alt="Pic" src="./ProfilePictures/amdin.jpg" />
									</c:if>
								 	
								 	
								 	<c:if test="${currentUser.userType != MyConstants.TYPE_ADMIN}">
									<img id="sb_profile_picture" alt="Pic" src="${currentUser.profilePictureSrc }" />
									</c:if>
									
									
									<div class="sb_fullname " >
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
				<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper" style="padding:0px !important">
					<div class="kt-body kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-grid--stretch" id="kt_body">
						<div class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content">


<div class="kt-container  kt-grid__item kt-grid__item--fluid" style="padding-top: 30px">

	<!--Begin:: current Post-->
	<div class="row">
		
			<c:if test="${String.valueOf(currentPost.postType) == \"post-intern\" }">
				<c:set var="bgcolor_post" value="success" scope="request"/>								
				<c:set var="title_post" value="Internship Announcement" scope="request"/>								
			</c:if>
			<c:if test="${String.valueOf(currentPost.postType) == \"post-job\" }">
				<c:set var="bgcolor_post" value="primary" scope="request"/>		
				<c:set var="title_post" value="Job Advertisement" scope="request"/>				
			</c:if>
			<c:if test="${String.valueOf(currentPost.postType) == \"post-scholar\" }">
				<c:set var="bgcolor_post" value="warning" scope="request"/>			
				<c:set var="title_post" value="Scholarship Announcement" scope="request"/>			
			</c:if>
		
		
	
	    <div class="col-xl-12">
	        <div class="kt-portlet kt-portlet--height-fluid">
	            <div class="kt-portlet__body kt-portlet__body--fit">
	            	<!-- begin:: post -->
	                <div class="kt-widget kt-widget--project-1">
	                		
	                	<!-- post head -->
	                    <div class="kt-widget__head">
	                        <div class="kt-widget__label">
	                            <div class="kt-widget__media">
	                            	
	                            	<form action="UserController" method="POST">
	                                <span class="kt-media--circle">  
	                                
	                                	<%
	                                		// find post owner
	                                		Post p = (Post)session.getAttribute("currentPost");
	                                		TreeMap<Post,User> map = (TreeMap<Post,User>)session.getAttribute("map");
											for (Post post :  map.keySet()) {
												if (post.getPostID() == p.getPostID()) {
													request.setAttribute("postAuthor", map.get(post));
													break;
												}
											}
	                                	%>               
										 	<c:if test = "${postAuthor.userType == MyConstants.TYPE_ADMIN}">                           
		                                    <input type="image" src="./ProfilePictures/amdin.jpg" alt="image" style="height:100px;width:100px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    </c:if>
		                                    
		                                    <c:if test = "${postAuthor.userType != MyConstants.TYPE_ADMIN}">                           
		                                    <input type="image" src="${postAuthor.profilePictureSrc}" alt="image" style="height:100px;width:100px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    </c:if>	                                   
	                                   	                                    
	                                    <input type="hidden" name="operation" value="${MyConstants.OPP_VIEW_PROFILE }">
	                                    <input type="hidden" name="userID" value="${currentPost.authorID }">                                	
	                                </span>
	                            	</form>
	                            	
	                            </div>
	                            <div class="kt-widget__info kt-margin-t-5">
	                                <a href="#" class="kt-widget__title">
	                                ${ currentPost.title }
	                                                                        
	                                </a>
	                                
	                                <span class="kt-widget__desc">
	                                ${postAuthor.fullName}
	                                <br>
	                                ${currentPost.createdAt}
	                                </span>
	                            </div>
		                        
		           				<c:if test="${currentPost.postType != \"Normal\" }">
									<div
										class="kt-portlet kt-iconbox kt-iconbox--${bgcolor_post } kt-iconbox--animate-fast"
										style="margin-left: 150px; box-shadow: none; height: 100px">
										<div class="kt-portlet__body">
											<div class="kt-iconbox__body">
												<div class="kt-iconbox__icon">
													<svg xmlns="http://www.w3.org/2000/svg"
														xmlns:xlink="http://www.w3.org/1999/xlink"
														width="24px" height="24px" viewBox="0 0 24 24"
														version="1.1" class="kt-svg-icon"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect id="bound" x="0" y="0" width="24" height="24"></rect><path
															d="M8,3 L8,3.5 C8,4.32842712 8.67157288,5 9.5,5 L14.5,5 C15.3284271,5 16,4.32842712 16,3.5 L16,3 L18,3 C19.1045695,3 20,3.8954305 20,5 L20,21 C20,22.1045695 19.1045695,23 18,23 L6,23 C4.8954305,23 4,22.1045695 4,21 L4,5 C4,3.8954305 4.8954305,3 6,3 L8,3 Z"
															id="Combined-Shape" fill="#000000" opacity="0.3"></path><path
															d="M10.875,15.75 C10.6354167,15.75 10.3958333,15.6541667 10.2041667,15.4625 L8.2875,13.5458333 C7.90416667,13.1625 7.90416667,12.5875 8.2875,12.2041667 C8.67083333,11.8208333 9.29375,11.8208333 9.62916667,12.2041667 L10.875,13.45 L14.0375,10.2875 C14.4208333,9.90416667 14.9958333,9.90416667 15.3791667,10.2875 C15.7625,10.6708333 15.7625,11.2458333 15.3791667,11.6291667 L11.5458333,15.4625 C11.3541667,15.6541667 11.1145833,15.75 10.875,15.75 Z"
															id="check-path" fill="#000000"></path><path
															d="M11,2 C11,1.44771525 11.4477153,1 12,1 C12.5522847,1 13,1.44771525 13,2 L14.5,2 C14.7761424,2 15,2.22385763 15,2.5 L15,3.5 C15,3.77614237 14.7761424,4 14.5,4 L9.5,4 C9.22385763,4 9,3.77614237 9,3.5 L9,2.5 C9,2.22385763 9.22385763,2 9.5,2 L11,2 Z"
															id="Combined-Shape" fill="#000000"></path></g>
													</svg>
												</div>
												<div class="kt-iconbox__desc">
													<h3 class="kt-iconbox__title">
														<a class="kt-link" href="#">${title_post }</a>
													</h3>
												</div>
											</div>
										</div>
									</div>
								</c:if>                     
		                            
		                            
	                            
	                        </div>
	                        
	                         <!-- DELETE POST ENABLE OR DISABLE -->
	                        <c:if test="${currentUser.userID ==  postAuthor.userID || currentUser.userType == MyConstants.TYPE_ADMIN}">
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
	                                        <input type = "hidden" name = "delPost" value = ${String.valueOf(currentPost.postID) }>
	                                    </li>
	                                </ul>
	                                </form>
	                            </div>
	                        </div>
	                        </c:if>
	                    </div>
						<!-- post head end -->

						<!-- post body -->					
	                    <div class="kt-widget__body">
	                    	<span class="kt-widget__text" style="font-size: 17px; white-space: pre-line;margin-top:0px">
	                    		${currentPost.messageText}
	                    	</span>	
	                    </div>
						<!-- post body end -->
						
						 
	                    <div class="kt-widget__body">
		                    <c:forEach items="${currentPost.uploadedFiles }" var="file">
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
	                           			<c:if test="${currentUser.likes.contains(currentPost.postID)}">
	                           		
	                          				<button type="button" class="flaticon-black like-btn" style="border: none; background-color: white; font-size: 25px; color: red;"></button>
	                                    	<a href="#" style="font-size: 15px; color: black;">${currentPost.likeCount} Likes</a>
	                           				<input type="hidden" value=${currentPost.postID }>
	                           				
	                           			</c:if>
	                           			
	                           			<c:if test="${currentUser.likes.contains(currentPost.postID) == false}">
	                           			
	                          				<button type="button" class="flaticon-black like-btn" style="border: none; background-color: white; font-size: 25px; color: gray;"></button>
	                                    	<a href="#" style="font-size: 15px; color: black;">${currentPost.likeCount} Likes</a>
	                           				<input type="hidden" value=${currentPost.postID }>
	                           				
	                           			</c:if>
	                           			
	                           		</div>
	                           		
	                           		<div class="kt-demo-icon__preview comment-btn">
	                           			<button type="button" class="flaticon2-chat-1" style="border: none; background-color: white; font-size: 25px;"></button>
	                           			<a href="#" style="font-size: 15px; color: black;"> <span class="comment-count">${currentPost.commentCount}</span>  Comments</a>
	                           		</div>
	                          
	                           	</div>
	                           	
	                           	
	                           	
	                           	<div class="kt-widget__section " style="display: flex;">
	                           		
	                           		<c:if test="${String.valueOf(currentPost.postType) != \"Normal\" && 
		                           			(currentUser.userType == MyConstants.TYPE_STUDENT ||  currentUser.userType == MyConstants.TYPE_GRADUATE  ) }">
			                           		
		                           		
		                           		<label for="myfile" style="margin-bottom: 0px !important; margin-right: 5px"><span class="btn btn-outline-dark" >Apply</span> </label>
										<input type="file" id="myfile" name="myfile" style="display: none;" onchange="successApply()" >
											
		                           	</c:if>
		                           	
		                           	<button class="btn btn-outline-dark share-comment">Share a comment</button>
	                           	</div>
	
	                        </div>
	                    </div>
	                	<!-- post footer end -->
	                	
	                </div>
	                <!--end::Post -->
				<!-- 4 wrapper div is below-->    
	            </div>
	        </div>
	    </div> 
	</div>
	<!--End:: current Post-->

	
	<form id="likeForm">
		<input type = "hidden" name = "operation" value = "${MyConstants.OPP_LIKE_POST}" >
		<input type = "hidden" id = "likedPost" name = "likedPost" value = "">
		<input type = "hidden" name = "pageCode" value = "${MyConstants.CODE_DETAILPAGE}">
	</form>
	<form id="dislikeForm">
		<input type = "hidden" name = "operation" value = "${MyConstants.OPP_DISLIKE_POST}" >
		<input type = "hidden" id = "dislikedPost" name = "dislikedPost" value = "">
		<input type = "hidden" name = "pageCode" value = "${MyConstants.CODE_DETAILPAGE}">
	</form>
	
	<!-- begin:: type comment -->
	<div class="kt-portlet share-comment-text-form" style="display:none">
	
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<h3 class="kt-portlet__head-title">
					Share a comment
				</h3>
			</div>
		</div>
		<!--begin::Form-->
		<form id="share-comment">
			<div class="kt-portlet__body">
				
				<div class="form-group form-group-last">
					<label for="exampleTextarea">Write your comment</label>
					<textarea name="commentText" class="form-control commentTextArea" rows="3" style="height: 131px;"></textarea>
					<input type="hidden" name="operation" value="${MyConstants.OPP_SHARE_COMMENT }">
					<input type="hidden" name="postID" value="${currentPost.postID }">
				</div>
			</div>
			<div class="kt-portlet__foot">
				<div class="kt-form__actions">
					
					<a class="btn btn-primary share-btn" style="color:white !important">Share</a>
					<a class="btn btn-secondary share-comment">Cancel</a>
				</div>
			</div>
		</form>
		<!--end::Form-->		
	</div>
	<!-- end:: type comment -->
	
	<!-- begin:: comments -->
	<div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid all-comments">
		<div class="row" style="justify-content:center">
		    <div class="col-lg-12">
		        <!--Begin::comment-->
		        <div class="kt-portlet">
		        
		        	<!-- head  -->
		            <div class="kt-portlet__head">
		                <div class="kt-portlet__head-label">
		                    <h3 class="kt-portlet__head-title">
		                        All Comments
		                    </h3>
		                </div>
		            </div>
		            
		            <!--  body  -->
		            <div class="kt-portlet__body">                   
		                <div class="kt-notes">
		                    <div class="kt-notes__items">
		                        
		                        <c:forEach items="${currentPost.comments }" var="comment">
		                        
		                        <!-- get comment author --> 
		                       	<c:set var="currComment" value="${comment}" scope="request"/>
		                       	<%
		
		                       		List<User> users = (ArrayList<User>)session.getAttribute("allUsers");
		                       		for(User u: users){
		                       			// Finding the author of currentComment before display it.
		                       			if(u.getUserID() == ((Comment)request.getAttribute("currComment")).getUserID() ) {
		                       				request.setAttribute("commentAuthor", u);
		                       				break;
		                       			}
		                       		}
		                       		
		                       	%>
								<!-- Start of comment -->
		                        <div class="kt-notes__item" id="${comment.commentID}-div"> 
		                            <div class="kt-notes__media">
		                            			                            			                                
		                                <form action="UserController" method="POST">
		                                <span>   
		                                    <c:if test = "${commentAuthor.userType != MyConstants.TYPE_ADMIN }">                           
		                                    <input type="image" src="${commentAuthor.profilePictureSrc}" alt="image" style="height:50px;width:50px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    </c:if>
		                                    
		                                    <c:if test = "${commentAuthor.userType == MyConstants.TYPE_ADMIN }">                           
		                                    <input type="image" src="./ProfilePictures/amdin.jpg" alt="image" style="height:50px;width:50px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    </c:if>
		                                    
		                                    
		                                    
		                                    <input type="hidden" name="operation" value="${MyConstants.OPP_VIEW_PROFILE }">
		                                    <input type="hidden" name="userID" value="${commentAuthor.userID }">                                	
		                                </span>
		                            	</form>
		                                                       
		                                
		                                <span class="kt-notes__icon kt-font-boldest kt-hidden">
		                                    <i class="flaticon2-cup"></i>                                    
		                                </span> 
		                                <h3 class="kt-notes__user kt-font-boldest kt-hidden">
		                                    N S                                                       
		                                </h3>                                 
		                            </div>    
		                            <div class="kt-notes__content"> 
		                                <div class="kt-notes__section">     
		                                    <div class="kt-notes__info">
		                                    	
		                                    	
		                                    
		                                        <a href="#" class="kt-notes__title">
		                                         	<c:out value="${commentAuthor.fullName }"></c:out>                                                       
		                                        </a>
		                                        
		                                        <span class="kt-notes__desc">
		                                           	<c:out value=""></c:out>
		                                        </span>
		                                        <span class="kt-badge kt-badge--primary kt-badge--inline">
		                                        	<c:choose>
		                                        		<c:when test="${commentAuthor.userType == MyConstants.TYPE_STUDENT }">
		                                        			<c:out value="Student"></c:out>
		                                        		</c:when>
		                                        		<c:when test="${commentAuthor.userType == MyConstants.TYPE_GRADUATE }">
		                                        			<c:out value="Graduate"></c:out>
		                                        		</c:when>
		                                        		<c:when test="${commentAuthor.userType == MyConstants.TYPE_ACADEMICIAN }">
		                                        			<c:out value="Academician"></c:out>
		                                        		</c:when>
		                                        		<c:when test="${commentAuthor.userType == MyConstants.TYPE_ADMIN }">
		                                        			<c:out value="Admin"></c:out>
		                                        		</c:when>
		                                        	</c:choose>
		                                        </span>
		                                    </div>
		                                    
		                                    <!--
		                                    	Admin can delete all comments
		                                    	post author can delete all her/his post
		                                    	others can delete only their own comments
		                                     -->
		                                    <c:if test="${
		                                    	(currentUser.userType == MyConstants.TYPE_ADMIN)
		                                    || (currentUser.userType == MyConstants.TYPE_ACADEMICIAN && currentUser.userID == currentPost.authorID)
		                                    || (currentUser.userType == MyConstants.TYPE_GRADUATE && currentUser.userID == currentPost.authorID)
		                                    || (currentUser.userID == comment.userID)
		                                    }">
		                                    <div class="kt-notes__dropdown"> 
		                                        <a href="#" class="btn btn-sm btn-icon-md btn-icon" data-toggle="dropdown">
		                                            <i class="flaticon-more-1 kt-font-brand"></i>
		                                        </a>
		                                        <form class="delete-comment-form" id="${comment.commentID}-form">
		                                        <div class="dropdown-menu dropdown-menu-right">
		                                            <ul class="kt-nav">
													    <li class="kt-nav__item">
													        <a class="kt-nav__link">
													            <i class="kt-nav__link-icon flaticon2-line-chart"></i>
													         	
													         	<!-- Do not add anything between the spans below  -->
													            <span class="kt-nav__link-text delete-comment" >Delete</span>
													            <span class="${comment.commentID}"></span>
													            <!-- next comment :) -->
													            
													            <input type="hidden" name="operation" value="${MyConstants.OPP_DELETE_COMMENT }">
													            <input type="hidden" name="commentID" value="${comment.commentID}">
													            
													        </a>
													    </li>
													</ul>                                        
												</div>
		                                        </form>
												
		                                    </div>
											</c:if>
		                                </div>
		                                <span class="kt-notes__body" style="word-wrap: break-word">                                        
		                                    <c:out value="${comment.text }"></c:out>
		                                </span>  
		                            </div>                                             
		                        </div> 
		                        </c:forEach>
		                        
		                    </div>
		                    <!-- notes item end -->
		                </div>
		            </div>
		        </div>
		        <!--End::comment-->
		    </div>
		</div>	
	</div>
	<!-- end:: comments -->
	
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
    