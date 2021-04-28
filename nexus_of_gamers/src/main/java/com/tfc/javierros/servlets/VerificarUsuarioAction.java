/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.servlets;

import com.tfc.javierros.domain.GestionUsuarios;
import com.tfc.javierros.modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javie
 */
@WebServlet("/VerificarUsuarioAction")
public class VerificarUsuarioAction {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    //Servlet que se encarga de verificar si el usuario existe ya
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        Usuario u = new Usuario();
        GestionUsuarios gUsuario = new GestionUsuarios();
        List<Usuario> listaUsuarios = gUsuario.existeUsuario();
        for (int i = 0; i < listaUsuarios.size(); i++) {
            if (listaUsuarios.get(i).getNickname().contentEquals(nickname)) {
                u.setId_user(listaUsuarios.get(i).getId_user());
                u.setEmail(listaUsuarios.get(i).getEmail());
                u.setName(listaUsuarios.get(i).getName());
                u.setNickname(listaUsuarios.get(i).getNickname());
                u.setPassword(listaUsuarios.get(i).getPassword());
                u.setSurname(listaUsuarios.get(i).getSurname());
            }
        }
        request.getSession().setAttribute("usuario", u);
        request.getRequestDispatcher("home.jsp").forward(request, response);

    }
}
