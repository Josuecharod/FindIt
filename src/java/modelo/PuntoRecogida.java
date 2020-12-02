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
public class PuntoRecogida {
    int id;
    String nombre;
    String direccion;
    String localidad;
    String provincia;
    String telefono;
    String persona_contacto;

    public PuntoRecogida() {
    
    }

    public PuntoRecogida(String nombre, String direccion, String localidad, String provincia, String telefono, String persona_contacto) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.localidad = localidad;
        this.provincia = provincia;
        this.telefono = telefono;
        this.persona_contacto = persona_contacto;
    }

    public int getId() {
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPersona_contacto() {
        return persona_contacto;
    }

    public void setPersona_contacto(String persona_contacto) {
        this.persona_contacto = persona_contacto;
    }

    @Override
    public String toString() {
        return "PuntoRecogida{" + "id=" + id + ", nombre=" + nombre + ", direccion=" + direccion + ", localidad=" + localidad + ", provincia=" + provincia + ", telefono=" + telefono + ", persona_contacto=" + persona_contacto + '}';
    }
   
}
