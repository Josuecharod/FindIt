/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.util.Date;

/**
 *
 * @author RoyalRode
 */
public class ObjetoPerdido {
  int id;
  String nombre;
  String descripcion;
  String imagen;
  String direccion_encontrado;
  String localidad;
  String provincia;
  Boolean estado;
  String fecha_subida;
  int id_punto_recogida;
  String dni_persona_encuentra;
  String dni_persona_responsable;
  
 
 
    public ObjetoPerdido() {
        this.estado = false;
    }

    public ObjetoPerdido(int id, String nombre, String descripcion, String imagen, String direccion_encontrado, String localidad, String provincia, String fecha_subida, int id_punto_recogida, String dni_persona_encuentra, String dni_persona_responsable) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.direccion_encontrado = direccion_encontrado;
        this.localidad = localidad;
        this.provincia = provincia;
        this.estado = false;
        this.fecha_subida = fecha_subida;
        this.id_punto_recogida = id_punto_recogida;
        this.dni_persona_encuentra = dni_persona_encuentra;
        this.dni_persona_responsable = dni_persona_responsable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDireccion_encontrado() {
        return direccion_encontrado;
    }

    public void setDireccion_encontrado(String direccion_encontrado) {
        this.direccion_encontrado = direccion_encontrado;
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

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public String getFecha_subida() {
        return fecha_subida;
    }

    public void setFecha_subida(String fecha_subida) {
        this.fecha_subida = fecha_subida;
    }

    public int getId_punto_recogida() {
        return id_punto_recogida;
    }

    public void setId_punto_recogida(int id_punto_recogida) {
        this.id_punto_recogida = id_punto_recogida;
    }

    public String getDni_persona_encuentra() {
        return dni_persona_encuentra;
    }

    public void setDni_persona_encuentra(String dni_persona_encuentra) {
        this.dni_persona_encuentra = dni_persona_encuentra;
    }

    public String getDni_persona_responsable() {
        return dni_persona_responsable;
    }

    public void setDni_persona_responsable(String dni_persona_responsable) {
        this.dni_persona_responsable = dni_persona_responsable;
    }

    @Override
    public String toString() {
        return "ObjetoPerdido{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", imagen=" + imagen + ", direccion_encontrado=" + direccion_encontrado + ", localidad=" + localidad + ", provincia=" + provincia + ", estado=" + estado + ", fecha_subida=" + fecha_subida + ", id_punto_recogida=" + id_punto_recogida + ", dni_persona_encuentra=" + dni_persona_encuentra + ", dni_persona_responsable=" + dni_persona_responsable + '}';
    }
    

}
