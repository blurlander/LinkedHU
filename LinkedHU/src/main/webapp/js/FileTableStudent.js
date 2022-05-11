
"use strict";

// Class definition
var myKTDashboard = function() {
	// Latest Orders
	var datatableLatestOrders = function(data2) {
		if ($('#kt_datatable_latest_orders').length === 0) {
			return;
		}

		// get all files from data2 which comes from ajax and database
		// fill the json array
		var dataJSONArray = [];
		var i = 0;
		while (1) {
			if (data2[i] === undefined) {
				break;
			}
			dataJSONArray.push(data2[i]);
			i++
		}

		var datatable = $('.kt-datatable').KTDatatable({
			data: {
				type: 'local',
				source: dataJSONArray,
				pageSize: 10,
				saveState: {
					cookie: false,
					webstorage: true
				},
				serverPaging: false,
				serverFiltering: false,
				serverSorting: false
			},

			layout: {
				scroll: true,
				height: 400,
				footer: false
			},

			sortable: true,

			filterable: false,

			pagination: true,

			columns: [{
				field: "RecordID",
				title: "#",
				sortable: false,
				width: 50,
				selector: {
					class: 'kt-checkbox--solid'
				},
				textAlign: 'center'
			},
			{
				field: "Ship",
				title: "Creator",
				width: '250',
				sortabable: false,
				autoHide: false,
				// callback function support for column rendering
				template: function(data, i) {
					var number = i + 1;
					while (number > 5) {
						number = number - 3;
					}
					var output =
						`<div id="fa_fileID_${data.fileID}">
							<div class="kt-user-card-v2">
		                        <div class="kt-user-card-v2__pic">
		                            <img src="${data.uploaderProfilePicture}" alt="photo">
		                        </div>
		                        <div class="kt-user-card-v2__details">
		                            <a href="#" class="kt-user-card-v2__name">${data.uploaderName}</a>
		                            <span class="kt-user-card-v2__email">${data.uploaderEmail}</span>
	                    		</div>
                    		</div>
                    	</div>
                    
                    `;

					return output;
				}
			},
			{
				field: "ShipDate",
				title: "Date",
				width: 'auto',
				template: function(data) {
					return `<span class="kt-font-bold">${data.createdAt}</span>`;
				}
			},
			
			{
				field: "at",
				title: "File Name",
				width: 250,
				template: function(data) {
					return `<span class="kt-font-bold">${data.name}</span>`;
				}
			},
			
			{
				field: "Status",
				title: "Download",
				width: 'auto',
				// callback function support for column rendering
				template: function(row) {
					var status = {
						1: {
							'title': 'Pending',
							'class': ' btn-label-brand'
						},
						2: {
							'title': 'Processing',
							'class': ' btn-label-danger'
						},
						3: {
							'title': 'Success',
							'class': ' btn-label-success'
						},
						4: {
							'title': 'Delivered',
							'class': ' btn-label-success'
						},
						5: {
							'title': 'Canceled',
							'class': ' btn-label-warning'
						},
						6: {
							'title': 'Done',
							'class': ' btn-label-danger'
						},
						7: {
							'title': 'On Hold',
							'class': ' btn-label-warning'
						}
					};
					/*' + status[row.idInfo].class + '">' + status[row.idInfo].title + '*/
					return `<a href="${row.uploadUrl}" class="btn btn-bold btn-sm btn-font-sm btn-label-brand">Download</a>`; 
				}
			},
			
			
			{
				field: "Type",
				title: "File format",
				width: 'auto',
				// callback function support for column rendering
				template: function(data, i) {
					
					// extentiona göre burada resim bastır
					
					var output =
							`
						<div class="kt-user-card-v2">
							<div class="kt-user-card-v2__pic">
								<div class="kt-badge kt-badge--xl kt-badge--success> badge demis buraya</div>
							</div>
							<div class="kt-user-card-v2__details">
								<a href="#" class="kt-user-card-v2__name">${data.extension}</a>
								<span class="kt-user-card-v2__desc"> </span>
							</div>
						</div>`;
					

					return output;
				}
			}
			]
		});
	}

	return {
		// Init demos
		init: function() {

			// demo loading
			var loading = new KTDialog({ 'type': 'loader', 'placement': 'top center', 'message': 'Loading ...' });
			loading.show();

			$.ajax({
				type: 'post',
				url: 'FileController',
				contentType: "application/json; charset=utf-8",
				traditional: true,
				dataType: 'json',
				success: function(data) {

					console.log("ajax data:");
					console.log(data);
				
					// datatables
					datatableLatestOrders(data);
					
					// add listener to the data table delete button 
					addDeleteListener();
					
					loading.hide();
				},
				error: function(jqXHR, exception) {
					console.log('Error occured in file table !!');
					loading.hide();
				}
			});
			
			
		}
	};
}();


function addDeleteListener(){
	
	$("body").on('click','.delete-file', function() {
		
		console.log("this-id: "+$(this).attr("id"));
		
		// get file id from .delete-file dom(this)
		let fileID = $(this).attr("id").split("_")[3];
		
		//set the input value of form which is fileID in order to perform delete action in servlet
		$("#input_id_deleteFile").attr("value",fileID);
		
		var dataString = $("#form_id_deleteFile").serialize();
				
		$.ajax({
			url     : 'UserController', //Target servlet
			method     : 'POST',        // Method(always POST)
			data     : dataString,      // The data that will be sent to the servlet.
			success    : function(data,textStatus, jqXHR)
			{
				if(data.localeCompare("success-deleteFile")){					
					// find the row and hide it
					$(".kt-datatable__table").find("#fa_fileID_"+fileID).parent().parent().parent().hide(500);
				}else{
					console.log(data);
				}
				
			},
			error : function(jqXHR, exception){
				console.log('Error occured in delete file File table js!!');
			}
		});
		
	});
	
	
	
}

// Class initialization on page load
jQuery(document).ready(function() {
	console.log("yyy");
	myKTDashboard.init();
});