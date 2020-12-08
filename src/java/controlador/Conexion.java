/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Chat;
import modelo.Cliente;
import modelo.Mensaje;
import modelo.ObjetoPerdido;
import modelo.PuntoRecogida;
import modelo.Trabajador;

/**
 *
 * @author RoyalRode
 */
public class Conexion {
    
    //INICIO DE LAS FUNCIONES DE LA BASE DE DATOS
    
    public static Connection conecta(){  
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException ex){
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error de driver de jdbc");
        }
       
        Connection con = null;
        String url="jdbc:mysql://localhost:3308/findit";
        
        try{
            con=DriverManager.getConnection(url,"root","root");
         }catch(SQLException ex){
            System.out.println("Error en la conexion con la base de datos");
        } 
        return con;
    }
    
    public static ResultSet ejecuta(Connection con, String sql) {
        ResultSet rs = null;
        Statement sentencia;
        
        try {
            sentencia = con.createStatement();
            rs = sentencia.executeQuery(sql);
           
        } catch (SQLException ex) {
            System.out.println("Error intentando hacer un select");
        }
        return rs;
    }
    
    public static void ejecutaUpdate(Connection con, String sql) {
        Statement sentencia;
        try {
            sentencia = con.createStatement();
            sentencia.executeUpdate(sql);  
        }catch (SQLException ex){
            System.out.println("Error ejecutando un delete,update o insert");
        }
    }
    
    //FIN DE LAS FUNCIONES DE LA BASE DE DATOS
    
    
    //FUNCIONES PARA CIENTES
    
    public static void RegistroCliente(Cliente clie){
        Connection con = conecta();
        String sql="insert into cliente values ('"+clie.getDni()+"','"+clie.getNombre()+"','"+
                clie.getApellidos()+"','"+clie.getTelefono()+"','"+clie.getLocalidad()+"','"+clie.getProvincia()+"','"+clie.getDireccion()+"','"
                +clie.getFotoperfil()+"','"+clie.getCorreo()+"','"+clie.getPass()+"')";
        ejecutaUpdate(con,sql);
    }
    
    public static Cliente LoginCliente(String correo,String pass) throws SQLException{   
        Connection con = conecta();
        String sql="select * from cliente where correo='"+correo+"'"
                +"and pass='"+pass+"'";
        
        ResultSet rs = ejecuta(con,sql);
        Cliente clie = new Cliente();
        
        while(rs.next()){
            clie.setDni(rs.getString("dni"));
            clie.setNombre(rs.getString("nombre"));
            clie.setApellidos(rs.getString("apellidos"));
            clie.setTelefono(rs.getString("telefono"));
            clie.setLocalidad(rs.getString("localidad"));
            clie.setProvincia(rs.getString("provincia"));
            clie.setDireccion(rs.getString("direccion"));
            clie.setFotoperfil(rs.getString("fotoperfil"));
            clie.setCorreo(correo);
            clie.setPass(pass);
        }
          
        return clie;
    }
    
    public static void editarDatosCliente(Cliente c){
        Connection con = conecta();
        String sql ="update cliente "
                + " set nombre='"+c.getNombre()+"',"
                + " apellidos='"+c.getApellidos()+"',"
                + " telefono='"+c.getTelefono()+"',"
                + " localidad='"+c.getLocalidad()+"',"
                + " provincia='"+c.getProvincia()+"',"
                + " direccion='"+c.getDireccion()+"',"
                + " correo='"+c.getCorreo()+"',"
                + " pass='"+c.getPass()+"'"
                + " where dni='"+c.getDni()+"' ;";
        
        ejecutaUpdate(con,sql);
    }
    
    public static Cliente cogerCliente(String dni_usuario) throws SQLException{
        Connection con = conecta();
        String sql = "select * from cliente where dni='"+dni_usuario+"';";
        
        ResultSet rs = ejecuta(con,sql);
        Cliente clie = new Cliente();
        
        while(rs.next()){
            clie.setDni(rs.getString("dni"));
            clie.setNombre(rs.getString("nombre"));
            clie.setApellidos(rs.getString("apellidos"));
            clie.setTelefono(rs.getString("telefono"));
            clie.setLocalidad(rs.getString("localidad"));
            clie.setProvincia(rs.getString("provincia"));
            clie.setDireccion(rs.getString("direccion"));
            clie.setFotoperfil(rs.getString("fotoperfil"));
            clie.setCorreo(rs.getString("correo"));
            clie.setPass(rs.getString("pass"));
        }
          
        return clie;
    }
    
     public static void CambioFoto(Cliente clie){
        Connection con = conecta();
        String sql = "update cliente "
                   +" set fotoperfil='"+clie.getFotoperfil()+"' where dni='"+clie.getDni()+"';";
        ejecutaUpdate(con,sql);
    }
     
    public static List<ObjetoPerdido> ObjetosSubidosPorCliente(String dni) throws SQLException{
        Connection con = conecta(); 
        List<ObjetoPerdido> objetos = new ArrayList<>();
        String sql = "select * from objeto_perdido where persona_fk='"+dni+"';";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            ObjetoPerdido o = new ObjetoPerdido();
            o.setId(rs.getInt("id_objeto"));
            o.setNombre(rs.getString("nombre_clave"));
            o.setDescripcion(rs.getString("descripcion"));
            o.setImagen(rs.getString("imagen"));
            o.setDireccion_encontrado(rs.getString("direccion_encuentro"));
            o.setLocalidad(rs.getString("localidad"));
            o.setProvincia(rs.getString("provincia"));
            o.setEstado(rs.getBoolean("estado"));
            o.setFecha_subida(rs.getString("fecha_subida"));
            o.setId_punto_recogida(rs.getInt("punto_recogida_fk"));
            o.setDni_persona_encuentra(dni);
            o.setDni_persona_responsable(rs.getString("responsable_fk"));
            
            objetos.add(o);
        }
        
        return objetos;
    }
    
    public static void SubirFotoObjeto(int id_objeto,String nombreFichero) {
        Connection con = conecta();
        String sql = "update objeto_perdido "
                   +" set imagen='"+nombreFichero+"' where id_objeto='"+id_objeto+"';";
        ejecutaUpdate(con,sql);
    }
    
    //FUNCIONES PARA TRABAJADOR
    
    public static void añadirTrabajador(Trabajador tr) throws SQLException{
        Connection con = conecta();
        String sql="insert into trabajador values ('"+tr.getDni()+"','"+tr.getNombre()+"','"+
                tr.getApellidos()+"','"+tr.getTelefono()+"','"+tr.getPuesto()+"','"+tr.getCorreo()+"','"+tr.getPass()+"')";
        ejecutaUpdate(con,sql);
    }
    
    public static Trabajador LoginTrabajador(String correo,String pass) throws SQLException{   
        Connection con = conecta();
        String sql="select * from trabajador where correo='"+correo+"'"
                +"and pass='"+pass+"'";
        
        ResultSet rs = ejecuta(con,sql);
        Trabajador tra = new Trabajador();
        
        while(rs.next()){
            tra.setDni(rs.getString("dni"));
            tra.setNombre(rs.getString("nombre"));
            tra.setApellidos(rs.getString("apellidos"));
            tra.setTelefono(rs.getString("telefono"));
            tra.setPuesto(rs.getString("puesto"));
            tra.setCorreo(correo);
            tra.setPass(pass);
        }
          
        return tra;
    }
    
    public static Trabajador TraerTrabajadorPorDNI(String dni) throws SQLException{
        Connection con = conecta();
        String sql="select * from trabajador where dni='"+dni+"';";
        
        ResultSet rs = ejecuta(con,sql);
        Trabajador tra = new Trabajador();
        
        while(rs.next()){
            tra.setDni(dni);
            tra.setNombre(rs.getString("nombre"));
            tra.setApellidos(rs.getString("apellidos"));
            tra.setTelefono(rs.getString("telefono"));
            tra.setPuesto(rs.getString("puesto"));
            tra.setCorreo(rs.getString("correo"));
            tra.setPass(rs.getString("pass"));
        }
          
        return tra;  
    }
    
    public static void EditarDatosTrabajador(Trabajador tra) throws SQLException{
        Connection con = conecta();
        String sql ="update trabajador "
                + " set nombre='"+tra.getNombre()+"',"
                + " apellidos='"+tra.getApellidos()+"',"
                + " telefono='"+tra.getTelefono()+"'"
                + " where dni='"+tra.getDni()+"' ;";
        
        ejecutaUpdate(con,sql);
        
    }
    
     public static List<Trabajador> TraerListaTrabajadoresEncargados() throws SQLException{
        Connection con = conecta();
        List<Trabajador> trabajadores = new ArrayList<>();
        String sql = "select * from trabajador where puesto = 'Encargado'";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            Trabajador tr = new Trabajador();
            tr.setDni(rs.getString("dni"));
            tr.setNombre(rs.getString("nombre"));
            tr.setApellidos(rs.getString("apellidos"));
            tr.setTelefono(rs.getString("telefono"));
            tr.setPuesto(rs.getString("puesto"));
            tr.setCorreo(rs.getString("correo"));
            tr.setPass(rs.getString("pass"));
            
            trabajadores.add(tr);
        }
        return trabajadores; 
    }
     
    //FUNCIONES PARA OBJETOS PERDIDOS
     
     public static void añadirObjetoPerdido(ObjetoPerdido op){
         Connection con = conecta();
         String sql="insert into objeto_perdido(nombre_clave,descripcion,imagen,direccion_encuentro,localidad,provincia,estado,fecha_subida,punto_recogida_fk,persona_fk,responsable_fk) values"
                + "('"+op.getNombre()+"','"+op.getDescripcion()+"','"+op.getImagen()+"','"+op.getDireccion_encontrado()+"','"+op.getLocalidad()+"','"+op.getProvincia()+"',"+op.getEstado()+",'"
                + op.getFecha_subida()+"',"+op.getId_punto_recogida()+",'"+op.getDni_persona_encuentra()+"','"+op.getDni_persona_responsable()+"');";
         
         ejecutaUpdate(con,sql);
     }
     
     public static ObjetoPerdido cogerObjeto(int id_objeto) throws SQLException{
         Connection con = conecta();
         String sql =" select * from objeto_perdido where id_objeto="+id_objeto;
         ResultSet rs = ejecuta(con,sql);
         
         ObjetoPerdido o = new ObjetoPerdido();
         while(rs.next()){
            o.setId(rs.getInt("id_objeto"));
            o.setNombre(rs.getString("nombre_clave"));
            o.setDescripcion(rs.getString("descripcion"));
            o.setImagen(rs.getString("imagen"));
            o.setDireccion_encontrado(rs.getString("direccion_encuentro"));
            o.setLocalidad(rs.getString("localidad"));
            o.setProvincia(rs.getString("provincia"));
            o.setEstado(rs.getBoolean("estado"));
            o.setFecha_subida(rs.getString("fecha_subida"));
            o.setId_punto_recogida(rs.getInt("punto_recogida_fk"));
            o.setDni_persona_encuentra("persona_fk");
            o.setDni_persona_responsable(rs.getString("responsable_fk"));
         }
         
         return o;
     }
     
     public static List<ObjetoPerdido> busquedaObjetosDosCondiciones(String nombre, String localidad) throws SQLException {
        Connection con = conecta(); 
        List<ObjetoPerdido> objetos = new ArrayList<>();
        String sql = "select * from objeto_perdido where nombre_clave like '%"+nombre+"%' and localidad like '"+localidad+"' order by fecha_subida DESC";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            ObjetoPerdido o = new ObjetoPerdido();
            o.setId(rs.getInt("id_objeto"));
            o.setNombre(rs.getString("nombre_clave"));
            o.setDescripcion(rs.getString("descripcion"));
            o.setImagen(rs.getString("imagen"));
            o.setDireccion_encontrado(rs.getString("direccion_encuentro"));
            o.setLocalidad(rs.getString("localidad"));
            o.setProvincia(rs.getString("provincia"));
            o.setEstado(rs.getBoolean("estado"));
            o.setFecha_subida(rs.getString("fecha_subida"));
            o.setId_punto_recogida(rs.getInt("punto_recogida_fk"));
            o.setDni_persona_encuentra("persona_fk");
            o.setDni_persona_responsable(rs.getString("responsable_fk"));
            
            objetos.add(o);
        }
        
        return objetos;
    
     }

    public static List<ObjetoPerdido> busquedaObjetosPorNombre(String nombre) throws SQLException{
        Connection con = conecta(); 
        List<ObjetoPerdido> objetos = new ArrayList<>();
        String sql = "select * from objeto_perdido where nombre_clave like '%"+nombre+"%' order by fecha_subida DESC";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            ObjetoPerdido o = new ObjetoPerdido();
            o.setId(rs.getInt("id_objeto"));
            o.setNombre(rs.getString("nombre_clave"));
            o.setDescripcion(rs.getString("descripcion"));
            o.setImagen(rs.getString("imagen"));
            o.setDireccion_encontrado(rs.getString("direccion_encuentro"));
            o.setLocalidad(rs.getString("localidad"));
            o.setProvincia(rs.getString("provincia"));
            o.setEstado(rs.getBoolean("estado"));
            o.setFecha_subida(rs.getString("fecha_subida"));
            o.setId_punto_recogida(rs.getInt("punto_recogida_fk"));
            o.setDni_persona_encuentra("persona_fk");
            o.setDni_persona_responsable(rs.getString("responsable_fk"));
            
            objetos.add(o);
        }
        
        return objetos;
    }

    public static List<ObjetoPerdido> busquedaObjetosPorLocalidad(String localidad) throws SQLException{
        Connection con = conecta(); 
        List<ObjetoPerdido> objetos = new ArrayList<>();
        String sql = "select * from objeto_perdido where localidad like '"+localidad+"' order by fecha_subida DESC";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            ObjetoPerdido o = new ObjetoPerdido();
            o.setId(rs.getInt("id_objeto"));
            o.setNombre(rs.getString("nombre_clave"));
            o.setDescripcion(rs.getString("descripcion"));
            o.setImagen(rs.getString("imagen"));
            o.setDireccion_encontrado(rs.getString("direccion_encuentro"));
            o.setLocalidad(rs.getString("localidad"));
            o.setProvincia(rs.getString("provincia"));
            o.setEstado(rs.getBoolean("estado"));
            o.setFecha_subida(rs.getString("fecha_subida"));
            o.setId_punto_recogida(rs.getInt("punto_recogida_fk"));
            o.setDni_persona_encuentra("persona_fk");
            o.setDni_persona_responsable(rs.getString("responsable_fk"));
            
            objetos.add(o);
        }
        
        return objetos;
    }
    
    public static int busquedaObjetosDosCondicionesCuenta(String nombre, String localidad) throws SQLException {
        Connection con = conecta(); 
           String sql = "select count(id_objeto) as cuenta from objeto_perdido where nombre_clave like '%"+nombre+"%' and localidad like '"+localidad+"' and estado = false order by fecha_subida DESC";
           ResultSet rs = ejecuta(con,sql);
           int resultado = 0;
           while(rs.next()){
             resultado = rs.getInt("cuenta");
           }
       
       return resultado;
    }
    
    public static int busquedaObjetosPorNombreCuenta(String nombre) throws SQLException{
       Connection con = conecta(); 
           String sql = "select count(id_objeto) as cuenta from objeto_perdido where nombre_clave like '%"+nombre+"%' and estado = false order by fecha_subida DESC";
           ResultSet rs = ejecuta(con,sql);
           int resultado = 0;
           while(rs.next()){
             resultado = rs.getInt("cuenta");
           }
       
       return resultado;
    }
    
    public static int busquedaObjetosPorLocalidadCuenta(String localidad) throws SQLException{
       Connection con = conecta(); 
       String sql = "select count(id_objeto) as cuenta from objeto_perdido where localidad like '"+localidad+"' and estado = false order by fecha_subida DESC";
       ResultSet rs = ejecuta(con,sql);
       int resultado = 0;
       while(rs.next()){
         resultado = rs.getInt("cuenta");
       }
       
       return resultado;
    }
     
    public static void CerrarCasoObjeto(ObjetoPerdido op) throws SQLException{
        Connection con = conecta();
        String sql = "update objeto_perdido"
                + " set estado = "+op.getEstado()+" ,"
                + " persona_propietaria_fk ='"+op.getDni_persona_propietaria()+"'"
                + " where id_objeto = "+op.getId();
        ejecutaUpdate(con, sql);
    }
     //LOCALES
     
     public static void addLocal(PuntoRecogida pr) throws SQLException{
        Connection con = conecta();
        String sql = "insert into punto_recogida(nombre,direccion,localidad,provincia,telefono,persona_contacto) values"
                + "('"+pr.getNombre()+"','"+pr.getDireccion()+"','"+pr.getLocalidad()+"','"+pr.getProvincia()+"','"+pr.getTelefono()+"','"+pr.getPersona_contacto()+"');";
        
        ejecutaUpdate(con,sql);
    }
     
    public static List<PuntoRecogida> TraerListaLocales() throws SQLException{
        Connection con = conecta();
        List<PuntoRecogida> puntosDeRecogida = new ArrayList<>();
        String sql = "select * from punto_recogida";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            PuntoRecogida pr = new PuntoRecogida();
            pr.setId(rs.getInt("id_local"));
            pr.setNombre(rs.getString("nombre"));
            pr.setDireccion(rs.getString("direccion"));
            pr.setLocalidad(rs.getString("localidad"));
            pr.setProvincia(rs.getString("provincia"));
            pr.setTelefono(rs.getString("telefono"));
            pr.setPersona_contacto(rs.getString("persona_contacto"));
            
            puntosDeRecogida.add(pr);
        }
        return puntosDeRecogida; 
    }
    
    public static PuntoRecogida TraerLocalPorID(int id) throws SQLException{
        Connection con = conecta();
        String sql="select * from punto_recogida where id_local="+id+";";
        
        ResultSet rs = ejecuta(con,sql);
        PuntoRecogida pr = new PuntoRecogida();
        
        while(rs.next()){
            pr.setId(id);
            pr.setNombre(rs.getString("nombre"));
            pr.setDireccion(rs.getString("direccion"));
            pr.setLocalidad(rs.getString("localidad"));
            pr.setProvincia(rs.getString("provincia"));
            pr.setTelefono(rs.getString("telefono"));
            pr.setPersona_contacto(rs.getString("persona_contacto"));
        }
          
        return pr;  
    }

    public static void EditarDatosLocal(PuntoRecogida pr) throws SQLException{
        Connection con = conecta();
        String sql ="update punto_recogida "
                + " set nombre='"+pr.getNombre()+"',"
                + " direccion='"+pr.getDireccion()+"',"
                + " localidad='"+pr.getLocalidad()+"',"
                + " provincia='"+pr.getProvincia()+"',"
                + " telefono='"+pr.getTelefono()+"',"
                + " persona_contacto='"+pr.getPersona_contacto()+"'"
                + " where id_local='"+pr.getId()+"' ;";
        
        ejecutaUpdate(con,sql);
    }
    
    //CHAT
    
    public static void CrearChat(Chat ct) throws SQLException{
        Connection con = conecta();
        String sql = "insert into chat(persona_fk,responsable_fk,objeto_fk) values ('"
                + ct.getDni_persona_fk()+"','"+ct.getDni_responsable_fk()+"',"+ct.getId_objeto_fk()+")";
        ejecutaUpdate(con, sql);
    }
    
    public static Chat CogerChat(String dni_persona, String dni_responsable, int id_objeto) throws SQLException{
        Connection con = conecta();
        String sql = "select * from chat where persona_fk='"+dni_persona+"' and responsable_fk='"+dni_responsable+"' and objeto_fk="+id_objeto;
        ResultSet rs = ejecuta(con,sql);
        
        Chat ct = new Chat();
        while(rs.next()){
            ct.setId(rs.getInt("id_chat"));
            ct.setDni_persona_fk(rs.getString("persona_fk"));
            ct.setDni_responsable_fk(rs.getString("responsable_fk"));
            ct.setId_objeto_fk(rs.getInt("objeto_fk"));
        }
        
        return ct;
    }
    
    public static List<Chat> TraerListaDeChats() throws SQLException{
        Connection con = conecta();
        List<Chat> chats = new ArrayList<>();
        String sql = "select * from chat";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            Chat c = new Chat();
            c.setId(rs.getInt("id_chat"));
            c.setDni_persona_fk(rs.getString("persona_fk"));
            c.setDni_responsable_fk(rs.getString("responsable_fk"));
            c.setId_objeto_fk(rs.getInt("objeto_fk"));
            
            chats.add(c);
        }
        return chats; 
    }
    
     public static List<Chat> TraerListaDeChatsObjeto(int id_objeto) throws SQLException{
        Connection con = conecta();
        List<Chat> chats = new ArrayList<>();
        String sql = "select * from chat where objeto_fk="+id_objeto;
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            Chat c = new Chat();
            c.setId(rs.getInt("id_chat"));
            c.setDni_persona_fk(rs.getString("persona_fk"));
            c.setDni_responsable_fk(rs.getString("responsable_fk"));
            c.setId_objeto_fk(rs.getInt("objeto_fk"));
            
            chats.add(c);
        }
        return chats; 
    }
  
    
    public static List<Chat> TraerListaDeChatsEncargado(String dni) throws SQLException{
       Connection con = conecta();
        List<Chat> chats = new ArrayList<>();
        String sql = "select * from chat " +
                     " join objeto_perdido on chat.objeto_fk = objeto_perdido.id_objeto " +
                     " where objeto_perdido.estado = false and chat.responsable_fk='"+dni+"' ";
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            Chat c = new Chat();
            c.setId(rs.getInt("id_chat"));
            c.setDni_persona_fk(rs.getString("persona_fk"));
            c.setDni_responsable_fk(rs.getString("responsable_fk"));
            c.setId_objeto_fk(rs.getInt("objeto_fk"));
            
            chats.add(c);
        }
        return chats; 
    }
    
  
    
    //MENSAJES
    public static void InsertarMensaje(Mensaje mj) throws SQLException{
        Connection con = conecta();
        String sql = "insert into mensaje(cuerpo,fecha_envio,chat_fk,persona_envia) values ('"
                + mj.getCuerpo_mensaje()+"','"+mj.getFecha_envio()+"',"+mj.getId_chat_fk()+",'"+mj.getDni_persona_envia()+"')";
        ejecutaUpdate(con, sql);
    }
    
    public static List<Mensaje> TraerListaMensajes(int id_chat) throws SQLException{
       Connection con = conecta();
        List<Mensaje> mensajes = new ArrayList<>();
        String sql = "select * from mensaje where chat_fk = "+id_chat;
        ResultSet rs = ejecuta(con,sql);
        
        while(rs.next()){
            Mensaje m = new Mensaje();
            m.setId(rs.getInt("id_mensaje"));
            m.setCuerpo_mensaje(rs.getString("cuerpo"));
            m.setFecha_envio(rs.getString("fecha_envio"));
            m.setId_chat_fk(rs.getInt("chat_fk"));
            m.setDni_persona_envia(rs.getString("persona_envia"));
            
            mensajes.add(m);
        }
        return mensajes; 
    }
    
}
