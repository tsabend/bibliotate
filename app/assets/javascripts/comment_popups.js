$(document).ready(function() {
  $(".sentence").click(function(event){
    var sentence = $(this)
    fetchPopup(sentence.data('id'), function(template){
      sentence.after(template)
      listenForComment()
    })
    popupClose()
  })

})
function listenForComment() {
  $(".comment_form").submit(function(e){
    e.preventDefault()
    console.log($(this).serialize())
    submitComment($(this).serialize())
    $(this).parent().remove()
  })
}


function submitComment(args) {
  $.ajax({
    url: '/comments',
    type: 'POST',
    data: args
  })
  .done(function(template) {
    console.log("success");
    console.log(template);
  })

}

function fetchPopup(id, callback) {
  $.ajax({
    url: '/comments/' + id,
  })
  .success(callback)
}

function popupClose() {
  $(document).on('keyup', function(key){
    if(key.keyCode === 27) {
      $('.popup').remove()
    }
  })
}
