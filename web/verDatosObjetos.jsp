<%-- 
    Document   : verDatosObjetos
    Created on : 05-dic-2020, 18:47:54
    Author     : RoyalRode
--%>

<%@page import="modelo.PuntoRecogida"%>
<%@page import="controlador.Conexion"%>
<%@page import="modelo.ObjetoPerdido"%>
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
    <main id="principal2" class="container-fluid p-0 d-flex justify-content-center align-items-center">
        <div class="text-center ">
            <% ObjetoPerdido op = (ObjetoPerdido)session.getAttribute("objetoInformacion"); %>
            <table class="table mt-4">
                <thead style="background-color: #353449; color:#FFFFFF;">
                    <tr>
                        <th colspan="6"> DATOS DEL OBJETO </th>
                    </tr>
                </thead>
                <tbody style="background-color: #FFFFFF;">
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Nombre </td>   
                    <td colspan="4" class="text-left pl-2"> <%= op.getNombre() %> </td>
                    </tr>
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Descripcion </td>   
                    <td colspan="4" class="text-left pl-2"> <%= op.getDescripcion() %> </td>
                    </tr>
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Dirección dónde se encontró </td>   
                    <td colspan="4" class="text-left pl-2"> <%= op.getDireccion_encontrado() %>, <%= op.getLocalidad() %> <%= op.getProvincia() %></td>
                    </tr>
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Fecha </td>   
                    <td colspan="4" class="text-left pl-2"> <%= op.getFecha_subida() %> </td>
                    </tr>
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Local para recoger </td>
                    <% PuntoRecogida pr = Conexion.TraerLocalPorID(op.getId_punto_recogida()); %>
                    <td colspan="4" class="text-left pl-2"><%= pr.getNombre() %></td>
                    </tr>
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Direccion del local </td>   
                    <td colspan="4" class="text-left pl-2"> <%= pr.getDireccion() %>, <%= pr.getLocalidad() %>  <%= pr.getProvincia() %></td>
                    </tr>
                    <tr>
                    <td colspan="2" class="text-left pl-2"> Imagen del objeto </td>   
                    <td colspan="4" class="text-left pl-2"><a href="imagenes/<%= op.getImagen() %>" target="_blank">Haga click para ver la imágen</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
   </main> 
</body>
</html>
