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
 * @description Clase de Review la cual tiene su id, el id del usuario que ha creado la review, 
 *              el id del juego que ha valorado, la nota, y la valoracion escrita
 * 
 */
@Entity
@Table (name="review")
public class Review implements Serializable{
    
    @Id
    @Column(name = "id_review")
    private int id;
    
    @Column(name = "id_user")
    private int id_user;
    
    @Column(name = "id_game")
    private int id_game;
    
    @Column(name = "grade")
    private int nota;
    
    @Column(name = "text")
    private String texto;

    public Review() {
    }

    public Review(int id_user, int id_game, int nota, String texto) {
        this.id_user = id_user;
        this.id_game = id_game;
        this.nota = nota;
        this.texto = texto;
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

    public int getId_game() {
        return id_game;
    }

    public void setId_game(int id_game) {
        this.id_game = id_game;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }
    
    
}
