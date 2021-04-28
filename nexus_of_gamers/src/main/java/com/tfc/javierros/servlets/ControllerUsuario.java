/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 * Servlet de controller para todo el tema de usuarios
 */
@WebServlet("/ControllerUsuario")
public class ControllerUsuario extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        String url = "";
        switch (op) {
            case "toNuevoUsuario":
                url = "singup.jsp";
                break;
                
            case "toCargarUsuario":
                url = "singin.jsp";
                break;
             
            case "toHome":
                url = "home.jsp";
                break;
                
            case "doCrearUsuario":
                url = "AltaUsuarioAction";
                break;
                
            case "doVerificarUsuario":
                url = "AltaUsuarioAction";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
}
