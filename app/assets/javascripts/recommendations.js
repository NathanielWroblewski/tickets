$(document).ready(function() {
  
  $('.recommenadations-destination').on('change', function(e){
    e.preventDefault();
    var destination = $('.recommenadations-destination').val()
    $.ajax({
      url: '/recommendations/search',
      type: 'POST',
      dataType: 'json',
      data: destination
    }).done(function(data){
      console.log(data)
    });
  });

})
