/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cliente;

import controlador.Conexion;
import static cliente.SubirFoto.TAM_BUFFER;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;
import modelo.Cliente;
import modelo.ObjetoPerdido;
import modelo.PuntoRecogida;
import modelo.Trabajador;

/**
 *
 * @author RoyalRode
 */
@WebServlet(name = "insertaObjeto", urlPatterns = {"/insertaObjeto"})
public class insertaObjeto extends HttpServlet {

   public static final int TAM_BUFFER = 4 * 1024;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException{
          HttpSession session=request.getSession();
          
          List<Trabajador> trList = Conexion.TraerListaTrabajadoresEncargados();
          int aleatorioTrabajador = (int) Math.floor(Math.random()*trList.size()+1);
          
          List<PuntoRecogida> prList = Conexion.TraerListaLocales();
        
          String nombre = request.getParameter("nombreInserta");
          String descripcion = request.getParameter("descripcionInserta");
          String direccion_encontrado = request.getParameter("direccionInserta");
          String localidad = request.getParameter("localidadInserta");
          String provincia = request.getParameter("provinciaInserta");
          String nombreLocal = request.getParameter("localInserta");
          Cliente clie = (Cliente)session.getAttribute("usuario");
          
          Date fecha_actual = new Date();
          SimpleDateFormat FechaFinal = new SimpleDateFormat("dd/MM/yyyy HH:mm");
          
          //Creacion del objeto Objeto perdido
          
          ObjetoPerdido op = new ObjetoPerdido();
          op.setNombre(nombre);
          op.setDescripcion(descripcion);
          
          //Le metemos el valor por defecto, que despues "deberá" ser cambiado
          op.setImagen("objetoSinImagen.jpg");
       
          op.setDireccion_encontrado(direccion_encontrado);
          op.setLocalidad(localidad);
          op.setProvincia(provincia);
          op.setFecha_subida(FechaFinal.format(fecha_actual));
          op.setDni_persona_encuentra(clie.getDni());
          
          for(PuntoRecogida pr:prList){
            //Para evitar errores con mayusculas o minusculas
            if((pr.getNombre().toUpperCase()).equals(nombreLocal.toUpperCase())){
                op.setId_punto_recogida(pr.getId());
            }
          }
          
          int i = 1;
          for(Trabajador tr:trList){
              if(i==aleatorioTrabajador){
                  op.setDni_persona_responsable(tr.getDni());
              }
              i++;
          }
         
          Conexion.añadirObjetoPerdido(op);
          
          session.removeAttribute("verFormularioObjeto"); 
          
          session.setMaxInactiveInterval(5); //"tiempo de vida de la session"
          session.setAttribute("ObjetoCreado", true);
          
          response.sendRedirect("inicioClie.jsp");
          
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
            Logger.getLogger(insertaObjeto.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insertaObjeto.class.getName()).log(Level.SEVERE, null, ex);
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
