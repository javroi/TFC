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
 * @description Clase de Juego la cual contiene su id, el nombre, la empresa, un resumen, 
 *              el genero, el nombre de la caratula y su estado
 * 
 */
@Entity
@Table(name = "game")
public class Juego implements Serializable{
    
    @Id
    @Column(name = "id_game")
    private int id_game;
    
    @Column(name = "name")
    private String nombre;
    
    @Column(name = "company")
    private String empresa;
    
    @Column(name = "summary")
    private String resumen;
    
    @Column(name = "genero")
    private String genero;
    
    @Column(name = "caratula")
    private String caratula;
    
    @Column(name = "estado")
    private int estado;

    public Juego() {
    }

    public Juego(String name, String company, String summary, String caratula, String genero, int estado) {
        nombre= name;
        empresa = company;
        resumen = summary;
        this.genero = genero;
        this.caratula = caratula;
        this.estado = estado;
    }

    public int getId_game() {
        return id_game;
    }

    public void setId_game(int id_game) {
        this.id_game = id_game;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getCaratula() {
        return caratula;
    }

    public void setCaratula(String caratula) {
        this.caratula = caratula;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
    
    
    
}
