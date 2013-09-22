$ ->
  $('.mobile-tickets').find('.itinerary-item').on 'mouseenter', ->
    $(@).animate
      opacity: 0.7

  $('.mobile-tickets').find('.itinerary-item').on 'mouseleave', ->
    $(@).animate
      opacity: 1
