/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.domain;

import com.tfc.javierros.modelo.Usuario;
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
public class GestionUsuarios {

    private EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebPU");
        return factory.createEntityManager();
    }

    //Metodo para dar de alta un usuario
    public void altaUsuario(String nombre, String apellidos, String nickname, String email, String passw) {
        Usuario u = new Usuario(nombre, apellidos, nickname, email, passw);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(u);
        tx.commit();
    }
    
    //Metodo para devolver la lista de todos los usuarios
    public List<Usuario> existeUsuario(){
        EntityManager em = getEntityManager();
        TypedQuery<Usuario> qr = em.createQuery("Select u from Usuario u", Usuario.class);
    
        return qr.getResultList();
    }
    
    //Metodo a medias
    public void altaLista(int id_user) {
        ListaJuegos listaJuegos = new ListaJuegos(id_user);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(listaJuegos);
        tx.commit();
    }
}
