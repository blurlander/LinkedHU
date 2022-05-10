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
		if(postTitle.toUpperCase().indexOf(filter) <= -1 && postAuthor.toUpperCase().indexOf(filter) <= -1)
		{
			
			post.style.display = "none";	
		}
		else
		{
			post.style.display = "";	
			
		}
		
	}

}

