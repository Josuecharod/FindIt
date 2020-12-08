<%-- 
    Document   : addTrabajador
    Created on : 30-nov-2020, 21:05:26
    Author     : RoyalRode
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if(!(session.getAttribute("trabajador")!= null)){
       request.getRequestDispatcher("indexTra.jsp").forward(request, response);
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
	<script src="jquery.js"></script>
</head>
<body>
	<main id="principal2" class="container-fluid p-0 d-flex justify-content-center align-items-center pt-5">
            <div id="busqueda" class="text-center container-fluid">
			<p class="lead font-weight-bold">Añade un nuevo trabajador</p>
			<form class="col-lg-8 offset-lg-2 text-center" action="addTrabajador" method="post">
                            <div class="form-row">
                            <div class="col-6">
                                <p class="text-left mb-0">Dni</p>
                                <input type="text" name="dni" class="form-control mb-2 mt-1" pattern="[0-9]{8}[A-Za-z]{1}" required>
                                <p class="text-left mb-0">Nombre</p>
                                <input type="text" name="nombre" class="form-control mb-2 mt-1"  required>
                                <p class="text-left mb-0">Apellidos</p>
                                <input type="text" name="apellidos" class="form-control mb-2 mt-1"required>
                                <p class="text-left mb-0">Telefono</p>
                                <input type="text" name="telefono" class="form-control mb-2 mt-1" pattern="[0-9]{9}" required>
                            </div>
                            <div class="col-6">                           
                                <p class="text-left mb-0">Puesto</p>
                                <select class="browser-default custom-select mb-2 mt-1" name="puesto">
                                    <option disabled selected>Eliga el puesto</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Encargado">Encargado</option>
                                  </select>
                                <p class="text-left mb-0">Correo</p>
                                <input type="text" name="correo" class="form-control mb-2 mt-1" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" required>
                                <p class="text-left mb-0">Contraseña</p>
                                 <input type="password" name="pass" class="form-control mb-2 mt-1" required>
                            </div>                    
                            </div>
                            <div class="form-row">
                                <div class="col-6">
                                    <input type="submit" name="envio" value="Añadir nuevo trabajador" class="btn btn-modal btn-block mt-4">
                                </div>
                                <div class="col-6">
                                    <a href="inicioTrabajadorAdmin.jsp" class="btn btn-modal btn-block mt-4">Cancelar</a>
                                </div>
                            </div>
                        </form>
		</div>
           </main>
        
</body>
</html>
