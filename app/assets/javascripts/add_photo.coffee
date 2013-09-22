$ -> 
	$('.photo-uploader').on 'submit', (e) ->
		e.preventDefault()
		
		$.ajax
				url: '/photo_upload'
				type: 'POST'
				data: 