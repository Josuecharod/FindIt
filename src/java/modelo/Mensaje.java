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
public class Mensaje {
    int id;
    String cuerpo_mensaje;
    String fecha_envio;
    int id_chat_fk;
    String dni_persona_envia;

    public Mensaje() {
    }

    public Mensaje(String cuerpo_mensaje, String fecha_envio, int id_chat_fk, String dni_persona_envia) {
        this.cuerpo_mensaje = cuerpo_mensaje;
        this.fecha_envio = fecha_envio;
        this.id_chat_fk = id_chat_fk;
        this.dni_persona_envia = dni_persona_envia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCuerpo_mensaje() {
        return cuerpo_mensaje;
    }

    public void setCuerpo_mensaje(String cuerpo_mensaje) {
        this.cuerpo_mensaje = cuerpo_mensaje;
    }

    public String getFecha_envio() {
        return fecha_envio;
    }

    public void setFecha_envio(String fecha_envio) {
        this.fecha_envio = fecha_envio;
    }

    public int getId_chat_fk() {
        return id_chat_fk;
    }

    public void setId_chat_fk(int id_chat_fk) {
        this.id_chat_fk = id_chat_fk;
    }

    public String getDni_persona_envia() {
        return dni_persona_envia;
    }

    public void setDni_persona_envia(String dni_persona_envia) {
        this.dni_persona_envia = dni_persona_envia;
    }

    @Override
    public String toString() {
        return "Mensaje{" + "id=" + id + ", cuerpo_mensaje=" + cuerpo_mensaje + ", fecha_envio=" + fecha_envio + ", id_chat_fk=" + id_chat_fk + ", dni_persona_envia=" + dni_persona_envia + '}';
    }
    
}
