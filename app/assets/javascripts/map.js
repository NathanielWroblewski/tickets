$(document).ready(function(){

  if ($('#map').length > 0) {
    var latitude  = 25.2000;
    var longitude = 55.3000;

    var map = L.map('map').setView([25.2000, 55.3000], 11);

    L.tileLayer('http://{s}.tile.cloudmade.com/26d0b59d4044441e8bb7ebecb61a875f/997/256/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18
    }).addTo(map);

// add a marker in the given location, attach some popup content to it and open the popup
    var marker;

    marker = L.marker([25.2000, 55.3000]);

    marker.addTo(map).bindPopup('Drag Me!').openPopup();

    marker.dragging.enable();

    marker.on('dragend', function(e){
      var latitude = marker.getLatLng().lat;
      var longitude = marker.getLatLng().lng;
      $.ajax({
        url: '/save_lat_long',
        type: 'POST',
        data: { lat: latitude, long: longitude }
      }).done(function(data){
        $('.add-new-ticket-location').val(data.city + ', ' + data.region)
      });
    });

    function search() {
      var query = $('.pin-it #location').val()
      $.ajax({
        url: '/search_query',
        type: 'POST',
        data: { query: query }
      }).done(function(data){
        var locLatitude = parseFloat(data.latitude);
        var locLongitude = parseFloat(data.longitude);
        map.removeLayer(marker);
        map.setView([locLatitude, locLongitude], 11);
        marker = L.marker([locLatitude, locLongitude]);
        marker.addTo(map);
        marker.dragging.enable();
      });
    }

    $('.search-text').on('keyup', function(){
      $.debounce( 250, search )
    });


  }
  if (Modernizr.mq('only screen and (max-width: 768px)') ){
    $("#map").prependTo('.modal-body');
    console.log($("#map"))
    console.log("hello")
  }
});
