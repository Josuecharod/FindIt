<%-- 
    Document   : verChat
    Created on : 02-dic-2020, 19:42:46
    Author     : RoyalRode
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.Trabajador"%>
<%@page import="modelo.Mensaje"%>
<%@page import="java.util.List"%>
<%@page import="controlador.Conexion"%>
<%@page import="modelo.Chat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if(!(session.getAttribute("trabajador")!= null) && !(session.getAttribute("usuario")!= null)){
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
	<script src="jquery.js"></script>
        <script>
            $(document).ready(function() {
                var contenedor = $('#conversacion-box');
                contenedor[0].scrollTop = contenedor[0].scrollHeight;
                
		$('#submit').click(function(event) {
			var mensaje = $('#mensajeEnviar').val();
                        $('#mensajeEnviar').val(''); 
                        $.post('EnviarMensaje', {
				mensaje : mensaje
			}, function(responseText) {
				$('#conversacion-mensajes').html(responseText);
                                var contenedor = $('#conversacion-box');
                                contenedor[0].scrollTop = contenedor[0].scrollHeight;
			});
		});
                
	  });
        </script>
</head>
    <body>
        <main class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg navbar-light nav-admin d-flex justify-content-start" id="barra">
                <% if(session.getAttribute("usuario")!=null){ %>
                    <a href="inicioClie.jsp" class="btn btn-modal">Volver Atrás</a>  
                <% }else{ %>
                    <a href="inicioTrabajadorEncar.jsp" class="btn btn-modal">Volver Atrás</a>
                    <a href="verDatosObjetos.jsp" class="btn btn-modal ml-4">Ver información del objeto</a>
                    <a href="ObjetoEncontrado" class="btn btn-modal ml-4">Cerrar caso</a>
                <% } %>
            </nav>
           
            <div class="chat-box col-lg-8 offset-lg-2 p-4 mt-2">
                <div class="conversacion-box" id="conversacion-box">
                   <div id="conversacion-mensajes" class="container-fluid p-0 m-0 form-row d-flex">
                       <% Chat chat = (Chat)session.getAttribute("Chat");
                          List<Mensaje> listaMensajes = Conexion.TraerListaMensajes(chat.getId());
                          if(listaMensajes.size()!=0){
                          for(int i=0; i<listaMensajes.size();i++){
                            Mensaje m = listaMensajes.get(i);
                            if(session.getAttribute("usuario")!=null){
                                Cliente clie = (Cliente)session.getAttribute("usuario");
                                if(clie.getDni().equals(m.getDni_persona_envia())){
                                  out.println("<div class=\"col-12 p-3 mt-2 mb-2 d-flex justify-content-end\">");
                                  out.println("<div class=\"mensajes d-flex flex-column \">");
                                  out.println("<p class=\" px-1 m-0 \">"+m.getFecha_envio()+" </p>");
                                  out.println("<p class=\" p-1 m-0 \"> "+m.getCuerpo_mensaje()+"</p>");
                                  out.println("</div>");
                                  out.println("</div>");
                                }else{
                                  out.println("<div class=\"col-12 p-3 mt-2 mb-2 d-flex justify-content-start \">");
                                  out.println("<div class=\"mensajes d-flex flex-column \">");
                                  out.println("<p class=\" px-1 m-0\">"+m.getFecha_envio()+" </p>");
                                  out.println("<p class=\" p-1 m-0\"> "+m.getCuerpo_mensaje()+"</p>");
                                  out.println("</div>");  
                                  out.println("</div>");
                                }
                            }else{
                                Trabajador tra = (Trabajador)session.getAttribute("trabajador");
                                if(tra.getDni().equals(m.getDni_persona_envia())){
                                  out.println("<div class=\"col-12 p-3 mt-2 mb-2 d-flex justify-content-end \">");
                                  out.println("<div class=\"mensajes d-flex flex-column \">");
                                  out.println("<p class=\" px-1 m-0\">"+m.getFecha_envio()+" </p>");
                                  out.println("<p class=\" p-1 m-0\"> "+m.getCuerpo_mensaje()+"</p>");
                                  out.println("</div>");
                                  out.println("</div>");
                                }else{
                                  out.println("<div class=\"col-12 p-3 mt-2 mb-2 d-flex justify-content-start\">");
                                  out.println("<div class=\"mensajes d-flex flex-column \">");
                                  out.println("<p class=\" px-1 m-0\">"+m.getFecha_envio()+" </p>");
                                  out.println("<p class=\" p-1 m-0\"> "+m.getCuerpo_mensaje()+"</p>");
                                  out.println("</div>");
                                  out.println("</div>");  
                                }
                            } 
                          }
                        }
                      %> 
                    </div>
                </div>     
                <div class="container-fluid mt-3 ml-4">
                    <div class="form-row">
                        <div class="col-10">
                            <input type="text" class="form-control mr-2 py-4" placeholder="Introduce el mensaje" id="mensajeEnviar">
                        </div>
                        <div class="col-2">
                            <button class="btn ml-1 btn-busqueda btn-modal" id="submit"><i class="fa fa-paper-plane text-light"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </main>     
    </body>
</html>
