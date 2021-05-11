/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author javie
 */
@Entity
@Table(name = "add_game")
public class AddGames implements Serializable{
    
    @Id
    @Column(name = "id_add_games")
    private int id;
    
    @Column(name = "id_game")
    private int id_game;

    @Column(name = "id_games_list")
    private int id_games_list;
    

    public AddGames(int id_game, int id_games_list) {
        this.id_game = id_game;
        this.id_games_list = id_games_list;
    }

    public AddGames() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_game() {
        return id_game;
    }

    public void setId_game(int id_game) {
        this.id_game = id_game;
    }

    public int getId_games_list() {
        return id_games_list;
    }

    public void setId_games_list(int id_games_list) {
        this.id_games_list = id_games_list;
    }
    
    
}
