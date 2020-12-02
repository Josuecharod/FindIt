<%-- 
    Document   : verTodosEncargados
    Created on : 30-nov-2020, 20:51:11
    Author     : RoyalRode
--%>

<%@page import="modelo.Trabajador"%>
<%@page import="java.util.List"%>
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
                <a href="inicioTrabajadorAdmin.jsp" class="btn btn-modal">Volver Atrás</a> 
                </p>
                
            </nav>
            
            <div id="tablaTrabajadores" class="container-fluid">
                <table class="table mt-4">
                        <thead class="table-dark">
                        <tr>
                            <th> DNI </th>
                            <th> NOMBRE COMPLETO </th>
                            <th> TELEFONO </th>
                            <th> PUESTO </th>
                            <th> CORREO </th>
                            <th> <%-- Hueco para boton editar --%> </th>
                        </tr>
                        </thead>
                        <tbody>
                    <% 
                       List<Trabajador> listTra = (List<Trabajador>)session.getAttribute("listaTrabajadoresEncargados_Administracion"); 
                       for(Trabajador tr : listTra){
                    %>
                            <tr>
                            <td><%= tr.getDni() %></td>
                            <td><%= tr.getNombre() %> <%= tr.getApellidos() %></td>   
                            <td><%= tr.getTelefono() %></td>
                            <td><%= tr.getPuesto() %></td>
                            <td><%= tr.getCorreo() %></td>
                            <td><a href="editarDatosTrabajador.jsp?dni=<%= tr.getDni() %>"><i class="fa fa-edit close-modal text-dark"></i></a></td>
                            </tr>
                    <%  }%>
                        </tbody>
                        <tfoot>
                            <tr>
                              <td colspan="5"></td>
                              <td colspan="1">
                                  <a href="addTrabajador.jsp" class="btn btn-modal btn-block" role="button">Nuevo Empleado</a>
                             </td>
                            </tr>
                        </tfoot>
                    </table>
            </div>
        </main>     
    </body>
</html>