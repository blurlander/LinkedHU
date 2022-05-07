
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
				height: 500,
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
				width: 'auto',
				sortabable: false,
				autoHide: false,
				// callback function support for column rendering
				template: function(data, i) {
					var number = i + 1;
					while (number > 5) {
						number = number - 3;
					}
					var output =
						`<div class="kt-user-card-v2">
                        <div class="kt-user-card-v2__pic">
                            <img src="./ProfilePictures/123.jpg" alt="photo">
                        </div>
                        <div class="kt-user-card-v2__details">
                            <a href="#" class="kt-user-card-v2__name"> name of instructor </a>
                            <span class="kt-user-card-v2__email">email gelecek yada skill felan</span>
                        </div>
                    </div>`;

					return output;
				}
			},
			{
				field: "ShipDate",
				title: "File Name",
				width: 200,
				template: function(data) {
					return `<span class="kt-font-bold">${data.name}</span>`;
				}
			},
			{
				field: "Status",
				title: "Download",
				width: 300,
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
					return `<a href="${row.uploadUrl}" class="btn btn-bold btn-sm btn-font-sm btn-label-brand">indir</a>`; 
				}
			},
			
			
			{
				field: "Type",
				title: "File format",
				width: 200,
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
								<a href="#" class="kt-user-card-v2__name">a tagi</a>
								<span class="kt-user-card-v2__desc"> </span>
							</div>
						</div>`;
					

					return output;
				}
			},
			{
				field: "Actions",
				width: 80,
				title: "Actions",
				sortable: false,
				autoHide: false,
				overflow: 'visible',
				template: function() {
					return '\
                        <div class="dropdown">\
                            <a href="javascript:;" class="btn btn-sm btn-clean btn-icon btn-icon-md" data-toggle="dropdown">\
                                <i class="flaticon-more-1"></i>\
                            </a>\
                            <div class="dropdown-menu dropdown-menu-right">\
                                <ul class="kt-nav">\
                                    <li class="kt-nav__item">\
                                        <a href="#" class="kt-nav__link">\
                                            <i class="kt-nav__link-icon flaticon2-expand"></i>\
                                            <span class="kt-nav__link-text">View</span>\
                                        </a>\
                                    </li>\
                                    <li class="kt-nav__item">\
                                        <a href="#" class="kt-nav__link">\
                                            <i class="kt-nav__link-icon flaticon2-contract"></i>\
                                            <span class="kt-nav__link-text">Edit</span>\
                                        </a>\
                                    </li>\
                                    <li class="kt-nav__item">\
                                        <a href="#" class="kt-nav__link">\
                                            <i class="kt-nav__link-icon flaticon2-trash"></i>\
                                            <span class="kt-nav__link-text">Delete</span>\
                                        </a>\
                                    </li>\
                                    <li class="kt-nav__item">\
                                        <a href="#" class="kt-nav__link">\
                                            <i class="kt-nav__link-icon flaticon2-mail-1"></i>\
                                            <span class="kt-nav__link-text">Export</span>\
                                        </a>\
                                    </li>\
                                </ul>\
                            </div>\
                        </div>\
                    ';
				}
			}]
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

// Class initialization on page load
jQuery(document).ready(function() {
	console.log("yyy");
	myKTDashboard.init();
});