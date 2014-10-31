$(document).ready(function() {
  $("span").click(function(event){
    var sentence = $(this)
    fetchPopup(sentence.data('id'), function(template){
      console.log(template)
      sentence.prepend(template)
    })

    popupClose()
  })

})


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
