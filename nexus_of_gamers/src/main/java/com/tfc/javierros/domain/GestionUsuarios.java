package com.tfc.javierros.domain;

import com.tfc.javierros.modelo.Usuario;
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
 * @description Controlador encargado de la gestion de la clase de Usuario
 * 
 */
public class GestionUsuarios {
    
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
     
     * @name altaUsuario
     * 
     * @description Metodo para crear un usuario
     * 
     * @param nombre
     * @param apellidos
     * @param nickname
     * @param email
     * @param passw
     * 
     */ 
    public void altaUsuario(String nombre, String apellidos, String nickname, String email, String passw) {
        Usuario u = new Usuario(nombre, apellidos, nickname, email, passw);
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(u);
        tx.commit();
    }
    
    /**
     *
     * @name existeUsuario
     * 
     * @description Metodo para traer una lista todas los usuarios
     * 
     * @return  lista
     * 
     */ 
    public List<Usuario> existeUsuario(){
        EntityManager em = getEntityManager();
        TypedQuery<Usuario> qr = em.createQuery("Select u from Usuario u", Usuario.class);
        List<Usuario> lista = qr.getResultList();
  
        return lista;
    } 
    
    /**
     *
     * @name ModificarUsuario
     * 
     * @description Metodo para actualizar una review
     * 
     * @param id_user
     * @param name
     * @param surname
     * @param password
     * @param nickname
     * @param email
     * 
     */
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
