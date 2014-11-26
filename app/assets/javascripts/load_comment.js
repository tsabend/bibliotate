$(document).on("page:change", function() {
  $('.sentence').on('click', function(){
    $('#popup').remove()
    var sentence_id = $(this).data('id')
    var comment_url = "/comments-for-sentence/" + sentence_id
    console.log("Here I am ", sentence_id)

    $('body').prepend('<div id="popup"></div>')
    $('body').prepend('<div id="user-list"></div>')
    show(comment_url)
    
    var users_url = "/users-for-comments/" + sentence_id
    // showUsers(users_url)
    popupClose()
  })
})



function popupClose() {
  $(document).on('keyup', function(key){
    if(key.keyCode === 27) {
      hide()
      $('#popup').remove()
    }
  })
  $('[data-comment="remove"]').on('click', function(){
    $('#popup').remove()
  })
}