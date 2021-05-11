/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.domain;

import com.tfc.javierros.modelo.Juego;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author javie
 */
public class GestionJuegos {
    
    private EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebPU");
        return factory.createEntityManager();
    }
    
    public void altaUsuario(String nombre, String compania, String resumen, String caratula, String genero, int estado) {
        Juego j = new Juego(nombre, compania, resumen, caratula,genero,estado);
        System.out.println(j.getResumen());
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(j);
        tx.commit();
    }
    
    public List<Juego> traerJuegos(){
        EntityManager em = getEntityManager();
        TypedQuery<Juego> qr = em.createQuery("Select u from Juego u", Juego.class);
        List<Juego> lista = qr.getResultList();
  
        return lista;
    } 
    
    public void ActualizarEstado(int id_juego, int estado) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        String jpql = "Update Juego Set estado = ?1 Where id_game = ?2";
        TypedQuery<Juego> qr = em.createQuery(jpql, Juego.class);
        qr.setParameter(1, estado);
        qr.setParameter(2, id_juego);
        qr.executeUpdate();
        tx.commit();

    }
}
