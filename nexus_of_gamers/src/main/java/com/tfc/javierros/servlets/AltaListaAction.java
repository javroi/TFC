/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.servlets;

import com.tfc.javierros.domain.GestionListaJuegos;
import com.tfc.javierros.modelo.ListaJuegos;
import com.tfc.javierros.modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javie
 */
@WebServlet("/AltaListaAction")
public class AltaListaAction extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        GestionListaJuegos glj = new GestionListaJuegos();
        System.out.println(u.getId_user());
        ListaJuegos listaJuegos = glj.altaLista(u.getId_user());
        request.getRequestDispatcher("ControllerUsuario?op=toHome").forward(request, response);

    }
    
}
