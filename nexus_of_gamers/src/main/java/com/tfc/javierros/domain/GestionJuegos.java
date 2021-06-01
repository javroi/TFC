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
 * @author javier
 * 
 * @description Controlador encargado de la gestion de la clase de Juegos
 * 
 */
public class GestionJuegos {
    
    /**
     *
     * @name getEntityManager
     * 
     * @description Metodo que crea el EntityManager
     * 
     * @return  factory.createEntityManager()
     * 
     */
    private EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebPU");
        return factory.createEntityManager();
    }
    
    /**
     *
     * @name altaJuego
     * 
     * @description Metodo para anyadir un juego a la base de datos
     * 
     * @param nombre
     * @param compania
     * @param resumen
     * @param caratula
     * @param genero
     * @param estado
     * 
     */ 
    public void altaJuego(String nombre, String compania, String resumen, String caratula, String genero, int estado) {
        Juego j = new Juego(nombre, compania, resumen, caratula,genero,estado);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(j);
        tx.commit();
    }
    
    /**
     *
     * @name traerJuegos
     * 
     * @description Metodo para traer una lista con todos los juegos de la base de datos 
     * 
     * @return  lista
     * 
     */  
    public List<Juego> traerJuegos(){
        EntityManager em = getEntityManager();
        TypedQuery<Juego> qr = em.createQuery("Select u from Juego u", Juego.class);
        List<Juego> lista = qr.getResultList();
  
        return lista;
    } 
    
    /**
     *
     * @name ActualizarEstado
     * 
     * @description Metodo para actualizar el estado de un juego
     * 
     * @param id_juego
     * @param estado
     * 
     */ 
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
