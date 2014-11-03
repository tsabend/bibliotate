$(document).on('page:change', function() {
	if( $('[data-card]').length > 0) {
		listenForRecentComments()
		listenForMostCommented()
		listenForActiveUsers
	}
})


function listenForRecentComments() {
	setInterval(function() {
		var storyId = $("[data-card='commentsfeed']").data('story')
		fetchComments(storyId, function(template) {
			$("[data-card='commentsfeed']").replaceWith(template)
		})
	}, 10000)
}

function fetchComments(id, callback) {
  $.ajax({
    url: '/stories/' + id + '/commentsfeed',
  })
  .success(callback)
}

function listenForMostCommented() {
	setInterval(function() {
		var storyId = $("[data-card='mostcommented']").data('story')
		fetchMostCommented(storyId, function(template) {
			$("[data-card='mostcommented']").replaceWith(template)
		})
	}, 10000)
}

function fetchMostCommented(id, callback) {
  $.ajax({
    url: '/stories/' + id + '/mostcommented',
  })
  .success(callback)
}

function listenForActiveUsers() {
	setInterval(function() {
		var storyId = $("[data-card='ActiveUsers']").data('story')
		fetchActiveUsers(storyId, function(template) {
			$("[data-card='ActiveUsers']").replaceWith(template)
		})
	}, 10000)
}

function fetchActiveUsers(id, callback) {
  $.ajax({
    url: '/stories/' + id + '/ActiveUsers',
  })
  .success(callback)
}
