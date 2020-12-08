<%-- 
    Document   : inicio
    Created on : 22-abr-2020, 12:20:28
    Author     : RoyalRode
--%>

<%@page import="modelo.ObjetoPerdido"%>
<%@page import="java.util.List"%>
<%@page import="modelo.PuntoRecogida"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    //si no existe la session de usuario, que es con la que trabajamos en las ventanas de usuario, se vuelve para el index.jsp
    if(!(session.getAttribute("usuario")!= null)){
       request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<html lang="es">
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="estilo/CssFalsoModal2.css">
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLqgXjDUtT4tN9on-IcYYdEFa2htF5gNg" type="text/javascript"></script>
        <script src="javascriptMapas/cargaMapaLocales.js"></script>
        <script src="javascriptMapas/funcionesVarias.js"></script>
        <script src="jquery.js"></script>

</head>
<body>    
	<main id="principal" class="container-fluid p-0">
		<nav class="navbar navbar-expand-lg navbar-light d-flex justify-content-end" id="barra">
		  <% Cliente clie = (Cliente)session.getAttribute("usuario"); %>
                  
                  <div class="dropdown menud-padre" id="menuDesplegable">
                      <button class="imagen-perfil" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background:url('imagenes/<%=  clie.getFotoperfil() %>');background-size: cover;background-position:center;background-repeat: no-repeat;outline:0;"></button>
                        <div class="dropdown-menu dropdown-menu-right menu-desplegable p-0" aria-labelledby="dropdownMenu2">
                          <span class="dropdown-item font-weight-bold pl-2"><%= clie.getNombre() %> <%= clie.getApellidos() %></span>
                          <div class="dropdown-divider p-0 m-0"></div>
                          <a href="CambiarFotoAncla" class="dropdown-item pl-2" role="button">Editar Foto de Perfil</a>
                          <a href="EditarDatosAncla" class="dropdown-item pl-2" role="button">Editar Datos</a>
                          <a href="HistorialObjetosAncla" class="dropdown-item pl-2" role="button">Historial de objetos subidos</a>
                           <div class="dropdown-divider p-0 m-0"></div>
                          <a href="CerrarSesion" class="dropdown-item pl-2 last-a" role="button">Cerrar Sesion</a>
                        </div>
                      </div>
		</nav>
		
		<div id="busqueda" class="col-sm-6 offset-sm-3 text-center mb-4">
			<img src="imagenes/filogo1.png" width="275px" height="150px">
			<p class="lead font-weight-bold text-light mt-4">Una página única para encontrar tus objetos perdidos</p>
			<form action="buscarObjeto" method="post">
			  <div class="form-row">
			    <div class="col">
			      <input type="text" class="form-control mr-2 py-4" placeholder="Nombre del objeto" name="nombreBusqueda">
			    </div>
			    <div class="col">
			      <input type="text" class="form-control mr-2 py-4" placeholder="Localidad" name="localidadBusqueda">
			    </div>
			    <div>
			       <button class="btn ml-1 btn-busqueda btn-modal" type="submit"><i class="fa fa-search text-light"></i></button>
			    </div>
			  </div>
			</form>
			<p> <a class="btn boton-oscuro m-4" id="formObjeto" href="FormularioObjeto">He encontrado un objeto perdido</a></p>
		</div>
            </main>
                           
            <% if(session.getAttribute("verFormularioObjeto") != null){ %>
                <% List<PuntoRecogida> prList = (List<PuntoRecogida>)session.getAttribute("listaLocales"); %>
                
                <div id="insertarObjeto" class="col-sm-10 offset-sm-1 mb-3 mt-5 text-center">
                    <p class="lead font-weight-bold">Introduce los datos del objeto que has encontrado</p>        
                    <form action="insertaObjeto" method="post">
                      <div class="mt-2 d-flex container-fluid row">
                        <div class="d-flex flex-column col-lg-6 col-12">
                                 <p class="text-left mb-0"> ¿Qué es? </p>
                                 <input type="text" class="form-control mb-2 mt-1" id="nombreInserta" name="nombreInserta" required>
                                 <p class="text-left mb-0"> Descripción </p>
                                 <textarea id="descripcionInserta" name="descripcionInserta" class="form-control mb-2 mt-1" cols="10" rows="5" maxlength="200" placeholder="Describre brevemente el objeto" required></textarea>   
                                 <p class="text-left mb-0"> Dirección donde lo encontraste </p>
                                 <input type="text" class="form-control mb-2 mt-1" id="direccionInserta" name="direccionInserta" placeholder="Dirección" required>
                                 <input type="text" class="form-control mb-2 mt-1" id="localidadInserta" name="localidadInserta" placeholder="Localidad" required>
                                 <input type="text" class="form-control mt-1 mb-2" id="provinciaInserta" name="provinciaInserta" placeholder="Provincia" required>
                        
                        </div>
                        <div class="d-flex flex-column col-lg-6 col-12">
                            <p class="text-left mb-0"> Local donde dejarás el objeto </p>
                            <input type="text" class="form-control mb-2 mt-1" id="localInserta" name="localInserta" placeholder="Nombre del local (Ver en el marcador)" required>
                            <div id="mapaLocales">
                               
                            </div>
                            
                            <script> initMap(); </script>
                            <% for(PuntoRecogida pr : prList){ 
                                String direccion = pr.getDireccion()+" "+pr.getLocalidad()+","+pr.getProvincia();
                                String nombreLocal = pr.getNombre();
                            %>
                                <script> 
                                    getCoords('<%=nombreLocal %>','<%=direccion %>');
                                </script>
                            <% } %>
                            
                        </div>
                      </div>  
                      <div class="d-flex container-fluid row">
                        <div class="col-lg-6 col-12">
                            <input type="submit" name="envioObjeto" value="Insertar el objeto" class="btn btn-modal btn-block mt-2">
                        </div>
                        <div class="col-lg-6 col-12">
                            <a class="btn btn-modal btn-block mt-2" href="CerrarAncla">Cancelar</a>
                        </div>
                      </div>
                    </form>
                    
                </div>
                
                <script>
                    goToByScroll('insertarObjeto');
                </script>
            <% } %>
            
            <% if(session.getAttribute("verEditar") != null){ %>
                <div id="EditarDatos" class="col-md-10 offset-md-1 mb-3 mt-5 text-center">
                    <div class="py-3 px-4" style="border:1px solid rgba(0,0,0,0.2);border-radius: 10px">
                    <form action="EditarDatosClie" method="post">
                        <div class="mt-2 d-flex container-fluid row">
                            <div class="d-flex flex-column col-lg-6 col-12">
                                <p class="text-left mb-0">Nombre</p>
                                <input type="text" name="nombreEdit" class="form-control mb-2 mt-1" value="<%=clie.getNombre()%>" required>
                                <p class="text-left mb-0">Apellidos</p>
                                <input type="text" name="apellidosEdit" class="form-control mb-2 mt-1" value="<%= clie.getApellidos()%>" required>
                                <p class="text-left mb-0">Teléfono</p>
                                 <input type="text" name="telefonoEdit" class="form-control mb-2 mt-1" pattern="[0-9]{9}" value="<%= clie.getTelefono() %>" required>
                                <p class="text-left mb-0">Correo</p>
                                <input type="email" name="correoEdit" class="form-control mt-1" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" value="<%= clie.getCorreo() %>" required>
                                
                            </div>
                            <div class="d-flex flex-column col-lg-6 col-12">                           
                                <p class="text-left mb-0">Provincia</p>
                                <input type="text" name="provinciaEdit" class="form-control mb-2 mt-1" value="<%= clie.getProvincia()%>" required>
                                <p class="text-left mb-0">Localidad</p>
                                <input type="text" name="localidadEdit" class="form-control mb-2 mt-1" value="<%= clie.getLocalidad()%>" required>
                                <p class="text-left mb-0">Dirección</p>
                                <input type="text" name="direccionEdit" class="form-control mb-2 mt-1" value="<%= clie.getDireccion()%>" required>
                                <p class="text-left mb-0">Contraseña</p>
                                <input type="password" name="passEdit" class="form-control mt-1" value="<%= clie.getPass() %>" required>
                            </div>
                        </div>  
                         <div class="mt-2 d-flex container-fluid row">
                            <div class="col-lg-6 col-12">
                                <input type="submit" name="editarDatos" value="Editar Datos" class="btn btn-modal btn-block mt-2">
                            </div>
                            <div class="col-lg-6 col-12">
                                <a class="btn btn-modal btn-block mt-2" href="CerrarAncla">Cancelar</a>
                            </div>
                         </div>
                    </form>
                    </div>
                </div>
                            
                <script>
                    goToByScroll('EditarDatos');
                </script>
            <% } %>
            
            
            <% if(session.getAttribute("verSubirFoto") != null){ %>
                <div id="subirFoto" class="col-sm-8 offset-sm-2 mb-3 mt-5 text-center">
                    <p class="lead font-weight-bold">Elige tu foto de perfil y cambialo</p>  
                    <div class="py-3 px-4" style="border:1px solid rgba(0,0,0,0.2);border-radius: 10px">
                        <form action="SubirFoto" method="post" enctype="multipart/form-data">
                            <p><input type="file" name="fichero" class="mt-4"></p>
                            <p><input type="submit" name="subirFoto" value="Cambia Foto" class="btn btn-modal m-4"><a class="btn btn-modal m-4" href="CerrarAncla">Cancelar</a></p>
                        </form>
                    </div>
                </div>
                <script>
                    goToByScroll('subirFoto');
                </script>
            <% } %>
            
            <% if(session.getAttribute("verHistorialObjetos") != null){ %>
                <div id="historialObjetos" class="col-sm-10 offset-sm-1 mb-5 mt-5   text-center">
                    <% List<ObjetoPerdido> listObj = (List<ObjetoPerdido>)session.getAttribute("objetosSubidos"); 
                       if(listObj.size()!=0){ %>
                    <p class="lead font-weight-bold">Historial de objetos que has encontrado</p>
                    <p class="lead font-weight-bold">Podrás ver si por fin lo ha encontrado su dueño y subirle una foto</p>
                    <table class="table mt-4">
                        <thead style="background-color: #353449; color:#FFFFFF;">
                          <tr>
                            <th> NOMBRE </th>
                            <th> FECHA Y HORA DE SUBIDA </th>
                            <th> <%-- Hueco para boton subir foto --%> </th>
                          </tr>
                        </thead>
                        <tbody>
                    <% 
                        for(ObjetoPerdido o : listObj){
                    %>
                            <tr>
                                <td><%= o.getNombre() %></td>
                                <td><%= o.getFecha_subida() %></td>
                                <% 
                                   if(!o.getEstado()){ 
                                    if(o.getImagen().equals("objetoSinImagen.jpg")){%>
                                    <td>
                                        <form action="SubirFotoObjeto?id=<%= o.getId() %>" method="post" enctype="multipart/form-data">
                                            <input type="file" name="fotoObjeto"><input type="submit" name="cambiarFotoObjeto" value="Subir foto al objeto" class="btn btn-modal m-4">
                                        </form>
                                    </td>
                                <%}else{%>
                                    <td>
                                        <a href="imagenes/<%=o.getImagen()%>" target="_blank">Ver imágen subida del objeto</a>
                                    </td>         
                                <% } }else{ %>
                                    <td>Este objeto ha sido encontrado!!!</td> 
                                <% }%>
                            </tr>
                    <% }%>
                    </tbody>
                    </table>  
                    <% }else{ %> 
                        <div class="form-row d-flex align-items-stretch flex-column-reverse flex-md-row">
                            <div class="col-12 col-md-6 d-flex justify-content-center">
                                <img src="imagenes/sinBusqueda.png" class='imagenes-cambios'>
                            </div>
                            <div class="col-12 col-md-6 fondo-texto-verde p-4 d-flex flex-column justify-content-center">
                                <p class="h2">No ha subido ningún objeto, si encuentra algo, subalo!!!</p>
                            </div>
                        </div>
                    <% }%>
                    <p><a class="btn btn-modal btn-block mt-3" href="CerrarAncla">Cancelar</a></p>
                </div>
                <script>
                    goToByScroll('historialObjetos');
                </script>
            <% } %>
	
        
</body>
</html>
