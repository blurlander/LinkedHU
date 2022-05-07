


 $(document).ready(function(){
	
	$("#sb_profile_picture").click(function(){
		var name = $(this).next();
		$(this).next().next().toggle(100 ,function(){
			name.toggle(100);
		});
	});
	
	
});