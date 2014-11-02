$(document).on('page:change', function() {
	listenForComments()
})


function listenForComments() {
	setInterval(function() {
		var storyId = $("[data-story]").data('story')
		fetchComments(storyId, function(template) {
			$("[data-story]").replaceWith(template)
		})
	}, 10000)
}

function fetchComments(id, callback) {
  $.ajax({
    url: '/stories/' + id + '/commentsfeed',
  })
  .success(callback)
}