/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabajadores;

import controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import modelo.Email;
import modelo.ObjetoPerdido;
import modelo.PuntoRecogida;
import modelo.Trabajador;
import modelo.Utilidades;

/**
 *
 * @author RoyalRode
 */
@WebServlet(name = "ObjetoEncontrado", urlPatterns = {"/ObjetoEncontrado"})
public class ObjetoEncontrado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
         HttpSession session = request.getSession();
        
         Chat chatCierre = (Chat)session.getAttribute("Chat");
         List<Chat> chatsObjeto = Conexion.TraerListaDeChatsObjeto(chatCierre.getId_objeto_fk());
         ObjetoPerdido op = Conexion.cogerObjeto(chatCierre.getId_objeto_fk()); //cogemos el op para actualizarlo y enviarlo al sql
         PuntoRecogida pr = Conexion.TraerLocalPorID(op.getId_punto_recogida()); //cogemos el local para poner los datos en el email
         Trabajador tra = Conexion.TraerTrabajadorPorDNI(chatCierre.getDni_responsable_fk());
         
         op.setEstado(Boolean.TRUE);
         op.setDni_persona_propietaria(chatCierre.getDni_persona_fk());
         Conexion.CerrarCasoObjeto(op);
        
         Email email = new Email();
         email.setFrom("josuetaller2020@gmail.com");
         for(Chat c : chatsObjeto){
          if(c.getDni_persona_fk().equals(chatCierre.getDni_persona_fk())){
            Cliente clie = Conexion.cogerCliente(chatCierre.getDni_persona_fk());
            email.setTo(clie.getCorreo());
            email.setSubject("ENHORABUENA USTED HA ENCONTRADO SU OBJETO");
            email.setText("A continuación le mostraremos donde debe recoger el objeto"
                          +"\nNombre del local : "+pr.getNombre()
                          +"\nDireccion del local : "+pr.getDireccion()+", "+pr.getLocalidad()+" "+pr.getProvincia()
                          +"\nPreguntar por : "+pr.getPersona_contacto()
                          +"\nMuchas gracias por confiar en nosotros!!");
            Utilidades u = new Utilidades();
            u.enviarEmail(email);
          }else{
            Cliente clie = Conexion.cogerCliente(c.getDni_persona_fk());
            email.setTo(clie.getCorreo());
            email.setSubject("Lo siento el objeto del chat que tenia usted abierto se ha cerrado");
            email.setText("el objeto por el que usted preguntaba, ha sido encontrado por su dueño por lo que se cerrará el caso y los chats relacionados, muchas gracias!!");
            Utilidades u = new Utilidades();
            u.enviarEmail(email); 
          }
        }   
         
         session.setAttribute("listaChatsEncargado", Conexion.TraerListaDeChatsEncargado(tra.getDni()));
         response.sendRedirect("inicioTrabajadorEncar.jsp");

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
            Logger.getLogger(ObjetoEncontrado.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ObjetoEncontrado.class.getName()).log(Level.SEVERE, null, ex);
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
