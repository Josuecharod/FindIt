<%-- 
    Document   : inicioTrabajadorAdmin
    Created on : 15-nov-2020, 18:45:05
    Author     : RoyalRode
--%>

<%@page import="modelo.PuntoRecogida"%>
<%@page import="java.util.List"%>
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
            <nav class="navbar navbar-expand-lg navbar-light nav-admin" id="barra">
                <% Trabajador tra = (Trabajador)session.getAttribute("trabajador"); %>
                <p class="col-sm-12 text-center text-muted">Está usted en el apartado de administración loggeado como : <%=tra.getCorreo()%> 
                <a href="CerrarSesion" class="font-weight-bold pl-2"><i class="fa fa-user-times close-modal"></i></a>
                </p>
                
            </nav>
            
            <div id="tablaTrabajadores" class="container-fluid row">
                <div class="col-3 bloque-izq">
                   <p class="h5 p-3 text-center">DATOS PERSONALES</p>
                    <p><strong>Nombre:</strong><br><%= tra.getNombre() %></p>
                    <p><strong>Apellidos:</strong><br><%= tra.getApellidos() %></p>
                    <p><strong>Correo:</strong><br><%= tra.getCorreo() %></p>
                    <p><a href="editarDatosTrabajador.jsp?dni=<%= tra.getDni() %>" class="btn btn-modal btn-block" role="button">Editar datos</a></p>
                </div>
                <div class="col-9">
                    <div class="container-fluid">
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
                    <% int cont = 0;
                       List<Trabajador> listTra = (List<Trabajador>)session.getAttribute("listaTrabajadoresEncargados_Administracion"); 
                       for(Trabajador tr : listTra){
                           if(cont < 5){
                    %>
                            <tr>
                            <td><%= tr.getDni() %></td>
                            <td><%= tr.getNombre() %> <%= tr.getApellidos() %></td>   
                            <td><%= tr.getTelefono() %></td>
                            <td><%= tr.getPuesto() %></td>
                            <td><%= tr.getCorreo() %></td>
                            <td><a href="editarDatosTrabajador.jsp?dni=<%= tr.getDni() %>"><i class="fa fa-edit close-modal text-dark"></i></a></td>
                            </tr>
                    <%  cont++; } }%>
                            <tr>
                                <td colspan="6" class="text-right">
                                 Total encargados: <%= listTra.size() %>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                              <td colspan="4"></td>
                              <td colspan="1">
                                <a href="addTrabajador.jsp" class="btn btn-modal btn-block" role="button">Nuevo Empleado</a>
                              </td>
                              <td colspan="1">
                                <a href="verTodosEncargados.jsp" class="btn btn-modal btn-block" role="button">Ver más</a>
                             </td>
                            </tr>
                        </tfoot>
                    </table>
                    
                    <table class="table mt-4">
                        <thead class="table-dark">
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
                       cont = 0;
                       List<PuntoRecogida> listpr = (List<PuntoRecogida>)session.getAttribute("listaLocales");
                       for(PuntoRecogida pr : listpr){
                           if(cont < 5){
                    %>
                            <tr>
                            <td><%= pr.getNombre() %></td>   
                            <td><%= pr.getDireccion() %> <%=pr.getLocalidad()%>,<%=pr.getProvincia()%></td>
                            <td><%=pr.getTelefono()%></td>
                            <td><%=pr.getPersona_contacto()%></td>
                            <td><a href="editarDatosLocal.jsp?id=<%= pr.getId() %>"><i class="fa fa-edit close-modal text-dark"></i></a></td>
                            </tr>
                    <% cont++; } } %>   
                           <tr>
                                <td colspan="5" class="text-right">
                                 Total puntos de recogida: <%= listpr.size() %>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                              <td colspan="3"></td>
                              <td colspan="1">
                                <a href="addLocal.jsp" class="btn btn-modal btn-block" role="button">Nuevo local</a>
                              </td>
                              <td colspan="1">
                                <a href="verTodosLocales.jsp" class="btn btn-modal btn-block" role="button">Ver más</a>
                              </td>
                             </tr>
                        </tfoot>
                    </table>
                  </div>
                </div>
            </div>
        </main>
    </body>
</html>
