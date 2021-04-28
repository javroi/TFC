/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.servlets;

import com.mysql.cj.Session;
import com.tfc.javierros.domain.GestionUsuarios;
import com.tfc.javierros.modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

/**
 * Servlet implementation class AltaUsuarioAction
 */
@WebServlet("/AltaUsuarioAction")
public class AltaUsuarioAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String passw = request.getParameter("password");
        Usuario u = new Usuario(nombre, apellidos, nickname, email, passw);
        boolean existe = false;
        //creamos un objeto de la capa de lgica de negocio
        //y llamamos al método encargado de hacer el alta
        GestionUsuarios gUsuario = new GestionUsuarios();
        gUsuario.altaUsuario(nombre, apellidos, nickname, email, passw);
        request.getSession().setAttribute("usuario", u);
        Usuario u2 = (Usuario) request.getSession().getAttribute("usuario");
        request.getRequestDispatcher("AltaListaAction").forward(request, response);

    }
}
