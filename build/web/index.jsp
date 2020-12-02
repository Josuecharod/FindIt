<%-- 
    Document   : index
    Created on : 20-abr-2020, 10:41:35
    Author     : RoyalRode
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
     <head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="estilo/CssFalsoModal2.css">
	<script src="jquery.js"></script>
	
        <script>
		$(document).ready(function(){
                        $('#bRegistro').attr('disabled','disabled');
			$('#login').fadeOut();
                        $('#reg').fadeOut();
			$('#sombra').fadeOut();

			$('.inicio').click(function(){
				$('body').css("overflow","hidden");
				
				$('#sombra').fadeIn(1300);
				$('#sombra').css("z-index","1");

				$('#login').fadeIn(1300);
				$('#login').css("margin-left","25%");
				$('#login').css("animation","loginAnimation 0.2s linear 1s");
			});

			$('#close').click(function(){

				$('#sombra').css("z-index","-1");
				$('#sombra').fadeOut(500);

				$('#login').fadeOut(1000);
				$('#login').css("margin-left","1500px");

				setTimeout(function(){
					$('body').css("overflow","visible");
				},1000);
			});

			$('#registro').click(function(){
				$('#login').fadeOut(1000);
				$('#login').css("margin-left","1500px");

				$('#reg').fadeIn(1500);
				$('#reg').css("margin-left","25%");
				$('#reg').css("animation","RAnimation 0.2s linear 1s");
			});

			$('#close2').click(function(){
				
				$('#sombra').css("z-index","-1");
				$('#sombra').fadeOut(500);

				$('#reg').fadeOut(1000);
				$('#reg').css("margin-left","-1000px");

				setTimeout(function(){
					$('body').css("overflow","visible");
				},1000);
				
			});

		});
	</script>
        
        <% 
          if(session.getAttribute("errorLog")!= null){
        %>
           <script>
             alert("Error en los datos introducidos en el login por favor intentelo de nuevo.");
           </script>
        <%   }  %>
