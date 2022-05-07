/**
 * 
 */
 
 /**
 * Like and dislike button  
 	
 	construction is like this:
	 	<the button> => heart icon red or gray
	 	<a> => like count text (100 Likes)
	 	<input> => to store post id
 	
 	dislikedPost and likedPost are the form inputs
 	 to send the post id to the servlet
 
 */
 
 $(document).ready(function(){
		
							
	$(".follow-btn").click(function(){

		let content = $(this).text();
		
		console.log("button click");
		
		if(content == "Unfollow User"){
			
			$(this).css("display","none");
			$(this).prev().css("display","inline");
			
			console.log("unfoollow");
			callJqueryAjax(0,this);
			
		}else if(content == "Follow User"){
			
			$(this).css("display","none");
			$(this).next().css("display","inline");
			
			callJqueryAjax(1,this);
		}
		

	});
	
	
});

function followUser(btn){	
		
	let followCountText = $("#followercount").text();
	let followCount = parseInt(followCountText);
	followCount++;
	
	console.log(followCount);
	$("#followercount").text(followCount);
	
}

function unfollowUser(btn){	
	
	let followCountText = $("#followercount").text();
	let followCount = parseInt(followCountText);
	followCount--;
	
	console.log(followCount);
	
	$("#followercount").text(followCount);
		
}

function callJqueryAjax(selector,btn){
	//Converting the input values in the form with id=likeForm to the string.
	if(selector == 0){
		var dataString = $("#unfollowform").serialize();	
	}
	else if(selector == 1){
		var dataString = $("#followform").serialize();
	}
	$.ajax({
		url     : 'UserController', //Target servlet
		method     : 'POST',        // Method(always POST)
		data     : dataString,      // The data that will be sent to the servlet.
		success    : function(data)
		{
			if(selector == 0){
				unfollowUser(btn);
			}else if(selector == 1){ 	// If servlet successfully responses,this block will be executed.
				followUser(btn);
				
			}
			
			console.log(data);
			//alert('Success!');
		},
		error : function(jqXHR, exception){
			console.log('Error occured!!');
		}
	});
}