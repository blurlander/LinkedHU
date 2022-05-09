

$(document).ready(function(){
	
	$("#button_id_login").click(function(){
		
		var dataString = $("#form_id_login").serialize();
		
		$.ajax({
			url     : 'UserController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data,textStatus, jqXHR)
			{
					
				console.log(data);
				if(data.split("-").includes("username")){
					addUserNameWarningMessaage(0);
					return;
				}
				
				if(data.split("-").includes("email")){
					addUserNameWarningMessaage(1);
					return;
				}
				
				if(data.split("-").includes("password")){
					addUserNameWarningMessaage(2);
					return;
				}
				
				if(data.split("-").includes("blank")){
					addUserNameWarningMessaage(3);
					return;
				}
				
				if(data.split("-").includes("invalidEmail")){
					addUserNameWarningMessaage(4);
					return;
				}
				
				if(data.split("-").includes("invalidPassword")){
					addUserNameWarningMessaage(5);
					return;
				}
				console.log("gecti	");
				window.location = 'UpdateProfile.jsp';
						
			},
			error : function(jqXHR, exception){
				console.log('Error occured!!');
			}
		});
		
	});
	
	function addUserNameWarningMessaage(control){
		
		let container = $("#div_id_message_container");
		
		// username message then control = 0
		if(control == 0){
			
			let output = `
			<div class="alert alert-outline-warning fade show" role="alert">
	       		<div class="alert-icon">
	       			<i class="flaticon-warning"></i>
	       		</div>
	        	<div class="alert-text">
	        		This username is already used.
	        	</div>
	        	<div class="alert-close">
	            	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	                	<span aria-hidden="true"><i class="la la-close"></i></span>
	            	</button>
	       		</div>
			</div>
			`
			// fill the usernamme message container 
			container.html(output);
			
		}
		// if we need email message contorl = 1 
		else if(control == 1){
			
			let output = `
			<div class="alert alert-outline-warning fade show" role="alert">
            	<div class="alert-icon">
            		<i class="flaticon-warning"></i>
            	</div>
            	<div class="alert-text">This email is already used.</div>
            	<div class="alert-close">
                	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    	<span aria-hidden="true"><i class="la la-close"></i></span>
                	</button>
           		</div>
			</div>
			`
			// fill the email message container 
			container.html(output);
			
			
		}
		// if we need password confirm warning message contorl = 2 
		else if(control == 2){
			let output = `
			<div class="alert alert-outline-warning fade show" role="alert">
            	<div class="alert-icon">
            		<i class="flaticon-warning"></i>
            	</div>
            	<div class="alert-text">The passwords you entered did not match. Try again.</div>
            	<div class="alert-close">
                	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    	<span aria-hidden="true"><i class="la la-close"></i></span>
                	</button>
           		</div>
			</div>
			`
			// fill the passwrod message container 
			container.html(output);
		}
		// if there is blank
		else if(control == 3){
			let output = `
			<div class="alert alert-outline-warning fade show" role="alert">
            	<div class="alert-icon">
            		<i class="flaticon-warning"></i>
            	</div>
            	<div class="alert-text">Please fill all the blanks</div>
            	<div class="alert-close">
                	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    	<span aria-hidden="true"><i class="la la-close"></i></span>
                	</button>
           		</div>
			</div>
			`
			// fill the blank message container 
			container.html(output);
		}
		// if there is blank
		else if(control == 4){
			let output = `
			<div class="alert alert-outline-warning fade show" role="alert">
            	<div class="alert-icon">
            		<i class="flaticon-warning"></i>
            	</div>
            	<div class="alert-text">Invalid email</div>
            	<div class="alert-close">
                	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    	<span aria-hidden="true"><i class="la la-close"></i></span>
                	</button>
           		</div>
			</div>
			`
			// fill the blank message container 
			container.html(output);
		}
		
		else if(control == 5){
			let output = `
			<div class="alert alert-outline-warning fade show" role="alert">
            	<div class="alert-icon">
            		<i class="flaticon-warning"></i>
            	</div>
            	<div class="alert-text">password should be Minimum 8 character</div>
            	<div class="alert-close">
                	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    	<span aria-hidden="true"><i class="la la-close"></i></span>
                	</button>
           		</div>
			</div>
			`
			// fill the blank message container 
			container.html(output);
		}
		
	}
	
});