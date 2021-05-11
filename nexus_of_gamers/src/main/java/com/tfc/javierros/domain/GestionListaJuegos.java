/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.domain;

import com.tfc.javierros.modelo.ListaJuegos;
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
public class GestionListaJuegos {

    private EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebPU");
        return factory.createEntityManager();
    }
    
    public ListaJuegos altaLista(int id_user) {
        System.out.println(id_user);
        ListaJuegos listaJuegos = new ListaJuegos(id_user);
        System.out.println(listaJuegos.getId_user());
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(listaJuegos);
        tx.commit();
        return listaJuegos;
    }
    
    public List<ListaJuegos> traerListas(){
        EntityManager em = getEntityManager();
        TypedQuery<ListaJuegos> qr = em.createQuery("Select u from ListaJuegos u", ListaJuegos.class);
        List<ListaJuegos> lista = qr.getResultList();
  
        return lista;
    } 
}
