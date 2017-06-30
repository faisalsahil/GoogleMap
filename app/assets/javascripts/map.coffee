jQuery ->
  window.initMap = ->
  if $('#map').size() > 0
    map = new google.maps.Map $('#map') document.getElementById('map'), {
      center: {lat: -34.397, lng: 150.644}
      zoom: 8
    }

  lat_field = $('#place_latitude')
lng_field = $('#place_longitude')

window.initMap = ->
  map.addListener 'click', (e) ->
    updateFields e.latLng

updateFields = (latLng) ->
  lat_field.val latLng.lat()
  lng_field.val latLng.lng()


markersArray = []
window.initMap = ->
  map.addListener 'click', (e) ->
    placeMarkerAndPanTo e.latLng, map
    updateFields e.latLng

placeMarkerAndPanTo = (latLng, map) ->
  markersArray.pop().setMap(null) while(markersArray.length)
  marker = new google.maps.Marker
    position: latLng
    map: map

  map.panTo latLng
  markersArray.push marker


window.initMap = ->
  $('#find-on-map').click (e) ->
    e.preventDefault()
    placeMarkerAndPanTo {
      lat: parseInt lat_field.val(), 10
      lng: parseInt lng_field.val(), 10
    }, map
