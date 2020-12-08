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
         <% 
          if(session.getAttribute("errorLog")!= null){
        %>
           <script>
             alert("Error en los datos introducidos en el login por favor intentelo de nuevo.");
           </script>
        <%   }  %>
</head>
<body>
        <nav id="nav-index-admin" class="navbar navbar-expand-lg d-flex justify-content-end p-2 m-0 ">
            <a class="btn boton-oscuro" href="index.jsp">Ve a la parte del usuario</a>
        </nav>
	<main id="principal2" class="container-fluid p-0 d-flex justify-content-center align-items-center">    
            <div id="busqueda" class="text-center ">
			<p class="lead font-weight-bold">Esta usted accediendo a la parte administrativa de FIND IT</p>
			<form class="col-sm-8 offset-sm-2 text-center" action="LoginTra" method="post">
                            <div class="form-group">
                              <label for="correoLogT" class="h4">Dirección de correo</label>
                              <input type="email" class="form-control py-4" id="correoLogT" name="correoLogT" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="ejemplo: jchaconrodelas@findit.es" required>
                            </div>
                            <div class="form-group">
                              <label for="passLogT" class="h4">Contraseña</label>
                              <input type="password" class="form-control py-4" id="passLogT" name="passLogT" placeholder="Puede contener cualquier caracter" required>
                            </div>
                            <input type="submit" name="envio" value="Iniciar Sesion" class="btn btn-modal btn-block">
                        </form>
		</div>
           </main>
        
</body>
</html>
