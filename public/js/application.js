$(document).ready(function() {

    $('#search-form').on('submit', function(e){
      e.preventDefault();
      console.log('hello');
      var text = $(this).serialize();

      $.ajax({
        url: "/recipes",
        type: "POST",
        data: text
      }).done(function(data){
        $('#search-form').trigger('reset');
        $('#recipe-display').empty();
        $('#recipe-display').append(data);
      })

    })

});
