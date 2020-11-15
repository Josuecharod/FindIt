/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author RoyalRode
 */
public class Cliente {
    String dni;
    String nombre;
    String apellidos;
    String telefono;
    String localidad;
    String provincia;
    String direccion;
    String fotoperfil;
    String correo;
    String pass;

    public Cliente() {
        this.fotoperfil = "usudefecto.png";
    }

    public Cliente(String dni, String nombre, String apellidos, String telefono, String localidad, String provincia, String direccion, String correo, String pass) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.localidad = localidad;
        this.provincia = provincia;
        this.direccion = direccion;
        this.correo = correo;
        this.pass = pass;
        this.fotoperfil = "usudefecto.png";
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFotoperfil() {
        return fotoperfil;
    }

    public void setFotoperfil(String fotoperfil) {
        this.fotoperfil = fotoperfil;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Cliente{" + "dni=" + dni + ", nombre=" + nombre + ", apellidos=" + apellidos + ", telefono=" + telefono + ", localidad=" + localidad + ", provincia=" + provincia + ", direccion=" + direccion + ", fotoperfil=" + fotoperfil + ", correo=" + correo + ", pass=" + pass + '}';
    }
    
}
