<%-- 
    Document   : resultadoBusqueda
    Created on : 01-dic-2020, 20:50:34
    Author     : RoyalRode
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.Chat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ObjetoPerdido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    //si no existe la session de usuario, que es con la que trabajamos en las ventanas de usuario, se vuelve para el index.jsp
    if(!(session.getAttribute("usuario")!= null)){
       request.getRequestDispatcher("index.jsp").forward(request, response);
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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLqgXjDUtT4tN9on-IcYYdEFa2htF5gNg" type="text/javascript"></script>
        <script src="javascriptMapas/mapaModal.js"></script>
	<script src="jquery.js"></script>
    </head>
    <body>
        <div class="modal fade" id="modalMapa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-body" >
                    <div id="verMapaModal">
                        
                    </div>
                </div>
              </div>
            </div>
        </div>
        
        <main id="principal-administrador" class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg navbar-light nav-admin d-flex justify-content-start" id="barra">
                <a href="inicioClie.jsp" class="btn btn-modal">Volver Atrás</a> 
                </p>
                
            </nav>
            
            <div class="container-fluid">
                <%     Cliente clie = (Cliente)session.getAttribute("usuario");
                       List<ObjetoPerdido> listObj = (List<ObjetoPerdido>)session.getAttribute("objetosLista");
                       int control = (Integer)session.getAttribute("cuenta");
                       
                       if(control != 0){ %>
                <table class="table mt-4">
                        <thead style="background-color: #353449; color:#FFFFFF;">
                        <tr>
                            <th> NOMBRE </th>
                            <th> DIRECCION ENCONTRADO </th>
                            <th><%-- Hueco para boton mapa --%></th>
                            <th> FECHA Y HORA </th>
                            <th> <%-- Hueco para boton chat --%> </th>
                        </tr>
                        </thead>
                        <tbody>
                    <% for(ObjetoPerdido op : listObj){ 
                       if(!op.getEstado()){
                    %>
                        <tr>
                            <td><%= op.getNombre()%></td>
                            <td><%= op.getDireccion_encontrado()%> , <%=op.getLocalidad()%></td>
                            <td><button type="button" class="btn btn-modal" data-toggle="modal" data-target="#modalMapa" onclick="MapaConPunto('<%= op.getDireccion_encontrado() %>,<%=op.getLocalidad()%> <%= op.getProvincia()%> ')">
                                    Ver en el mapa
                            </button></td>
                            <td><%= op.getFecha_subida()%></td>
                           
                            <% boolean fin = false;
                               Chat ch = new Chat();
                               List<Chat> listChat = (List<Chat>)session.getAttribute("listaChats"); 
                               if(listChat.size()==0){ %>
                                <td><a class="btn btn-modal" href="NuevoChat?id_objeto=<%=op.getId()%>&id_persona=<%=clie.getDni()%>&id_responsable=<%=op.getDni_persona_responsable()%>" role="button">Abrir nuevo chat</a></td>
                            <% }else{
                                for(Chat chat : listChat){
                                  if(chat.getId_objeto_fk() == op.getId() && chat.getDni_persona_fk().equals(clie.getDni())){
                                    fin = true;
                                    ch = chat;
                                  } }  
                                if(fin){
                            %>
                                <td><a class="btn btn-modal" href="CargarChat?id_objeto=<%=op.getId()%>&id_persona=<%=clie.getDni()%>&id_responsable=<%=op.getDni_persona_responsable()%>" role="button">Ir al chat</a></td>  
                            <% }else{ %>
                                <td><a class="btn btn-modal" href="NuevoChat?id_objeto=<%=op.getId()%>&id_persona=<%=clie.getDni()%>&id_responsable=<%=op.getDni_persona_responsable()%>" role="button">Abrir nuevo chat</a></td>
                            <% } }%>
                        </tr>
                    <% } } %>
                        </tbody>
                    </table>
                  <% }else{ %>
                    <div class="form-row d-flex align-items-stretch flex-column-reverse flex-md-row">
                        <div class="col-12 col-md-6 d-flex justify-content-center">
                            <img src="imagenes/sinBusqueda.png" class='imagenes-cambios'>
                        </div>
                        <div class="col-12 col-md-6 fondo-texto-verde p-4 d-flex flex-column justify-content-center">
                            <p class="h2">No hay ningún resultado para tu búsqueda, intentelo de nuevo.</p>
                        </div>
                    </div>
                  <% } %>
            </div>  
        </main>
    </body>
</html>
