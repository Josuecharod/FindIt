<%-- 
    Document   : inicio
    Created on : 22-abr-2020, 12:20:28
    Author     : RoyalRode
--%>

<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
     <head>
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
</head>
<body>
	<main id="principal" class="container-fluid p-0">
		<nav class="navbar navbar-expand-lg navbar-light" id="barra">
		  <% Cliente clie = (Cliente)session.getAttribute("usuario"); %>
                  
                  <div class="dropdown" id="menuDesplegable">
                        <button class="btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="circle rounded-circle" style="border: 2px solid black" src="imagenes/<%=  clie.getFotoperfil() %>" height="65px" width="65px"></img>
                        </button>
                        <span class="font-weight-bold ml-1">Hola <%= clie.getNombre() %>!!!</span>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2" style="background-color: rgb(28,221,119);">
                           <a href="" class="dropdown-item text-body font-weight-bold pl-2" role="button"><i class="fa fa-plus-square pr-2"></i>Editar Foto de Perfil</a>
                          <a href="" class="dropdown-item text-body font-weight-bold pl-2" role="button"><i class="fa fa-address-card pr-2"></i>Editar Datos</a>
                          <a href="CerrarSesion" class="dropdown-item text-body font-weight-bold pl-2" role="button"><i class="fa fa-user-times pr-2"></i>Cerrar Sesion</a>
                        </div>
                      </div>
		</nav>
		
		<div id="busqueda" class="col-sm-6 offset-sm-3 text-center" style="height:85%">
			<img src="imagenes/logo.png" width="250px" height="200px">
			<p class="lead font-weight-bold">Una página única para encontrar tus objetos perdidos</p>
			<form>
			  <div class="form-row">
			    <div class="col">
			      <input type="text" class="form-control mr-2" placeholder="Nombre del objeto" id="nombreBusqueda">
			    </div>
			    <div class="col">
			      <input type="text" class="form-control mr-2" placeholder="Ciudad" id="ciudadBusqueda">
			    </div>
			    <div>
			       <button class="btn btn-outline-light" type="submit"><i class="fa fa-search"></i></button>
			    </div>
			  </div>
			</form>
			<p> <a class="btn btn-dark text-light m-4" id="formObjeto" href="FormularioObjeto">He encontrado un objeto perdido</a></p>
		</div>
                           
            <% if(session.getAttribute("verFormularioObjeto") != null){ %>
                
                <div id="insertarObjeto" class="col-sm-6 offset-sm-3 mb-3 mt-2 text-center">
                    <p class="lead font-weight-bold">Introduce los datos del objeto que has encontrado</p>        
                    <form>
                        <div class="form-row mt-2">
                            <div class="col">
                                <span class="mr-2"> ¿Qué es? </span>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control mr-2" id="nombreInserta" required>
                            </div>    
                        </div>
                        <div class="form-row mt-2">
                            <div class="col">
                                <span class="mr-2"> Descripción </span>
                            </div>
                            <div class="col">
                                <textarea id="descripcionInserta" class="mr-2" cols="45" rows="10" maxlength="200" placeholder="Describre brevemente el objeto" required></textarea>
                            </div>    
                        </div>
                        <div class="form-row mt-2">
                            <div class="col">
                                <span class="mr-2"> Imágen del objeto </span>
                            </div>
                            <div class="col">
                                <input type="file" class="mr-2" id="imagenInserta" required>
                            </div>    
                        </div>
                        <div class="form-row mt-2">
                            <div class="col">
                                <span class="mr-2"> Dirección donde lo encontraste </span>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control mr-2" id="direccionInserta" required>
                            </div>    
                        </div>
                        <div class="form-row mt-2">
                            <div class="col">
                                <input type="text" class="form-control mr-2" id="localidadInserta" placeholder="Localidad" required>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control mr-2" id="provinciaInserta" placeholder="Provincia" required>
                            </div>    
                        </div>
                        <div class="form-row mt-2">
                            <div class="col">
                                <span class="mr-2"> Local donde dejarás el objeto </span>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control mr-2" id="localInserta" required>
                            </div>    
                        </div>
                        <div class="form-row mt-2">
                           <%-- poner mapita de los locales --%>
                        </div>
                    </form>
                    <p><a class="btn btn-dark text-light m-4" id="insertObjeto" href="insertaObjeto">Insertar el objeto</a></p>
                    
                </div>
                
                <script>
                    (function(){
                        $('#insertarObjeto').focus();
                    })();
                </script>
            <% } %>  
	</main>
        
</body>
</html>
