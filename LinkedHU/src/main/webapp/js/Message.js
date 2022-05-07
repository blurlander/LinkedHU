"use strict";

$(document).ready(function()
{	
	$("#msgModalBtnOtherUser").click(function(){
		document.getElementById("kt_inbox_compose").style.display = "block";
	});
	$("#msgModelCloseBtn").click(function(){
		document.getElementById("kt_inbox_compose").style.display = "none";
	});
	$("#msgModalBtnInbox").click(function(){
		document.getElementById("kt_inbox_composeFromMain").style.display = "block";
	});
	$("#msgModelCloseBtnInbox").click(function(){
		document.getElementById("kt_inbox_composeFromMain").style.display = "none";
	});
	$("#msgText").click(function(){
		$("#msgText").attr('data-placeholder',"");
	});
	$("#receiverSelect").click(function(){
		$("#systemUsers").css("display","block");
		
	});
	$("#replyIcon").click(function(){
		let composeForm = document.getElementById("kt_inbox_compose_form");
		if(composeForm.style.display === "none"){
			composeForm.style.display = "flex";
		}
		else{
			composeForm.style.display = "none";
		}
	});
	
	$(".msg-PushButton").click(function(){
		var formID = $(this).next().attr("value"); 
		var dataString = $("#"+formID).serialize();
		console.log(dataString);
		$.ajax({
			url     : 'MessageController', //Target servlet
			method     : 'POST', 
			dataType : 'json',       // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data,textStatus, jqXHR)
			{	
				if(formID === "msgInfoFormProfile"){
					$(".msgSubjectArea").val("");
					$(".msgTextArea").val("");
					$("#kt_inbox_compose").css("display","none");
					messageSentSucces();
				}
				else if(formID === "msgInfoFormReply"){
					$(".replySubjectArea").val("");
					$(".replyTextArea").val("");
					messageSentSuccesInbox();
					addNewMessage(data);
					
				}
				else if(formID === "msgInfoFormInbox"){
					$(".inboxSubjectArea").val("");
					$(".inboxTextArea").val("");
					$("#kt_inbox_composeFromMain").css("display","none");
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
	
	$(".inboxBtn").click(function(){
		document.getElementById("kt_inbox_compose_form").style.display="flex";
		document.getElementById("currentUserRoleInput").value = "receiver";
	});
	
	
	$(".sentBtn").click(function(){
		document.getElementById("kt_inbox_compose_form").style.display="none";
		document.getElementById("currentUserRoleInput").value = "sender";
		
	});
	$(".kt-media-card").click(function(){
		let userID = $(this).attr("id");
		let receiverName = document.getElementsByClassName(userID+"fullName")[0].textContent;
		$("#receiverSelect").attr("value",receiverName);
		$("#receiverFromInbox").attr("value",userID);
		$("#systemUsers").css("display","none");
	});

	
	$("#delFromInboxView").click(function(){
		var messageID =  $("#deletedMessageInput").val();
		var dataString = $("#deleteFromViewForm").serialize();
		$.ajax({
			url     : 'MessageController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data)
			{	
				$("#"+messageID).hide();
				document.getElementById("inboxViewBack").click();
				messageDeleteSuccesInbox();
			
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
	});
	
	$(".kt-inbox__items").on('click','.kt-inbox__item', function() 
	{	
		let messageID = $(this).attr("id");
		document.getElementById("deletedMessageInput").value = messageID;
		document.getElementsByClassName("msg-topic")[0].textContent = document.getElementById(messageID+"topic").textContent;
		document.getElementsByClassName("sender_name")[0].textContent = document.getElementById(messageID+"sender").textContent;
		document.getElementsByClassName("msgDate_")[0].textContent = document.getElementById(messageID+"createdAt").textContent;
		document.getElementsByClassName("msg_dateTime")[0].textContent = document.getElementById(messageID+"fullTime").textContent;
		document.getElementsByClassName("msgSender_")[0].textContent = document.getElementById(messageID+"sender").textContent;
		document.getElementsByClassName("msgSubject_")[0].textContent = document.getElementById(messageID+"topic").textContent;
		document.getElementsByClassName("msg_reply")[0].textContent = document.getElementById(messageID+"sender").textContent;
		document.getElementsByClassName("msgText_short")[0].textContent = document.getElementById(messageID+"short_").textContent;
		document.getElementsByClassName("msg_paragraph")[0].textContent = document.getElementById(messageID+"fullText").textContent;
		document.getElementsByClassName("sender_img")[0].style.backgroundImage= document.getElementById(messageID+"senderImg").style.backgroundImage;
		
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
									</label> <span
										class="kt-inbox__icon kt-inbox__icon--light"
										data-toggle="kt-tooltip" data-placement="right"
										title="Star"> <i class="flaticon-star"></i>
									</span> <span
										class="kt-inbox__icon kt-inbox__icon--light"
										data-toggle="kt-tooltip" data-placement="right"
										title="Mark as important"> <i
										class="flaticon-add-label-button"></i>
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
	
	
	
	
	
});

