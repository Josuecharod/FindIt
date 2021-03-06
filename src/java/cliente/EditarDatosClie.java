/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cliente;

import controlador.Conexion;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Cliente;

/**
 *
 * @author RoyalRode
 */
@WebServlet(name = "EditarDatosClie", urlPatterns = {"/EditarDatosClie"})
public class EditarDatosClie extends HttpServlet {

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
            throws ServletException, IOException {
       HttpSession session=request.getSession();
       Cliente clie = (Cliente)session.getAttribute("usuario");
       
       clie.setNombre(request.getParameter("nombreEdit"));
       clie.setApellidos(request.getParameter("apellidosEdit"));
       clie.setTelefono(request.getParameter("telefonoEdit"));
       clie.setLocalidad(request.getParameter("localidadEdit"));
       clie.setProvincia(request.getParameter("provinciaEdit"));
       clie.setDireccion(request.getParameter("direccionEdit"));
       clie.setCorreo(request.getParameter("correoEdit"));
       clie.setPass(request.getParameter("passEdit"));
       
       Conexion.editarDatosCliente(clie);
       
       session.setAttribute("usuario", clie);
       session.removeAttribute("verEditar");
       
       request.getRequestDispatcher("inicioClie.jsp").forward(request, response);
       
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
        processRequest(request, response);
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
        processRequest(request, response);
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
