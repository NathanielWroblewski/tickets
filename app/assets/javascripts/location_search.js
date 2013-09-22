$(document).ready(function(){

	$('.pin-it').on('submit', function(e) {
		e.preventDefault();
		var query = $('.pin-it #location').val()
		$.ajax({
        url: '/search_query',
        type: 'POST',
        data: { query: query }
      }).done(function(data){

    });
	});

});