</head>
<body>
        <!-- Bloques invisibles de login y registro -->
	<div id="login" class="pb-2">
            <a id="close" class="m-2 pull-right"><i class="fa fa-window-close close-modal"></i></a>
		
            <div id="bLogin">
                <p class="h2">Únete para disfrutar de todas nuestras funciones</p>
                
                <form class="pt-3" action="LoginClie" method="post">
                  <div class="form-group">
                    <input type="email" class="form-control py-3" id="correoLog" name="correoLog" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Correo electrónico *" required>
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control py-3" id="passLog" name="passLog" placeholder="Contraseña *" required>
                  </div>

                  <p class="text-secondary">Al iniciar sesión, aceptas la Política de privacidad y los Términos de uso de Find It!.</p>
                  <input type="submit" name="envio" value="Iniciar Sesion" class="btn col-lg-4 offset-lg-4 btn-modal">
                </form>

                <p class="mt-2 col-lg-4 offset-lg-4 px-0">¿No eres miembro? <a id="registro" href="#">Registrate!!</a></p>
            </div>
	</div>

	<div id="reg">
            <a id="close2" class="m-2 pull-right"><i class="fa fa-window-close close-modal"></i></a>
            <div id="bLogin">
                <p class="h2">Registrate y se uno mas de FIND IT!</p>
                <form class="pt-3" action="RegistroClie" method="post">
                    <div class="row">
                        <div id="izq" class="col-6">
                            <p class="h4 text-center mb-2">Datos Personales</p>
                            <input type="text" name="nombre" class="form-control mb-2" placeholder="Nombre" required>
                            <input type="text" name="apellidos" class="form-control mb-2" placeholder="Apellidos"required>

                            <div class="form-row mb-2">
                                <div class="col">
                                  <input type="text" name="dni" class="form-control" pattern="[0-9]{8}[A-Za-z]{1}" placeholder="DNI" required> 
                                </div>
                                <div class="col">
                                  <input type="text" name="telefono" class="form-control" pattern="[0-9]{9}" placeholder="Telefono" required>
                                </div>
                            </div>

                            <input type="text" name="provincia" class="form-control mb-2" placeholder="Provincia" required>
                            <input type="text" name="localidad" class="form-control mb-2" placeholder="Localidad" required>
                            <input type="text" name="direccion" class="form-control mb-2" placeholder="Direccion" required>
                        </div>
                        <div id="derch" class="col-6">
                            <p class="h4 text-center mb-2">Datos de la Cuenta</p>
                            <input type="email" name="correo" class="form-control mb-2" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Direccion de correo" required>

                            <input type="password" name="pass" id="pass" class="form-control mb-2" placeholder="Contraseña" required>
                            <input type="password" name="pass2" id="pass2" class="form-control mb-2" placeholder="Repita la contraseña" aria-describedby="error" required>
                            <small id="error" class="form-text text-danger"></small>
                            
                            <p class="text-secondary text-center"><input type="checkbox" name="verifica" id="verifica" class="mb-2 mr-2" >He leido todo y acepto todas las condiciones</p>
                           
                            <script>
                                setInterval(comprueba, 500);
                                var coinciden = true;

                                $('#pass2').blur(function(){
                                    var p1 = $('#pass').val();
                                    var p2 = $('#pass2').val();

                                    if(!(p1 === p2)){
                                       $('#error').text("Las contraseñas no coinciden");
                                       coinciden = false;
                                    }else{
                                       $('#error').text(" ");
                                       coinciden = true;
                                    }
                                });

                                function comprueba(){
                                    if($('#verifica').prop('checked') && coinciden){
                                        $('#bRegistro').removeAttr("disabled");  
                                    }else{
                                        $('#bRegistro').attr('disabled','disabled');
                                    }
                                }
                            </script>
                        
                            <input type="submit" name="registro" id="bRegistro" value="Registrate!" class="btn btn-block btn-modal">
                        </div>
                    </div>
                </form>
            </div>
	</div>

	<!-- Fin de bloques invisibles -->
        
	<!-- Bloque para tapar la principal -->
	<div id="sombra"></div>
	
        
	<main id="principal" class="container-fluid p-0">
		<nav class="navbar navbar-expand-lg navbar-light" id="barra">
		  <button class="btn m-4 btn-modal inicio">Iniciar Sesion</button>
		</nav>
		
		<div id="busqueda" class="col-lg-6 offset-lg-3 text-center">
			<img src="imagenes/filogo1.png" width="275px" height="150px">
			<p class="lead font-weight-bold text-light mt-4">Una página única para encontrar tus objetos perdidos</p>
			<form>
			  <div class="form-row">
			    <div class="col">
			      <input type="text" class="form-control mr-2 py-4" placeholder="Nombre del objeto">
			    </div>
			    <div class="col">
			      <input type="text" class="form-control mr-2 py-4" placeholder="Localidad">
			    </div>
			    <div>
			       <a class="btn ml-1 btn-busqueda btn-modal inicio"><i class="fa fa-search text-light"></i></a>
			    </div>
			  </div>
			</form>
			<p> <a class="btn boton-oscuro text-light mt-4 inicio">He encontrado un objeto perdido</a></p>
		</div>
	</main>
        <script>
           const principal = document.getElementById("principal");
           
           window.addEventListener("scroll",function(){
              principal.style.backgroundSize = 160 - +window.pageYOffset/12+'%';
              principal.style.opacity = 1 - +window.pageYOffset/1200;
           });
        </script>
	
	<div id="informacion" class="col-sm-10 offset-sm-1 py-4 mt-5">
            <div class="form-row d-flex align-items-stretch ">
                <div class="col-12 col-md-6 p-4 fondo-texto-gris d-flex flex-column justify-content-center">
                    <p class="h2 pb-3 ">Encuentra de manera facil tu objeto</p>
                    <p>En nuestra página todo es sencillo, simplemente busca por tu zona y habla con nuestros administradores quienes te verificaran
                       cual es tu objeto y donde se encuentra a salvo</p>
                </div>
                <div class="col-12 col-md-6 d-flex justify-content-center">
                    <img src="imagenes/busquedaSencilla.png" class='imagenes-cambios'>
                </div>
            </div>
            <div class="form-row d-flex align-items-stretch flex-column-reverse flex-md-row">
                <div class="col-12 col-md-6 d-flex justify-content-center">
                    <img src="imagenes/localesRecogida.png" class='imagenes-cambios'>
                </div>
                <div class="col-12 col-md-6 fondo-texto-verde p-4 d-flex flex-column justify-content-center">
                    <p class="h2 pb-3">Locales de recogida</p>
                    <p>Tenemos asociados cientos de locales, donde podrás dejar los objetos que encuentres de manera sencilla y solo con un click</p>
                </div>
            </div>
            <div class="form-row d-flex align-items-stretch ">
                <div class="col-12 col-md-6 p-4 fondo-texto-gris d-flex flex-column justify-content-center">
                    <p class="h2 pb-3 ">Ayuda a millones de personas</p>
                    <p>Sube a nuestra página cualquier cosa que encuentres y quieras que esa persona lo recupere.</br>
                       Ayudarás a muchas personas y haz lo que te gustaría que hicieran si pierdes tu móvil, ordenador o incluso
                       un colgante que signifique mucho para ti
                    </p>
                </div>
                <div class="col-12 col-md-6 d-flex justify-content-center">
                    <img src="imagenes/personasAyuda.png" class='imagenes-cambios'>
                </div>
            </div>
            <div class="form-row d-flex align-items-stretch flex-column-reverse flex-md-row">
                <div class="col-12 col-md-6 d-flex justify-content-center">
                   <img src="imagenes/mapas.png" class='imagenes-cambios'>
                </div>
                <div class="col-12 col-md-6 fondo-texto-verde p-4 d-flex flex-column justify-content-center">
                    <p class="h2 pb-3 ">Mapas, la mejor manera de localizarte</p>
                    <p>El uso de mapas es y será la principal herramienta de esta página, cada vez añadiremos más funciones
                       y será comodísimo encontrar todo lo que necesites
                    </p>
                </div>
            </div>
            <div class="form-row d-flex align-items-stretch ">
                <div class="col-12 col-md-6 p-4 fondo-texto-gris d-flex flex-column justify-content-center">
                    <p class="h2 pb-3 p-4 ">Cambios y planes a futuro</p>
                    <p>Esta página esta pensada actualmente para el municipio de Sevilla, pero en el futuro será
                        accesible para cada vez más personas, ayudanos a conseguir que todos encuentren su objeto perdido
                    </p>
                </div>
                <div class="col-12 col-md-6 d-flex justify-content-center">
                    <img src="imagenes/cambios.png" class='imagenes-cambios'>
                </div>
            </div>
            <div class="form-row d-flex align-items-stretch flex-column-reverse flex-md-row mb-5">
                <div class="col-12 col-md-6 d-flex justify-content-center">
                    <img src="imagenes/redesSociales.png" class='imagenes-cambios'>
                    
                </div>
                <div class="col-12 col-md-6 fondo-texto-verde p-4 d-flex flex-column justify-content-center">
                    <p class="h2 pb-3">Siguenos en nuestras redes sociales</p>
                    <p>Siguenos en todas nuestras redes y enterate de las actualizaciones y ayudanos a crecer con 
                       tus opiniones ¿A qué esperas?
                    </p>
                </div>
            </div>
        </div>
        
        <footer class="font-small pt-4 ft-cuerpo mt-5">
            <!-- Footer Links -->
            <div class="container text-center text-md-left">

              <!-- Grid row -->
              <div class="row">
                <!-- Grid column -->
                <div class="col-md-4 mx-auto">
                  <!-- Content -->
                  <h5 class="font-weight-bold text-uppercase text-light mt-3 mb-4">FIND IT</h5>
                  <p class="text-light">Gracias por formar parte de Find It! Trabajamos codo a codo con Google Maps para mejorar la calidad de nuestro servicio</p>
                </div>
                <!-- Grid column -->

                <hr>

                <!-- Grid column -->
                <div class="col-md-2 mx-auto">
                  <!-- Links -->
                  <ul class="list-unstyled">
                    <li>
                      <a href="#!">CONDICIONES DE USO</a>
                    </li>
                    <li>
                      <a href="#!">POLÍTICA DE PRIVACIDAD</a>
                    </li>
                    <li>
                      <a href="#!">POLÍTICA DE COOKIES</a>
                    </li>
                  </ul>
                </div>
                <!-- Grid column -->

                <hr>

                <!-- Grid column -->
                <div class="col-md-2 mx-auto">
                  <!-- Links -->
                  <ul class="list-unstyled">
                    <li>
                      <a href="#!">CONTACTA CON NOSOTROS</a>
                    </li>
                    <li>
                      <a href="#!">SOPORTE TÉCNICO</a>
                    </li>
                    <li>
                      <a href="#!">GOOGLE MAPS</a>
                    </li>
                  </ul>
                </div>
                <!-- Grid column -->
              </div>
              <!-- Grid row -->
            </div>
            <!-- Footer Links -->

            <!-- Social buttons -->
            <ul class="list-inline text-center">
              <li class="list-inline-item">
                <a class="mx-1">
                  <i class="fa fa-facebook-f"> </i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class=" mx-1">
                  <i class="fa fa-twitter"> </i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="mx-1">
                  <i class="fa fa-google"> </i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="mx-1">
                  <i class="fa fa-linkedin"> </i>
                </a>
              </li>
            </ul>
            <!-- Social buttons -->

            <!-- Copyright -->
            <div class=" text-center py-3 ft-fin text-light"> &copy; 2020 Copyright:
              <a href="#"> FindIt.com</a>
            </div>
            <!-- Copyright -->
        </footer>

</body>
</html>
