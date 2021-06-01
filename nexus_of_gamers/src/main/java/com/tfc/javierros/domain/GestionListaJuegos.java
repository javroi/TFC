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
 * @author javier
 * 
 * @description Controlador encargado de la gestion de la clase de ListaJuegos
 * 
 */
public class GestionListaJuegos {

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
     * @name altaLista
     * 
     * @description Metodo para crear una lista en la base de datos
     * 
     * @param id_user
     * 
     */ 
    public void altaLista(int id_user) {
        ListaJuegos listaJuegos = new ListaJuegos(id_user);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(listaJuegos);
        tx.commit();
    }
    
    /**
     *
     * @name traerListas
     * 
     * @description Metodo para traer un la lista de juegos de un usuario
     * 
     * @return  lista
     * 
     */  
    public List<ListaJuegos> traerListas(){
        EntityManager em = getEntityManager();
        TypedQuery<ListaJuegos> qr = em.createQuery("Select u from ListaJuegos u", ListaJuegos.class);
        List<ListaJuegos> lista = qr.getResultList();
  
        return lista;
    } 
}
