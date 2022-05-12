 $(document).ready(function(){
	
	let textInput = $("#input-id-post-text");
	let editor = $("#kt_inbox_compose_editor");
	let sendButton = $("#button-id-send-post");
	let postTypeInput = $("#postType");
	let sendPostForm = $("#create-post-form");
	
	sendButton.click(function(){
		let text = editor.find(".ql-editor");
		textInput.attr("value",text.html());
		postTypeInput.attr("value","Normal");
	});
	
	$(".sendPost-li").click(function(){
		
		if($(this).attr("data-li") == "intern"){
			let text = editor.find(".ql-editor");
			textInput.attr("value",text.html());
			postTypeInput.attr("value","post-intern");

		}else if($(this).attr("data-li") == "job"){
			let text = editor.find(".ql-editor");
			textInput.attr("value",text.html());
			postTypeInput.attr("value","post-job");
			
		}else if($(this).attr("data-li") == "standart"){
			let text = editor.find(".ql-editor");
			textInput.attr("value",text.html());
			postTypeInput.attr("value","Normal");
			
		}else if($(this).attr("data-li") == "scholar"){
			let text = editor.find(".ql-editor");
			textInput.attr("value",text.html());
			postTypeInput.attr("value","post-scholar");
		}
		
		sendPostForm.submit();
	});
	
	
	
});