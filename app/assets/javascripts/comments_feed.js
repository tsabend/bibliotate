$(document).on('page:change', function() {
	if( $('[data-card=commentsfeed]').length > 0) {
		var id = ajaxInterval('commentsfeed')
	}
	else {
		clearInterval(id)
	}
	if( $('[data-card=mostcommented]').length > 0) {
		var id2 = ajaxInterval('mostcommented')
	}
	else {
		clearInterval(id2)
	}
	if( $('[data-card=activeusers]').length > 0) {
		var id3 = ajaxInterval('activeusers')
	}
	else {
		clearInterval(id3)
	}
})

// Data card should be the URL and value of the data-card attribute
function ajaxInterval(dataCard) {
	var storyId = $("[data-card='" + dataCard + "']").data('story')
	return setInterval(function(){
		fetchPartial(dataCard, storyId, function(template){
			$("[data-card='" + dataCard + "']").replaceWith(template)
			openComment()
		})
	}, 10000)
}


function fetchPartial(url, id, callback) {
	$.ajax({
	    url: '/stories/' + id + '/' + url,
	  })
	  .success(callback)
}
