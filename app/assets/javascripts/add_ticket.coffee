$ ->
  $('.revealed-add-itinerary').hide()

  $('.reveal-add-itinerary').on 'click', ->
    $('.revealed-add-itinerary').fadeIn()

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
        console.log("hello")
        $('.my-itinerary').append "<div class='col-xs-12 itinerary-item text-center
          '> #{data.title} #{data.location}</div>"

