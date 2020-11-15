<%-- 
    Document   : indexTrabajadores
    Created on : 15-nov-2020, 18:31:32
    Author     : RoyalRode
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- http://localhost:9090/ProyectoFindIt/indexTra.jsp --%>
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
         <% 
          if(session.getAttribute("errorLog")!= null){
        %>
           <script>
             alert("Error en los datos introducidos en el login por favor intentelo de nuevo.");
           </script>
        <%   }  %>
</head>
<body>
	<main id="principal" class="container-fluid p-0">
            <div id="busqueda" class="col-sm-6 offset-sm-3 text-center" style="height:85%">
			<img src="imagenes/logo.png" width="250px" height="200px">
			<p class="lead font-weight-bold">Esta usted accediendo a la parte administrativa de FIND IT</p>
			<form class="pt-3" action="LoginTra" method="post">
                            <div class="form-group">
                              <label for="correoLog" class="h4">Dirección de correo</label>
                              <input type="email" class="form-control" id="correoLogT" name="correoLogT" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="ejemplo: jchaconrodelas@findit.es" required>
                            </div>
                            <div class="form-group">
                              <label for="passLog" class="h4">Contraseña</label>
                              <input type="password" class="form-control" id="passLogT" name="passLogT" placeholder="Puede contener cualquier caracter" required>
                            </div>
                            <input type="submit" name="envio" value="Iniciar Sesion" class="btn btn-outline-dark">
                        </form>
		</div>
           </main>
        
</body>
</html>
