$( document ).ready(function() {
$(".notification").on('click', function() {
console.log("yay")
        $('ul').not($(this).children("ul")).hide();
        $(this).children("ul").toggle();
        $.ajax({
          url: '/notifications',
          type: 'POST',
        })
        .success(function() {
          console.log("success");
        });
  })
});

// "[data-note='yes']"
