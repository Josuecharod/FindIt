<%-- 
    Document   : verTodosLocales
    Created on : 30-nov-2020, 20:44:12
    Author     : RoyalRode
--%>

<%@page import="modelo.PuntoRecogida"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if(!(session.getAttribute("trabajador")!= null)){
       request.getRequestDispatcher("indexTra.jsp").forward(request, response);
    }
%>
<html>
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
        <main id="principal-administrador" class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg navbar-light nav-admin d-flex justify-content-start" id="barra">
                <a href="inicioTrabajadorAdmin.jsp" class="btn btn-modal">Volver Atrás</a> 
                </p>
                
            </nav>
            
            <div id="tablaTrabajadores" class="container-fluid">
                <div style="overflow-x:scroll;">
                <table class="table mt-4">
                        <thead style="background-color: #353449; color:#FFFFFF;">
                        <tr>
                            <th> NOMBRE LOCAL </th>
                            <th> DIRECCION </th>
                            <th> TELEFONO </th>
                            <th> PERSONA CONTACTO </th>
                            <th> <%-- Hueco para boton editar --%> </th>
                        </tr>
                        </thead>
                        <tbody>
                    <% 
                       List<PuntoRecogida> listpr = (List<PuntoRecogida>)session.getAttribute("listaLocales");
                       for(PuntoRecogida pr : listpr){
                    %>
                            <tr>
                            <td><%= pr.getNombre() %></td>   
                            <td><%= pr.getDireccion() %> <%=pr.getLocalidad()%>,<%=pr.getProvincia()%></td>
                            <td><%=pr.getTelefono()%></td>
                            <td><%=pr.getPersona_contacto()%></td>
                            <td><a href="editarDatosLocal.jsp?id=<%= pr.getId() %>"><i class="fa fa-edit close-modal text-dark"></i></a></td>
                            </tr>
                    <%  } %>   
                        </tbody>
                        <tfoot>
                            <tr>
                              <td colspan="4"></td>
                              <td colspan="1">
                                <a href="addLocal.jsp" class="btn btn-modal btn-block" role="button">Nuevo local</a>
                              </td>
                             </tr>
                        </tfoot>
                    </table>
                    </div>
            </div>
        </main>       
    </body>
</html>
