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
								 
									<img id="sb_profile_picture" alt="Pic" src="./ProfilePictures/123.jpg" />
									
									<div class="sb_fullname " style="display: none">
										Ali fuat ozturk
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
								<a href="#">
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
		
		<!-- begin:: right buttons (create post and plus sign)-->
		<div class="kt-subheader__toolbar">
           <div class="kt-subheader__wrapper">
           
				<!-- Create post iÃ§in buton -->
				<button type="button" class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#kt_modal_4">Create Post</button>
				
				<!-- plus sign on the right -->			                
				<div class="dropdown dropdown-inline" data-toggle="kt-tooltip"  data-placement="left">
					
					<!-- plus sign icon-->
					<a href="#" class="btn btn-icon"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon kt-svg-icon--success kt-svg-icon--md">
							<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
							<polygon id="Shape" points="0 0 24 0 24 24 0 24"/>
							<path d="M5.85714286,2 L13.7364114,2 C14.0910962,2 14.4343066,2.12568431 14.7051108,2.35473959 L19.4686994,6.3839416 C19.8056532,6.66894833 20,7.08787823 20,7.52920201 L20,20.0833333 C20,21.8738751 19.9795521,22 18.1428571,22 L5.85714286,22 C4.02044787,22 4,21.8738751 4,20.0833333 L4,3.91666667 C4,2.12612489 4.02044787,2 5.85714286,2 Z" id="Combined-Shape" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
							<path d="M11,14 L9,14 C8.44771525,14 8,13.5522847 8,13 C8,12.4477153 8.44771525,12 9,12 L11,12 L11,10 C11,9.44771525 11.4477153,9 12,9 C12.5522847,9 13,9.44771525 13,10 L13,12 L15,12 C15.5522847,12 16,12.4477153 16,13 C16,13.5522847 15.5522847,14 15,14 L13,14 L13,16 C13,16.5522847 12.5522847,17 12,17 C11.4477153,17 11,16.5522847 11,16 L11,14 Z" id="Combined-Shape" fill="#000000"/>
							</g>
						</svg>
					<!-- <i class="flaticon2-plus"></i> -->
					</a>
					
					<!-- plus sign drop down -->
					<div class="dropdown-menu dropdown-menu-fit dropdown-menu-md dropdown-menu-right">
						<!--begin::Nav-->
                      	<ul class="kt-nav">
                          	<li class="kt-nav__head">
                              	Upload File:
                              	<i class="flaticon2-information" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more..."></i>
                          	</li>

                          	<li class="kt-nav__separator"></li>
                          	<li class="kt-nav__foot">
                              	<a class="btn btn-label-brand btn-bold btn-sm" href="#">Share as a post</a>
                              	<a class="btn btn-clean btn-bold btn-sm" href="#"  data-placement="right" >To resources</a>
                              	
                          	</li>
                      	</ul>
                      <!--end::Nav-->
                   </div>
                   <!-- plus sign drop down end-->
                   
                </div>
                
            </div>
        </div>
		<!-- end:: right buttons (create post and plus sign)-->
                         
    </div><!-- container div -->
</div>
<!-- end:: Content Head (search post, create post)-->

<!-- begin:: Content (posts, footer)-->
<div id = "1234567" class="kt-container  kt-grid__item kt-grid__item--fluid" >
	
	<!-- create post pop-up -->
	<div class="modal fade show" id="kt_modal_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none; padding-right: 16px;" aria-modal="true">
   		<div class="modal-dialog modal-lg" role="document">
       		<div class="modal-content">
           		<div class="modal-header">
               		<h5 class="modal-title" id="exampleModalLabel">New message</h5>
              			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
           		</div>
           		<div class="modal-body">
               		<form method="POST" action="PostController" id = "create-post-form">
                   		<div class="form-group">
                        	<label for="post-name" class="form-control-label">Title:</label>
                        	<input type="text" class="form-control" name="title">						                        
                   		</div>
	                    <div class="form-group">
	                        <label for="post-text" class="form-control-label">Text:</label>
	                        <textarea class="form-control" id="message-text" name = "text"></textarea>
	                        <input type="hidden" id = "5" name = "operation" value="${MyConstants.OPP_CREATE_POST }">
	                    </div>
              			</form>
           		</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
	                <button type="submit" form="create-post-form" value="submit" class="btn btn-primary">Share Post</button>
	                
	            </div>
      	 		</div>
  			 </div>
	</div>  
	<!-- create post pop-up end-->

	<!-- begin:: all posts -->	
	<c:forEach items="${map.entrySet()}" var="entry">
		<div class="row" id =${ String.valueOf(entry.getKey().postID)} >
		    <div class="col-xl-12">
		        <!--begin:: single post (3 wrapper class)-->
		        <div class="kt-portlet kt-portlet--height-fluid">
		            <div class="kt-portlet__body kt-portlet__body--fit">
		                <div class="kt-widget kt-widget--project-1">
		                	
		                	<!-- post head -->
		                    <div class="kt-widget__head">
		                        <div class="kt-widget__label">
		                            <div class="kt-widget__media">
		                            	
		                            	<form action="UserController" method="POST">
		                                <span>                                     
		                                    <input type="image" src="${entry.getValue().profilePictureSrc}" alt="image" style="height:100px;width:100px;cursor: pointer;border-top-left-radius: 50% 50%; border-top-right-radius: 50% 50%; border-bottom-right-radius: 50% 50%; border-bottom-left-radius: 50% 50%;">
		                                    <input type="hidden" name="operation" value="${MyConstants.OPP_VIEW_PROFILE }">
		                                    <input type="hidden" name="userID" value="${entry.getValue().userID }">                                	
		                                </span>
		                            	</form>
		                            	
		                            </div>
		                            <div class="kt-widget__info kt-margin-t-5">
		                                <a href="#" class="kt-widget__title">
		                                ${ entry.getKey().title }
		                                                                        
		                                </a>
		                                
		                                <span class="kt-widget__desc">
		                                ${entry.getValue().fullName}
		                                <br>
		                                ${ entry.getKey().dateFormat}
		                                </span>
		                            </div>
		                        </div>
		                        
		                        <!-- DELETE POST ENABLE OR DISABLE -->
		                        <c:if test="${currentUser.userID ==  entry.getValue().userID}">
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
		                    	<span class="kt-widget__text" style="font-size: 17px; white-space: pre-line;margin-top:0px">
		                    		${entry.getKey().messageText}
		                    	</span>	
		                    </div>
		                    <!-- post body end -->
		                    
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
		                           	<div class="kt-widget__section">
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

	<script type="text/javascript">
		if(performance.navigation.type == 2){
			console.log("xx");
			location.reload(true);
		}
	</script>
	
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
    