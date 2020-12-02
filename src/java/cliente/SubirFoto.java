/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cliente;

import controlador.Conexion;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Cliente;

/**
 *
 * @author RoyalRode
 */
@WebServlet(name = "SubirFoto", urlPatterns = {"/SubirFoto"})
public class SubirFoto extends HttpServlet {


  public static final int TAM_BUFFER = 4 * 1024;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        Part parte = request.getPart("fichero");
        String nombreFichero = parte.getSubmittedFileName();
        InputStream entrada = parte.getInputStream();
        String ruta = getServletContext().getRealPath("/imagenes")+ "/" + nombreFichero;
        FileOutputStream salida = new FileOutputStream(ruta);
        byte[] buffer = new byte[TAM_BUFFER];
        
        while (entrada.available() > 0) {
            int tam = entrada.read(buffer);
            salida.write(buffer, 0, tam);
        }
        
        salida.close();
        entrada.close();
        
        HttpSession session= request.getSession(true);
        Cliente clie = (Cliente)session.getAttribute("usuario");
        
        clie.setFotoperfil(nombreFichero);
        Conexion.CambioFoto(clie);
        
        session.removeAttribute("verSubirFoto");
        
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
      try {
          processRequest(request, response);
      } catch (SQLException ex) {
          Logger.getLogger(SubirFoto.class.getName()).log(Level.SEVERE, null, ex);
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
          Logger.getLogger(SubirFoto.class.getName()).log(Level.SEVERE, null, ex);
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
