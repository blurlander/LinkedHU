document.getElementById("generalSearch").addEventListener("keyup", searchPost);

function searchPost()
{
	var input = $("#generalSearch").val();
	var filter = input.toUpperCase();
	var allPosts = document.getElementsByClassName("postRow");
	var id = -1;
	var post;
	var postAuthor = "";
	var postTitle = "";
	var postText = "";
	
	
	
	for(var i=0;i<allPosts.length;i++)
	{
		post = allPosts[i];
		id = post.getAttribute("id");
		postTitle = $("#"+ id + "title").text();
		postAuthor = $("#"+ id + "author").text();
		postText = $("#"+ id + "messageText").text();
		// && postText.toUpperCase().indexOf(filter) <= -1 
		
		var postID = post.getAttribute("id");
		
		if(postTitle.toUpperCase().indexOf(filter) <= -1)
		{
			post.style.display = "none";		
		}
		else
		{	
			if(filter == ""){
				$("#"+ postID + "title").css("background","transparent");
			}else{
				$("#"+ postID + "title").css("background","yellow");
			}
	
			post.style.display = "";	
			
		}
		
		
		if( postAuthor.toUpperCase().indexOf(filter) <= -1)
		{			
			post.style.display = "none";

		}
		else
		{	
			if(filter == ""){
				$("#"+ postID + "author").css("background","transparent");
			}else{
				$("#"+ postID + "author").css("background","orange");
			}
			
			post.style.display = "";	
			
		}
		
		
	}

}

