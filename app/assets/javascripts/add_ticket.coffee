$ ->
  $('.add-new-ticket').on 'submit', (e) ->
    e.preventDefault()
    if $(@).find('.add-new-ticket-location').val().length > 0
      title = $('.add-new-ticket-title').val()
      description = $('.add-new-ticket-description').val()
      itinerary_id = $('.add-new-ticket-itinerary_id').val()
      location = $('.add-new-ticket-location').val()

      $.ajax
        url: '/tickets'
        type: 'POST'
        data:
          ticket:
            title: title
            description: description
            itinerary_id: itinerary_id
            location: location
      .done (data) ->
        $('.my-itinerary').append '<li>' +
          '<h1>' + data.title + '</h1>' +
          '<h3>' + data.location + '</h3>' +
          '<p>' + data.description + '</p></li>'

