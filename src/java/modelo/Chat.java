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
public class Chat {
    int id;
    String dni_persona_fk;
    String dni_responsable_fk;
    int id_objeto_fk;

    public Chat() {
    }

    public Chat(String dni_persona_fk, String dni_responsable_fk, int id_objeto_fk) {
        this.dni_persona_fk = dni_persona_fk;
        this.dni_responsable_fk = dni_responsable_fk;
        this.id_objeto_fk = id_objeto_fk;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni_persona_fk() {
        return dni_persona_fk;
    }

    public void setDni_persona_fk(String dni_persona_fk) {
        this.dni_persona_fk = dni_persona_fk;
    }

    public String getDni_responsable_fk() {
        return dni_responsable_fk;
    }

    public void setDni_responsable_fk(String dni_responsable_fk) {
        this.dni_responsable_fk = dni_responsable_fk;
    }

    public int getId_objeto_fk() {
        return id_objeto_fk;
    }

    public void setId_objeto_fk(int id_objeto_fk) {
        this.id_objeto_fk = id_objeto_fk;
    }

    @Override
    public String toString() {
        return "Chat{" + "id=" + id + ", dni_persona_fk=" + dni_persona_fk + ", dni_responsable_fk=" + dni_responsable_fk + ", id_objeto_fk=" + id_objeto_fk + '}';
    }
     
}
