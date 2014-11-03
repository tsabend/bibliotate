$(document).on('page:change', function() {
	if( $('[data-card]').length > 0) {
		ajaxInteveral('commentsfeed')
		ajaxInteveral('mostcommented')
		ajaxInteveral('activeusers')
	}
})

// Data card should be the URL and value of the data-card attribute
function ajaxInteveral(dataCard) {
	var storyId = $("[data-card='" + dataCard + "']").data('story')
	setInterval(function(){
		fetchPartial(dataCard, storyId, function(template){
			$("[data-card='" + dataCard + "']").replaceWith(template)
		})
	}, 10000)
}


function fetchPartial(url, id, callback) {
	$.ajax({
	    url: '/stories/' + id + '/' + url,
	  })
	  .success(callback)	
}
