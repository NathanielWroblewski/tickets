$(document).ready(function() {
  $('.recommenadations-destination').on('change', function(e){
    e.preventDefault();
    $('.recommenadations-destination').val()
    $('.recommendations-need-destination').css('display','none')
  })
})
