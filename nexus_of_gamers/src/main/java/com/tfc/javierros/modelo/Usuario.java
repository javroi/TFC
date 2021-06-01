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
 * @description Clase de Usuario la cual tiene su id, el nombre, el apellido, un nickname, un email y la contrasenya
 * 
 */
@Entity
@Table(name = "user")
public class Usuario implements Serializable {

    @Id
    @Column(name = "id_user")
    private int id_user;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "surname")
    private String surname;
    
    @Column(name = "nickname")
    private String nickname;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "password")
    private String password;

    public Usuario() {
    }

    public Usuario(int id_user) {
        this.id_user = id_user;
    }

    public Usuario(int id_user, String name, String surname, String nickname, String email, String password) {
        this.id_user = id_user;
        this.name = name;
        this.surname = surname;
        this.nickname = nickname;
        this.email = email;
        this.password = password;
    }

    public Usuario(String name, String surname, String nickname, String email, String password) {
        this.name = name;
        this.surname = surname;
        this.nickname = nickname;
        this.email = email;
        this.password = password;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



}
