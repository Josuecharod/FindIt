<%-- 
    Document   : index
    Created on : 20-abr-2020, 10:41:35
    Author     : RoyalRode
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
     <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="estilo/CssFalsoModal2.css">
	<script src="jquery.js"></script>
	
        <script>
		$(document).ready(function(){
			$('#login').fadeOut();
			$('#sombra').fadeOut();

			$('#inicio').click(function(){
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
</head>
<body>
	<!-- Bloques invisibles de login y registro -->
	<div id="login">
		<a id="close" class="text-light	m-2 pull-right"><i class="fa fa-window-close icono"></i></a>
		
		<div id="bLogin">
			<p class="h2 text-center">Unete para disfrutar de todas nuestras funciones</p>
			<form class="pt-3">
			  <div class="form-group">
			    <label for="correo" class="h4">Dirección de correo</label>
			    <input type="email" class="form-control" id="correo" name="correo" aria-describedby="error1">
			    <!-- <small id="error1" class="form-text text-danger">Este campo es obligatorio</small> -->
			  </div>
			  <div class="form-group">
			    <label for="pass" class="h4">Contraseña</label>
			    <input type="password" class="form-control" id="pass" name="pass" placeholder="Puede contener cualquier caracter" aria-describedby="error2">
			    <!-- <small id="error2" class="form-text text-danger">Este campo es obligatorio</small> -->
			  </div>
			  
			  <p class="text-secondary">Al iniciar sesión, aceptas la Política de privacidad y los Términos de uso de Find It!.</p>
			  <input type="submit" name="envio" value="Iniciar Sesion" class="btn btn-outline-light col-sm-6 offset-sm-3">
			</form>
			
			<p class="mt-2 col-md-6 offset-md-3"> ¿No eres miembro? <a id="registro" href="#">Registrate!!</a></p>
		</div>
	</div>

	<div id="reg">
		<a id="close2" class="text-light m-2 pull-right"><i class="fa fa-window-close icono"></i></a>
		<div id="bLogin">
			<p class="h2 text-center">Registrate y se uno mas de FIND IT!</p>
			<form class="pt-3">
				<div class="row">
					<div id="izq" class="col-6">
						<p class="h4 text-center mb-2">Datos Personales</p>
						<input type="text" name="nombre" class="form-control mb-2" placeholder="Nombre">
						<input type="text" name="apellidos" class="form-control mb-2" placeholder="Apellidos">

						<div class="form-row mb-2">
						    <div class="col">
						      <input type="text" class="form-control" placeholder="DNI">
						    </div>
						    <div class="col">
						      <input type="number" class="form-control" placeholder="Telefono">
						    </div>
					    </div>

						<input type="text" name="provincia" class="form-control mb-2" placeholder="Provincia">
						<input type="text" name="localidad" class="form-control mb-2" placeholder="Localidad">
						<input type="text" name="direccion" class="form-control mb-2" placeholder="Direccion">
					</div>
					<div id="derch" class="col-6">
						<p class="h4 text-center mb-2">Datos de la Cuenta</p>
						<input type="email" name="correo" class="form-control mb-2" placeholder="Direccion de correo">
						
						<input type="password" name="pass" class="form-control mb-2" placeholder="Contraseña">
						<input type="password" name="pass2" class="form-control mb-2" placeholder="Repita la contraseña">

						<p class="text-secondary text-center"><input type="checkbox" name="verifica" class="mb-2 mr-2">He leido todo y acepto todas las condiciones</p>
						<input type="submit" name="registro" value="Registrate!" class="btn btn-outline-light btn-block">
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
		  <button class="btn btn-outline-light m-4" id="inicio">Iniciar Sesion</button>
		</nav>
		
		<div id="busqueda" class="col-sm-6 offset-sm-3 text-center">
			<img src="imagenes/logo.png" width="250px" height="200px">
			<p class="lead font-weight-bold">Una página única para encontrar tus objetos perdidos</p>
			<form>
			  <div class="form-row">
			    <div class="col">
			      <input type="text" class="form-control mr-2" placeholder="Nombre del objeto">
			    </div>
			    <div class="col">
			      <input type="text" class="form-control mr-2" placeholder="Ciudad">
			    </div>
			    <div>
			       <button class="btn btn-outline-light" type="submit"><i class="fa fa-search"></i></button>
			    </div>
			  </div>
			</form>
			<p> <a class="btn btn-dark text-light m-4" id="inicio">He encontrado un objeto perdido</a></p>
		</div>

	</main>
	
	<div id="informacion" class="col-sm-8 offset-sm-2 p-0 mt-3">
		<h2>Categorias</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet voluptatibus voluptate excepturi delectus eligendi esse quasi maiores assumenda qui odit eum incidunt asperiores vitae commodi quidem neque, consequuntur, sit officiis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab libero minima illo pariatur. Veniam harum autem iste, fugiat aliquam rerum corporis excepturi dignissimos nulla eaque aliquid ullam impedit vitae ad.</p>
	</div>

</body>
</html>
