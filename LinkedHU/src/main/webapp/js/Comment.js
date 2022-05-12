/**
 * post detail page show hide comments 
 */

 
$(document).ready(function(){
	$(".comment-btn").click(function(){
		$(".all-comments").toggle(500);
	});
	
	$(".share-comment").click(function(){
		$(".share-comment-text-form").toggle(500);
	});
	
	
	$(".share-btn").click(function(){
		
		var dataString = $("#share-comment").serialize();
		
		$.ajax({
			url     : 'CommentController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			dataType : 'json',
			success    : function(data,textStatus, jqXHR)
			{
				addComment(data);
			
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
		
	});
	
	$(".kt-notes__items").on('click','.delete-comment', function() {
		let commentID = $(this).next().attr("class");
		let dataString = $("#"+commentID+"-form").serialize();	
		$.ajax({
			url     : 'CommentController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data)
			{
				console.log(commentID);
				deleteComment(commentID);
				
			
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
	});
});

function deleteComment(commentID){
	$("#"+commentID+"-div").hide(500);
	let commentCount = parseInt($(".comment-count").text());
	commentCount--;
	$(".comment-count").text(commentCount);
}

function addComment(data){
			
	// comment count increment 
	let commentCount = parseInt($(".comment-count").text());
	commentCount++;
	$(".comment-count").text(commentCount);
	
	let commentAuthor = data.authorInfo.fullName;
	let authorPictureSrc = data.authorInfo.profilePictureSrc;
	let commentText = data.commentInfo.text;
	let commentID = data.commentInfo.commentID;
	
	let userType = "default";
	switch(data.authorInfo.userType){
		case 0:
			userType = "Admin";
			break;
		case 1:
			userType = "Academician";
			break;
		case 2:
			userType = "Student";
			break;
		case 3:
			userType = "Graduate";
			break;
		
	}
	
	let itemText =`<div class="kt-notes__item " id="${commentID}-div"> 
                            <div class="kt-notes__media">
                                <img class="kt-hidden-" src="${authorPictureSrc}" alt="image">
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
                                    	
                                    	<!-- get comment author -->
                                    	
                                    	
                                    
                                        <a href="#" class="kt-notes__title">
                                         	${commentAuthor}                                           
                                        </a>
                                        
                                        <span class="kt-notes__desc">
                                           	
                                        </span>
                                        <span class="kt-badge kt-badge--primary kt-badge--inline">
                                        	${userType}
                                        </span>
                                    </div>
                                    
                                    <!--
                                    	Admin can delete all comments
                                    	post author can delete all her/his post
                                    	others can delete only their own comments
                                     -->
                                    
                                    <div class="kt-notes__dropdown"> 
                                        <a href="#" class="btn btn-sm btn-icon-md btn-icon" data-toggle="dropdown">
                                            <i class="flaticon-more-1 kt-font-brand"></i>
                                        </a>
                                        
                                       <form class="delete-comment-form" id="${commentID}-form">
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <ul class="kt-nav">
											    <li class="kt-nav__item">
											        <a class="kt-nav__link">
											            <i class="kt-nav__link-icon flaticon2-line-chart"></i>
											         
											            <span class="kt-nav__link-text delete-comment">Delete</span>
											            <span class="${commentID}"></span>
											            
											            <input type="hidden" name="operation" value="17">
											            <input type="hidden" name="commentID" value="${commentID}">
											            
											        </a>
											    </li>
											</ul>                                        
										</div>
                                        </form>
                                        
                                    </div>
									
                                </div>
                                <span class="kt-notes__body">                                        
                                    ${commentText}
                                </span>  
                            </div>                                             
                        </div> `;

	$(".share-comment-text-form").toggle(500);
	$(".kt-notes__items").prepend(itemText);
	
}
 