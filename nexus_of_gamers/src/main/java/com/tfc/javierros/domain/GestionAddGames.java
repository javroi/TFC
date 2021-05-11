/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.domain;

import com.tfc.javierros.modelo.AddGames;
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
public class GestionAddGames {

    private EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebPU");
        return factory.createEntityManager();
    }

    public void altaAnyadir(int id_juego, int id_lista) {
        AddGames add = new AddGames(id_juego, id_lista);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(add);
        tx.commit();
    }

    public List<AddGames> traerAdd() {
        EntityManager em = getEntityManager();
        TypedQuery<AddGames> qr = em.createQuery("Select u from AddGames u", AddGames.class);
        List<AddGames> add = qr.getResultList();

        return add;
    }

    public void ModificarEstado(int id_add, String estado) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        System.out.println(estado);
        String jpql = "Update AddGames Set estado = ?1 Where id_add_games = ?2";
        TypedQuery<AddGames> qr = em.createQuery(jpql, AddGames.class);
        qr.setParameter(1, estado);
        qr.setParameter(2, id_add);
        qr.executeUpdate();
        tx.commit();

    }


}
