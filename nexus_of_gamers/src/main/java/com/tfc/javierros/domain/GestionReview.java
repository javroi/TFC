/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.domain;

import com.tfc.javierros.modelo.Review;
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
public class GestionReview {
    
    private EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebPU");
        return factory.createEntityManager();
    }
    
    public void altaReview(int id_juego, int id_usuario, int grade, String text) {
        Review review = new Review(id_usuario, id_juego, grade, text);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(review);
        tx.commit();
    }
    
    public List<Review> traerAdd(){
        EntityManager em = getEntityManager();
        TypedQuery<Review> qr = em.createQuery("Select r from Review r", Review.class);
        List<Review> review = qr.getResultList();

        
        return review;
    } 
    
    public void ModificarReview(int id_review, int id_juego, int id_usuario, int grade, String text) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        String jpql = "Update Review Set id_user = ?1, id_game = ?2, nota = ?3, texto = ?4 Where id = ?5";
        TypedQuery<Review> qr = em.createQuery(jpql, Review.class);
        qr.setParameter(1, id_usuario);
        qr.setParameter(2, id_juego);
        qr.setParameter(3, grade);
        qr.setParameter(4, text);
        qr.setParameter(5, id_review);
        qr.executeUpdate();
        tx.commit();
    }
    
}
