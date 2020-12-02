<%-- 
    Document   : inicioTrabajadorEncar
    Created on : 01-dic-2020, 20:41:00
    Author     : RoyalRode
--%>

<%@page import="modelo.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <main id="principal-administrador" class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg navbar-light nav-admin d-flex justify-content-start" id="barra">
                <% Trabajador tra = (Trabajador)session.getAttribute("trabajador"); %>
                <p class="col-sm-12 text-center text-muted">Está usted en el apartado de los encargados loggeado como : <%=tra.getCorreo()%> 
                <a href="CerrarSesion" class="font-weight-bold pl-2"><i class="fa fa-user-times close-modal"></i></a>
                </p>
                
            </nav>
            
            <div  class="container-fluid">
                <table class="table mt-4">
                        <thead class="table-dark">
                        <tr>
                            <th> </th>
                            <th> </th>
                            <th> </th>
                            <th> </th>
                            <th> <%-- Hueco para boton editar --%> </th>
                        </tr>
                        </thead>
                        <tbody>
                    <% 

                    %>
                            <tr>
                            <td><</td>   
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            </tr>
                    <%  } %>   
                        </tbody>
                    </table>
            </div>
        </main>
    </body>
</html>
