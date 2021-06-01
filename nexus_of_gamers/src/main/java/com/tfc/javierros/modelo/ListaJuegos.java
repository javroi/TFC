package com.tfc.javierros.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author javier
 * 
 * @description Clase de ListaJuegos la cual contiene su id y el id de su usuario asociado
 * 
 */
@Entity
@Table (name="games_list")
public class ListaJuegos implements Serializable {
    
    @Id
    @Column(name = "id_games_list")
    private int id;
    
    @Column(name = "id_user")
    private int id_user;

    public ListaJuegos() {
    }
    
    public ListaJuegos(int id_user) {
        this.id_user=id_user;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    
    
}
