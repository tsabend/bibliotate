$(document).on("page:change", function() {
  $('.sentence').on('click', function(){
    var sentence_id = $(this).data('id')
    var comment_url = "/comments-for-sentence/" + sentence_id
    console.log("Here I am ", sentence_id)
    show(comment_url)
  })
})