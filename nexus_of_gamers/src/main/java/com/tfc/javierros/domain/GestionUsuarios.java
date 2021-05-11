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
        List<Usuario> lista = qr.getResultList();
  
        return lista;
    } 
    
    public void ModificarUsuario(int id_user, String name, String surname, String nickname, String email, String password) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        String jpql = "Update Usuario Set name = ?1, surname = ?2, nickname = ?3, email = ?4, password = ?5 Where id_user = ?6";
        TypedQuery<Usuario> qr = em.createQuery(jpql, Usuario.class);
        qr.setParameter(1, name);
        qr.setParameter(2, surname);
        qr.setParameter(3, nickname);
        qr.setParameter(4, email);
        qr.setParameter(5, password);
        qr.setParameter(6, id_user);
        qr.executeUpdate();
        tx.commit();
    }
}
