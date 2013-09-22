$(document).ready( function() {
	$('.recommendation-location').on('submit', function(e) {
		e.preventDefault();
		var destination = $('.recommendations-destination').val();
		console.log(destination)
		$.ajax({
			url: '/recommendations/simple',
			type: 'POST',
			data: { 'destination' : destination }
		}).done( function(data) { $('.content').html(data) } );
	});

});