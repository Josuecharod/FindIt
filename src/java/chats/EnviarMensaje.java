/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chats;

import controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Chat;
import modelo.Cliente;
import modelo.Mensaje;
import modelo.Trabajador;

/**
 *
 * @author RoyalRode
 */
@WebServlet(name = "EnviarMensaje", urlPatterns = {"/EnviarMensaje"})
public class EnviarMensaje extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
       response.setContentType( "text/html; charset=utf-8" ); 
       
       boolean userSi = false;
       HttpSession session = request.getSession();
       PrintWriter out = response.getWriter();
       String mensaje = request.getParameter("mensaje");
       
       Date fecha_actual = new Date();
       SimpleDateFormat FechaFinal = new SimpleDateFormat("dd/MM/yyyy HH:mm");
       
       Mensaje mj = new Mensaje();
       
       mj.setCuerpo_mensaje(mensaje);
       mj.setFecha_envio(FechaFinal.format(fecha_actual));
       
       Chat ch = (Chat)session.getAttribute("Chat");
       mj.setId_chat_fk(ch.getId());
       
       if(session.getAttribute("usuario")!=null){
           Cliente clie = (Cliente)session.getAttribute("usuario");
           mj.setDni_persona_envia(clie.getDni());
           userSi = true;
       }else{
           Trabajador tra = (Trabajador)session.getAttribute("trabajador");
           mj.setDni_persona_envia(tra.getDni());
       }
       
       Conexion.InsertarMensaje(mj);
       List<Mensaje> listaMensajes = Conexion.TraerListaMensajes(mj.getId_chat_fk());
       
       for(int i=0; i<listaMensajes.size();i++){
           Mensaje m = listaMensajes.get(i);
           if(userSi){
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EnviarMensaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EnviarMensaje.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
