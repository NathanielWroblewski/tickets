$ ->
  $('.add-new-ticket').on 'submit', (e) ->
    e.preventDefault()
    if @.data('location')
      title = $('.add-new-ticket-title').val()
      description = $('.add-new-ticket-description').val()
      itinerary_id = $('.add-new-ticket-itinerary_id').val()

      @.find('#title')
      $.ajax
        url: '/tickets/create'
        data:
          ticket:
            title: title
            description: description
            itinerary_id: itinerary_id

