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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLqgXjDUtT4tN9on-IcYYdEFa2htF5gNg" type="text/javascript"></script>
        <script src="javascriptMapas/cargaMapaLocales.js"></script>
        <script src="javascriptMapas/funcionesVarias.js"></script>
        <script src="jquery.js"></script>
        <% 
          if(session.getAttribute("ObjetoCreado")!= null){
        %>
           <script>
             alert("Objeto creado correctamente, deberá subirle una foto siguiendo los siguientes pasos \n\ Click en su foto > historial de objetos subidos > subir foto del objeto encontrado ");
           </script>
        <%   }  %>

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
                      <div class="form-row mt-2">
                        <div class="col">
                            <div class="form-row mt-2">
                                <div class="col">
                                    <span class="mr-2"> ¿Qué es? </span>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control mr-2" id="nombreInserta" name="nombreInserta" required>
                                </div>    
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <span class="mr-2"> Descripción </span>
                                </div>
                                <div class="col">
                                    <textarea id="descripcionInserta" name="descripcionInserta" class="mr-2" cols="45" rows="10" maxlength="200" placeholder="Describre brevemente el objeto" required></textarea>
                                </div>    
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <span class="mr-2"> Dirección donde lo encontraste </span>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control mr-2" id="direccionInserta" name="direccionInserta" required>
                                </div>    
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <input type="text" class="form-control mr-2" id="localidadInserta" name="localidadInserta" placeholder="Localidad" required>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control mr-2" id="provinciaInserta" name="provinciaInserta" placeholder="Provincia" required>
                                </div>    
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-row mt-2">
                                <div class="col">
                                    <span class="mr-2"> Local donde dejarás el objeto </span>
                                </div>
                                
                                <div class="col">
                                    <input type="text" class="form-control mr-2" id="localInserta" name="localInserta" placeholder="Nombre del local (Ver en el marcador)" required>
                                </div>    
                               
                             </div>
                            
                            <div id="mapaLocales" class="ml-4 mt-4">
                               
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
                     <p> <input type="submit" name="envioObjeto" value="Insertar el objeto" class="btn btn-dark text-light m-4"><a class="btn btn-dark text-light m-4" href="CerrarAncla">Cancelar</a></p>
                    
                    </form>
                    
                </div>
                
                <script>
                    goToByScroll('insertarObjeto');
                </script>
            <% } %>
            
            <% if(session.getAttribute("verEditar") != null){ %>
                <div id="EditarDatos" class="col-sm-10 offset-sm-1 mb-3 mt-5 text-center">
                    <p class="lead font-weight-bold">Edita tus datos</p>  
                    <form action="EditarDatosClie" method="post">
                        <div class="form-row">
                            <div class="col-6">
                                <p>Nombre</p>
                                <input type="text" name="nombreEdit" class="form-control mb-2" value="<%=clie.getNombre()%>" required>
                                <p>Apellidos</p>
                                <input type="text" name="apellidosEdit" class="form-control mb-2" value="<%= clie.getApellidos()%>" required>
                                <p>Telefono</p>
                                 <input type="text" name="telefonoEdit" class="form-control" pattern="[0-9]{9}" value="<%= clie.getTelefono() %>" required>
                            </div>
                            <div class="col-6">                           
                                <p>Provincia</p>
                                <input type="text" name="provinciaEdit" class="form-control mb-2" value="<%= clie.getProvincia()%>" required>
                                <p>Localidad</p>
                                <input type="text" name="localidadEdit" class="form-control mb-2" value="<%= clie.getLocalidad()%>" required>
                                <p>Direccion</p>
                                <input type="text" name="direccionEdit" class="form-control mb-2" value="<%= clie.getDireccion()%>" required>
                            </div>
                        </div>  
                        <p><input type="submit" name="editarDatos" value="Editar Datos" class="btn btn-dark text-light m-4"><a class="btn btn-dark text-light m-4" href="CerrarAncla">Cancelar</a></p>
                    </form>
                </div>
                            
                <script>
                    goToByScroll('EditarDatos');
                </script>
            <% } %>
            
            
            <% if(session.getAttribute("verSubirFoto") != null){ %>
                <div id="subirFoto" class="col-sm-10 offset-sm-1 mb-3 mt-5 text-center">
                    <p class="lead font-weight-bold">Elige tu foto de perfil y cambialo</p>  
                    <form action="SubirFoto" method="post" enctype="multipart/form-data">
                        <p><input type="file" name="fichero"></p>
                        <p><input type="submit" name="subirFoto" value="Cambia Foto" class="btn btn-dark text-light m-4"><a class="btn btn-dark text-light m-4" href="CerrarAncla">Cancelar</a></p>
                    </form>
                </div>
                <script>
                    goToByScroll('subirFoto');
                </script>
            <% } %>
            
            <% if(session.getAttribute("verHistorialObjetos") != null){ %>
                <div id="historialObjetos" class="col-sm-10 offset-sm-1 mb-3 mt-5 text-center">
                    <p class="lead font-weight-bold">Historial de objetos que has encontrado</p>
                    <p class="lead font-weight-bold">Podrás ver si por fin lo ha encontrado su dueño y subirle una foto</p>
                    <table class="col-12">
                        <tr>
                            <th> NOMBRE </th>
                            <th> FECHA Y HORA DE SUBIDA </th>
                            <th> ESTADO </th>
                            <th> <%-- Hueco para boton subir foto --%> </th>
                        </tr>
                    <% List<ObjetoPerdido> listObj = (List<ObjetoPerdido>)session.getAttribute("objetosSubidos"); 
                       for(ObjetoPerdido o : listObj){
                    %>
                            <tr>
                                <td><%= o.getNombre() %></td>
                                <td><%= o.getFecha_subida() %></td>
                                <td><%= o.getEstado()%></td>
                                <% if(o.getImagen().equals("objetoSinImagen.jpg")){%>
                                    <td>
                                        <form action="SubirFotoObjeto?id=<%= o.getId() %>" method="post" enctype="multipart/form-data">
                                            <input type="file" name="fotoObjeto"><input type="submit" name="cambiarFotoObjeto" value="Subir foto al objeto" class="btn btn-dark text-light m-4">
                                        </form>
                                    </td>
                                <%}else{%>
                                    <td>
                                        <a href="imagenes/<%=o.getImagen()%>">Ver imágen subida del objeto</a>
                                    </td>         
                                <% } %>
                            </tr>
                    <% } %>
                    </table>
                    
                    
                    <p><a class="btn btn-dark text-light m-4" href="CerrarAncla">Cancelar</a></p>
                </div>
                <script>
                    goToByScroll('historialObjetos');
                </script>
            <% } %>
	
        
</body>
</html>
