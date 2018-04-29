function initMap() {

  var placeName;
  var placeUrl;
  var places = [];
  var lat;
  var lng;
  var lats = [];
  var lngs = [];
  var mapFields = document.querySelectorAll('.img');
  var mapField;
  var uluru;
  

$.ajax({
    url: "/search",
    type: "GET",
    timeout: 5000,
    dataType: "json",
    error: function() {
      alert("system is gone");
    },
    success: function(data){
      for(var i = 0; i < data.length; i++) {
        placeName = data[i];
        placeUrl = "https://maps.googleapis.com/maps/api/geocode/json?address="+placeName+"&key=AIzaSyCb2tcvLbFGvlgnFTNMBczhBJsataGnlzw";
        places.push(placeUrl); 
      } 
      getPosition(places);      
    }
  })

  function getPosition(places) {

    for(var i = 0; i < places.length; i++) {
      $.ajax({
        url: places[i],
        type: "GET",
        timeout: 5000,
        dataType: "json",
        error: function(){
          alert("map position getting failed")
        },
        success: function(result){
          lat = JSON.stringify(result.results[0].geometry.location.lat);
          lng = JSON.stringify(result.results[0].geometry.location.lng);
  
          lats.push(lat);
          lngs.push(lng);
          makeMap(lats, lngs);
        }
      });  
    }
  }

  function makeMap(lats, lngs) {
    
    for(var i = 0; i < lats.length; i++) {

      uluru = {lat: parseFloat(lats[i]), lng: parseFloat(lngs[i])};
      
      mapField = mapFields[i].nextElementSibling;

      var map = new google.maps.Map(mapField, {
        zoom: 17,
        center: uluru
      });
      var marker = new google.maps.Marker({
        position: uluru,
        map: map
      });  
    }
  }

  }

