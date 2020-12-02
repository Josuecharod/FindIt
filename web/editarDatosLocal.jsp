<%-- 
    Document   : editarDatosLocal
    Created on : 29-nov-2020, 13:12:01
    Author     : RoyalRode
--%>

<%@page import="controlador.Conexion"%>
<%@page import="modelo.PuntoRecogida"%>
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
</head>
<body>
	<main id="principal2" class="container-fluid p-0 d-flex justify-content-center align-items-center">
            <div id="busqueda" class="text-center ">
                        <% 
                            int id = Integer.parseInt(request.getParameter("id"));
                            PuntoRecogida pr = Conexion.TraerLocalPorID(id);      
                        %>
			<p class="lead font-weight-bold">Editar los datos del encargado seleccionado: </p>
			<form class="col-lg-10 offset-lg-1 text-center" action="EditarDatosLocal?id=<%= id %>" method="post">
                            <div class="form-row">
                            <div class="col-6">
                                <p>Nombre Local</p>
                                <input type="text" name="nombreEdit" class="form-control mb-2" value="<%= pr.getNombre()%>" required>
                                <p>Nombre Persona Responsable</p>
                                <input type="text" name="nombrePersonaEdit" class="form-control mb-2" value="<%= pr.getPersona_contacto() %>" required>
                                <p>Telefono</p>
                                 <input type="text" name="telefonoEdit" class="form-control" pattern="[0-9]{9}" value="<%= pr.getTelefono() %>" required>
                            </div>
                            <div class="col-6">                           
                                <p>Direccion</p>
                                <input type="text" name="direccionEdit" class="form-control mb-2" value="<%= pr.getDireccion() %>" required>
                                <p>Localidad</p>
                                <input type="text" name="localidadEdit" class="form-control mb-2" value="<%= pr.getLocalidad() %>" required>
                                <p>Provincia</p>
                                 <input type="text" name="provinciaEdit" class="form-control" value="<%= pr.getProvincia() %>" required>
                            </div>                    
                            <p><input type="submit" name="envio" value="Añadir" class="btn m-4 btn-modal inicio"><a href="inicioTrabajadorAdmin.jsp" class="btn btn-modal inicio">Cancelar</a></p>
                            </div>
                        </form>
		</div>
           </main>
        
</body>
</html>
