
/* global google, address, maker */
var mapa = null;
var marker = null;

function initMap(){
 // Creamos un objeto mapa y especificamos el elemento DOM donde se va a mostrar.
 // console.log(document.getElementById("mapaLocales"));
 mapa = new google.maps.Map(document.getElementById("mapaLocales"), {
   center: {lat: 37.3753501, lng: -6.0250983},
   scrollwheel: false,
   zoom: 12,
   zoomControl: true,
   rotateControl : false,
   streetViewControl: true,
   mapTypeId:google.maps.MapTypeId.ROADMAP
 });
 }

 function getCoords(nombre,address){

 // Creamos el objeto geodecoder
 var geocoder = new google.maps.Geocoder();
 
 if(address !==''){
    // Llamamos a la función geodecode pasandole la dirección que hemos introducido en la caja de texto.
   geocoder.geocode({ 'address': address}, function(results, status){
     if (status === 'OK')
     {       
        // Posicionamos el marcador en las coordenadas obtenidas
           var marker = new google.maps.Marker({ position:results[0].geometry.location , map:mapa, title:nombre,icon: { url: "http://josuecharod.es.mialias.net/imagen/marker.png", scaledSize: new google.maps.Size(70, 70)}});
          
            google.maps.event.addListener(marker,'click',function(){
               document.getElementById("localInserta").value = "";
               document.getElementById("localInserta").value = marker.getTitle();
           });       
     }
    });
  }
 }
 

 
 

 


