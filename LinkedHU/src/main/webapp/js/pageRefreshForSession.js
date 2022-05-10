 $(document).ready(function(){
	
	window.addEventListener("pageshow",function(event) {
		console.log("pageShow event occur");
		var historyTraversal = event.persisted
				|| (typeof window.performance != "undefined" 
						&& window.performance.navigation.type === 2);
		console.log("historytraversal : "+historyTraversal);
		if (historyTraversal) {
			// Handle page restore.
			window.location.reload();
		}
	});
	
});