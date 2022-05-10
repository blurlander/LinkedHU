"use strict";

$(document).ready(function()
{	
	var uploadedFiles = [];
	var index=0;
	
	if(document.getElementsByClassName("fileInputGeneral"))
	{
		const fileInputs = document.querySelectorAll(".fileInputGeneral");
		fileInputs.forEach(fileInput => {
			fileInput.addEventListener("change", event => {
			  const files = event.target.files;
			  if(calculateTotalLength() <3){
				 uploadedFiles.push(files[0]);
				  let fileName = files[0].name;
				  let fileSize = (files[0].size/1024).toFixed(2) + "KB";
				  let itemText = `<div class="dropzone-item dz-image-preview dz-error dz-complete" id="${index}" style="">
			                                    <div class="dropzone-file">
			                                        <div class="dropzone-filename" title="some_image_file_name.jpg">
			                                            <span data-dz-name=""> ${fileName}</span> <strong>(<span data-dz-size=""><strong>${fileSize}</strong></span>)</strong>
			                                        </div>
			                                        
			                                    </div>
			                                    <div class="dropzone-toolbar">
			                                        <span class="dropzone-delete" data-dz-remove=""><i class="flaticon2-cross"></i><input type="hidden" value="${index}"></span>
			                                    </div>
			                                </div>`
				  $("#mainDropzone").prepend(itemText);
				  index++;
	}
	});
		  
		});
		
	}
	
	if(document.getElementById("fileInputReply"))
	{

		const fileInput = document.getElementById("fileInputReply");
		fileInput.addEventListener("change", event => {
		  const files = event.target.files;
		  if(calculateTotalLength() <3){
			 uploadedFiles.push(files[0]);
			  let fileName = files[0].name;
			  let fileSize = (files[0].size/1024).toFixed(2) + "KB";
			  let itemText = `<div class="dropzone-item dz-image-preview dz-error dz-complete" id="${index}reply" style="">
		                                    <div class="dropzone-file">
		                                        <div class="dropzone-filename" title="some_image_file_name.jpg">
		                                            <span data-dz-name=""> ${fileName}</span> <strong>(<span data-dz-size=""><strong>${fileSize}</strong></span>)</strong>
		                                        </div>
		                                        
		                                    </div>
		                                    <div class="dropzone-toolbar">
		                                        <span class="dropzone-delete" data-dz-remove=""><i class="flaticon2-cross"></i><input type="hidden" value="${index}"></span>
		                                    </div>
		                                </div>`
			  $("#replyDropzone").prepend(itemText);
			  index++;
	}
	});
	}
	
	$("#mainDropzone").on("click",".flaticon2-cross",function(){
		var id = $(this).next().val();
		uploadedFiles[id] = "";
		$("#"+id).css("display","none");
	});
	
	$("#replyDropzone").on("click",".flaticon2-cross",function(){
		var id = $(this).next().val();
		uploadedFiles[id] = "";
		console.log(id);
		$("#"+id+"reply").css("display","none");
	});
	
	$("#msgModalBtnOtherUser").click(function(){
		document.getElementById("kt_inbox_compose").style.display = "block";
	});
	$("#msgModelCloseBtn").click(function(){
		document.getElementById("kt_inbox_compose").style.display = "none";
		$(".msgSubjectArea").val("");
		$(".msgTextArea").val("");
		for(var i=0;i<uploadedFiles.length;i++)
		{
			if(uploadedFiles[i] != "")
			{
				$("#"+i).css("display","none");
				
			}
			
		}
		index = 0;
		uploadedFiles = [];

		
	});
	$("#msgModalBtnInbox").click(function(){
		document.getElementById("kt_inbox_composeFromMain").style.display = "block";
		
	});
	$("#msgModelCloseBtnInbox").click(function(){
		$("#receiverSelect").val("");
		$(".inboxSubjectArea").val("");
		$(".inboxTextArea").val("");
		var elements = document.getElementsByClassName("tagify__dropdown__item");
		for(var j=0;j<elements.length;j++)
		{
			if(elements[j].style.display === "none")
			{
				console.log("Bana girdi");
				elements[j].style.display = "";
				
			}
			
		}
		$("#systemUsers").css("display","none");
		
		
		for(var i=0;i<uploadedFiles.length;i++)
		{
			if(uploadedFiles[i] != "")
			{
				$("#"+i).css("display","none");
				
			}
			
		}
		document.getElementById("kt_inbox_composeFromMain").style.display = "none";
		index = 0;
		uploadedFiles = [];
		

	});
	$("#msgText").click(function(){
		$("#msgText").attr('data-placeholder',"");
	});
	$("#receiverSelect").click(function(){
	
		var visibility = $("#systemUsers").css("display");
		if(visibility === "none")
		{
			$("#systemUsers").css("display","block");	
			document.getElementById("receiverSelect").addEventListener("keyup",searchUser);
		}
		else
		{
			$("#systemUsers").css("display","none");
			var elements = document.getElementsByClassName("tagify__dropdown__item");
			for(var j=0;j<elements.length;j++)
			{
				if(elements[j].style.display === "none")
				{
					console.log("Bana girdi");
					elements[j].style.display = "";
					
				}
				
			}
			document.getElementById("receiverSelect").removeEventListener("keyup",searchUser);
		}
		
	});
	$("#replyIcon").click(function(){
		let composeForm = document.getElementById("kt_inbox_compose_formReply");
		if(composeForm.style.display === "none"){
			composeForm.style.display = "flex";
		}
		else{
			composeForm.style.display = "none";
		}
	});
	
	$(".msg-PushButton").click(function(){
		var formID = $(this).next().attr("value"); 
		var formElement = $("#"+formID);
		const formData = new FormData(formElement[0]);
		if(uploadedFiles.length != 0){
			for(var value of uploadedFiles)
			{
				formData.append("file",value);
			}
			
		}
		
		$.ajax({
			url     : 'MessageController',
			method     : 'POST', 
			dataType : 'json',    
			contentType : false,
			processData : false,   
			data     : formData,      
			success    : function(data,textStatus, jqXHR)
			{	
				if(formID === "msgInfoFormProfile"){
					$("#kt_inbox_compose").css("display","none");
					messageSentSucces();
					document.getElementById("msgModelCloseBtn").click();
					
				}
				else if(formID === "msgInfoFormReply"){
					$(".replySubjectArea").val("");
					$(".replyTextArea").val("");
					for(var i=0;i<uploadedFiles.length;i++)
					{
						if(uploadedFiles[i] != "")
						{
							$("#"+i+"reply").css("display","none");
							
						}
						
					}
					index = 0;
					uploadedFiles = [];
					messageSentSuccesInbox();
					addNewMessage(data);
					
					
				}
				else if(formID === "msgInfoFormInbox"){
					document.getElementById("msgModelCloseBtnInbox").click();
					messageSentSuccesInbox();
					addNewMessage(data);
				}
			
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
		
	});
	$("#btn_myMessages").click(function(){
		document.getElementById("form_viewMessages").submit();
		
	});
	
	$("#inboxBtnSide").click(function(){
		document.getElementById("currentUserRoleInput").value = "receiver";
		document.getElementsByClassName("_msgFiles")[0].innerHTML = "";
		
	});
	$("#inboxViewBack").click(function(){
		index = 0;
		uploadedFiles = [];
		document.getElementsByClassName("_msgFiles")[0].innerHTML = "";
	});
	
	$("#clearFirst").click(function(){
		$(".inboxSubjectArea").val("");
		$(".inboxTextArea").val("");

	});
	$("#clearSecond").click(function(){
		$(".replySubjectArea").val("");
		$(".replyTextArea").val("");

	});
	$("#clearThird").click(function(){
		$("#msgsbjct").val("");
		$(".msgTextArea").val("");

	});
	
	
	$("#sentBtnSide").click(function(){
		document.getElementById("currentUserRoleInput").value = "sender";
		document.getElementsByClassName("_msgFiles")[0].innerHTML = "";
	});
	$("#multipleMark").click(function(){
		var selectedMessages = document.getElementsByClassName("kt-inbox__item--selected");
		var messageIDs = [];
		var userRole = $("#currentUserRoleInput").val();
		if(selectedMessages.length != 0)
		{
			for(var i=0;i<selectedMessages.length;i++){
				messageIDs.push(selectedMessages[i].getAttribute("id"));
			}
			$.ajax({
		    url:"MessageController",
		    type:"POST",
		    dataType:'json',
		    data: {json:messageIDs,operation:"35",role:userRole},
		    success:function(data,textStatus, jqXHR)
		    {
		        console.log(data);
		        console.log("success");
		        var messageID;
		        for(var j=0;j<messageIDs.length;j++){
					messageID = messageIDs[j];
					document.getElementById(messageID).classList.remove('kt-inbox__item--unread');
					var unreadCount = parseInt(document.getElementById("unreadCount").textContent)-1;
					document.getElementById("unreadCount").textContent = unreadCount;
					if(unreadCount <= 0)
					{
						$(".kt-nav__link-badge").css("display","none");
						
					}
			}
		    },
			});
			
		}
	});
	
	$("#multipleDeleteBtn").click(function(){
		var selectedMessages = document.getElementsByClassName("kt-inbox__item--selected");
		var messageIDs = [];
		var userRole = $("#currentUserRoleInput").val();
		if(selectedMessages.length != 0)
		{
			for(var i=0;i<selectedMessages.length;i++){
				messageIDs.push(selectedMessages[i].getAttribute("id"));
			}
			$.ajax({
		    url:"MessageController",
		    type:"POST",
		    dataType:'json',
		    data: {json:messageIDs,operation:"33",role:userRole},
		    success:function(data,textStatus, jqXHR)
		    {
		        console.log(data);
		        console.log("success");
		        var messageID;
		        for(var j=0;j<messageIDs.length;j++){
					messageID = messageIDs[j];
									
					if(document.getElementById(messageID).classList.contains("kt-inbox__item--unread"))
					{
						var unreadCount = parseInt(document.getElementById("unreadCount").textContent) -1;
						document.getElementById("unreadCount").textContent = unreadCount;
						if(unreadCount <= 0)
							{
								$(".kt-nav__link-badge").css("display","none");
								
							}				
					}
						
					$("#"+messageID).css("display","none");	
			}
		    },
			});
			
		}
	});
	
	
	$(".tagify__dropdown__item").click(function(){
		let userID = $(this).attr("id");
		let receiverName = document.getElementsByClassName(userID+"fullName")[0].textContent;
		$('#receiverSelect').val(receiverName);
		$("#receiverFromInbox").attr("value",userID);
		$("#systemUsers").css("display","none");
	});
	$("#inboxViewMark").click(function(){
		var messageID =  $("#markedMessageInput").val();
		var dataString = $("#markAsReadInboxView").serialize();
		$.ajax({
			url     : 'MessageController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data)
			{	
				document.getElementById("inboxViewBack").click();
				document.getElementById(messageID).classList.remove('kt-inbox__item--unread');
				var unreadCount = parseInt(document.getElementById("unreadCount").textContent) -1;
				document.getElementById("unreadCount").textContent = unreadCount;
				if(unreadCount <= 0)
					{
						$(".kt-nav__link-badge").css("display","none");
						
					}
			
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
	});

	
	$("#delFromInboxView").click(function(){
		var messageID =  $("#deletedMessageInput").val();
		var dataString = $("#deleteFromViewForm").serialize();
		console.log(dataString);
		$.ajax({
			url     : 'MessageController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data)
			{	
				
				if(document.getElementById(messageID).classList.contains("kt-inbox__item--unread"))
				{
					var unreadCount = parseInt(document.getElementById("unreadCount").textContent) -1;
					document.getElementById("unreadCount").textContent = unreadCount;
					if(unreadCount <= 0)
						{
							$(".kt-nav__link-badge").css("display","none");
							
						}
					
					
				}
				$("#"+messageID).hide();
				document.getElementById("inboxViewBack").click();
				messageDeleteSuccesInbox();
			
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
	});
	
	$(".kt-inbox__items").on('click','.kt-inbox__item',function() 
	{	
		let userRole = document.getElementById("currentUserRoleInput").value;
		let messageID = $(this).attr("id");
		document.getElementById("deletedMessageInput").value = messageID;
		document.getElementById("markedMessageInput").value = messageID;
		document.getElementsByClassName("msg-topic")[0].textContent = document.getElementById(messageID+"topic").textContent;
		document.getElementsByClassName("sender_name")[0].textContent = document.getElementById(messageID+"sender").textContent;
		document.getElementsByClassName("msgDate_")[0].textContent = document.getElementById(messageID+"createdAt").textContent;
		document.getElementsByClassName("msg_dateTime")[0].textContent = document.getElementById(messageID+"fullTime").textContent;
		if(userRole === "sender"){
			document.getElementsByClassName("msgSender_")[0].textContent = "me";
			document.getElementById("toWho").innerHTML = `from me <i
																class="flaticon2-down"></i>;`
			$("#inboxViewMark").css("display","none");													
		}
		else if(userRole === "receiver"){
			document.getElementsByClassName("msgSender_")[0].textContent = document.getElementById(messageID+"sender").textContent;
			document.getElementById("toWho").innerHTML = `to me <i
																class="flaticon2-down"></i>;`
			$("#inboxViewMark").css("display","flex");	
		}

		document.getElementsByClassName("msgSubject_")[0].textContent = document.getElementById(messageID+"topic").textContent;
		document.getElementsByClassName("msg_reply")[0].textContent = document.getElementById(messageID+"sender").textContent;
		document.getElementsByClassName("msgText_short")[0].textContent = document.getElementById(messageID+"short_").textContent;
		document.getElementsByClassName("msg_paragraph")[0].textContent = document.getElementById(messageID+"fullText").textContent;
		document.getElementsByClassName("sender_img")[0].style.backgroundImage= document.getElementById(messageID+"senderImg").style.backgroundImage;
		
		
		var elements = document.getElementsByClassName(messageID+"uploads");
		var start = ``;
		for(var i=0;i<elements.length;i++){
			var filePath = elements[i].textContent;
			var fileName = filePath.substr(17,filePath.length-1);
			var menuButton =  `<a class="dropdown-item ${messageID}Download}" href="${filePath}" download="${fileName}" data-toggle="kt-tooltip" title="" data-placement="right" data-skin="dark" data-container="body" data-original-title="Tooltip title" style="color:#191970">${fileName}</a>`
			start+= menuButton;
		}
		
		$("._msgFiles").append(start);	
		$("#reply__").val(document.getElementsByClassName("sender_name")[0].textContent);
		$("#receiverID__").val(document.getElementById("NextReceiver").textContent);
		
	});
	function addNewMessage(data){		
		let messageID = data.messageInfo.messageID;
		let userType = data.authorInfo.userType;
		let profilePictureSrc = "";
		let userFullName = data.authorInfo.fullName;
		let messageTopic = data.messageInfo.messageTopic;
		let messageText = data.messageInfo.text;
		let messageTextShort = "";
		let formattedDate = data.messageInfo.formattedDate;
		let formattedDateWithoutHours = data.messageInfo.formattedDateWithoutHours;
		
		if(messageText.lenght > 100)
		{
			messageTextShort = messageText.substr(0,100);
		}
		else
		{
			messageTextShort = messageText;
			
		}
		if(userType == 0)
		{
			profilePictureSrc = "./assets/media/users/100_5.jpg";	
		}
		else
		{
			
			profilePictureSrc = data.authorInfo.profilePictureSrc;
			
		}
		let itemText =`<div class="kt-inbox__item kt-inbox__item--unread"
							data-id="20" data-type="sent"
							id="${messageID}">
							<div class="kt-inbox__info">
								<div class="kt-inbox__actions">
									<label
										class="kt-checkbox kt-checkbox--single kt-checkbox--tick kt-checkbox--brand">
										<input type="checkbox"> <span></span>
									</label> 
									<span
										class="kt-inbox__icon kt-inbox__icon--light"
										data-toggle="kt-tooltip" data-placement="right"
										title="Your message has been delivered."> 
										<i class="flaticon2-check-mark" style="color:#D3D3D3"></i>
									</span>
								</div>
								<div class="kt-inbox__sender" data-toggle="view">
										<span
											class="kt-media kt-media--sm kt-media--brand"
											style="background-image: url('${profilePictureSrc}')"
											id="${messageID}senderImg"> <span></span>
										</span>
									<a href="#" class="kt-inbox__author"
										id="${messageID}sender">${userFullName}</a>
								</div>
							</div>
							<div class="kt-inbox__details" data-toggle="view">
								<div class="kt-inbox__message">
									<span class="kt-inbox__subject"
										id="${messageID}topic">${messageTopic}
									</span>
										<span class="kt-inbox__summary"
											id="${messageID}short_">${messageTextShort}...</span>
										<span id="${messageID}fullText"
											style="display: none; white-space: pre">
											${messageText}</span>
								</div>
							</div>
							<div class="kt-inbox__datetime"
								id="${messageID}createdAt"
								data-toggle="view">
								${formattedDateWithoutHours}</div>
							<span id="${messageID}fullTime"
								style="display: none">
								${formattedDate}</span>
						</div>`;
		
		$(".kt-inbox__items").prepend(itemText);
	}
	
	if(document.getElementById("searchBar"))
	{
		document.getElementById("searchBar").addEventListener("keyup", searchFilter);
	}

	function searchFilter()
	{
		var input = document.getElementById("searchBar");
		var normalText = input.value;
		var filter = normalText.toUpperCase();
		var container = document.getElementById("inboxItems");
		var allMessages = container.getElementsByClassName("kt-inbox__item");
		var inboxMessages = [];
		var sentMessages = [];
		var section = document.getElementById("currentUserRoleInput").value;
		var messageTopic = "";
		var person = "";
		var messageText = "";
		var messageID = "";
		var sender = "";
		var receiver = "";
		
		if(section === "receiver")
		{
			for(var i=0;i<allMessages.length;i++)
			{
				if(allMessages[i].getAttribute("data-type") === "inbox")
				{
					inboxMessages.push(allMessages[i]);
					
				}
				
			}
			for(var j=0;j<inboxMessages.length;j++)
			{
				messageID = inboxMessages[j].getAttribute("id");
				messageTopic = document.getElementById(messageID+"topic").textContent;
				messageText = document.getElementById(messageID+"short_").textContent;
				sender = document.getElementById(messageID+"sender").textContent;
				if(messageTopic.toUpperCase().indexOf(filter) <= -1 && messageText.toUpperCase().indexOf(filter) <= -1 && sender.toUpperCase().indexOf(filter) <= -1 ) 
				{
					
					inboxMessages[j].style.display = "none";
				}
				else
				{
					inboxMessages[j].style.display = "";
					
				}	
			}
		}
		else if(section === "sender"){
			for(var i=0;i<allMessages.length;i++)
			{
				if(allMessages[i].getAttribute("data-type") === "sent")
				{
					sentMessages.push(allMessages[i]);
					
				}
				
			}
			for(var j=0;j<sentMessages.length;j++)
			{
				messageID = sentMessages[j].getAttribute("id");
				messageTopic = document.getElementById(messageID+"topic").textContent;
				messageText = document.getElementById(messageID+"short_").textContent;
				receiver = document.getElementById(messageID+"sender").textContent;
				if(messageTopic.toUpperCase().indexOf(filter) <= -1 && messageText.toUpperCase().indexOf(filter) <= -1 && receiver.toUpperCase().indexOf(filter) <= -1) 
				{
					
					sentMessages[j].style.display = "none";
				}
				else
				{
					sentMessages[j].style.display = "";
					
				}	
			}

		}
	}
	
	function searchUser()
	{
		console.log("Bana girdi");
		var input = document.getElementById("receiverSelect");
		var filter = input.value.toUpperCase();
		var allUserCards = document.getElementsByClassName("tagify__dropdown__item");
		var userID = -1;
		var fullName = "";
		var userName = "";
		for(var i=0;i<allUserCards.length;i++)
		{
			
			userID = allUserCards[i].getAttribute("id");
			fullName = $("."+userID+"fullName").text();
			userName = $("."+userID+"fullName").next().text();
			if(fullName.toUpperCase().indexOf(filter) <= -1 && userName.toUpperCase().indexOf(filter) <= -1 ) 
				{
					$("#"+userID).css("display","none");
				}
			else
			{
				
					$("#"+userID).css("display","");
			}
		}
	}
	
	function calculateTotalLength()
	{
		
		var length = 0;
		for(var i=0;i<uploadedFiles.length;i++)
		{
			if(uploadedFiles[i] != ""){
				length++;
			}
			
		}
		return length;
	
	}
			
});

