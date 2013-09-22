$(document).ready(function(){
  alert('booya');
  var input = document.getElementById('places');
  var options = {
    types: ['(cities)']
  };

  autocomplete = new google.maps.places.Autocomplete(input, options);
});
