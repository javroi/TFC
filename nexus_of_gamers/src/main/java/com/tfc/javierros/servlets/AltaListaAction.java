/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.servlets;

import com.tfc.javierros.domain.GestionUsuarios;
import com.tfc.javierros.modelo.ListaJuegos;
import com.tfc.javierros.modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javie
 */
@WebServlet("/AltaListaAction")
public class AltaListaAction {
    
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        ListaJuegos listaJuegos = new ListaJuegos(u.getId_user());
        GestionUsuarios gUsuarios = new GestionUsuarios();
        gUsuarios.altaLista(u.getId_user());
        request.getSession().setAttribute("lista", listaJuegos);
        request.getRequestDispatcher("home.jsp").forward(request, response);

    }
    
}
