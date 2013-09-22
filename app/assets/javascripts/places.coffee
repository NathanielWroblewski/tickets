$ ->

  $('.pin-it').on 'keyup', ->
    search = $(@).find('#location').val()
    $.ajax
      url: '/places_api'
      type: 'POST'
      data:
        search: search
    .done ->
      alert 'booya'
