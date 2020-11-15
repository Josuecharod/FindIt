/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.Date;

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
  Date fecha_subida;
  PuntoRecogida punto_recogida;
  Cliente persona_encuentra;
  Trabajador persona_responsable;
  
  
}
