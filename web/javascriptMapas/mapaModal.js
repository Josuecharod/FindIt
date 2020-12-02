/* global google, address, maker */
var mapa = null;
var marker = null;

function MapaConPunto(address){
 var geocoder = new google.maps.Geocoder();
 if(address !==''){
    // Llamamos a la función geodecode pasandole la dirección que hemos introducido en la caja de texto.
    geocoder.geocode({ 'address': address}, function(results, status){
     if (status === 'OK')
     {       
            mapa = new google.maps.Map(document.getElementById("verMapaModal"), {
              center: {lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()},
              scrollwheel: false,
              zoom: 18,
              zoomControl: true,
              rotateControl : false,
              streetViewControl: true,
              mapTypeId:google.maps.MapTypeId.ROADMAP
            });
            
           // Posicionamos el marcador en las coordenadas obtenidas
           var marker = new google.maps.Marker({ position:results[0].geometry.location, 
                                                 map:mapa, 
                                                 title:"Aqui se encontró el objeto",
                                                 icon: { url: "http://josuecharod.es.mialias.net/imagen/marker.png", scaledSize: new google.maps.Size(85, 85)}
                
                                               });
      }
    });
  }
 }

