$ ->
  $('.add-new-ticket').on 'submit', (e) ->
    e.preventDefault()
    if @.data('location')
      title = $('.add-new-ticket-title').val()
      description = $('.add-new-ticket-description').val()
      @.find('#title')
      $.ajax
        url: '/tickets/create'
        data:
          ticket:
            title: title
            description: description

