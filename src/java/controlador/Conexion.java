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
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Cliente;
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
            clie.setCorreo(correo);
            clie.setPass(pass);
        }
          
        return clie;
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
    
    public static void CambioFoto(Cliente clie){
        
    }
}
