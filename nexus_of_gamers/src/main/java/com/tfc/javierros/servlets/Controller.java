package com.tfc.javierros.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author javier
 * 
 * @description Servlet encagado de almacenar todas las direcciones de la aplicaciones
 *              y despues dirigir a estas
 * 
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        String url = "";
        switch (op) {
            case "toIndex":
                url = "index.html";
                break;
            
            case "toNuevoUsuario":
                url = "singup.jsp";
                break;

            case "toCargarUsuario":
                url = "singin.jsp";
                break;

            case "toHome":
                url = "home.jsp";
                break;
                
            case "toBuscar":
                url = "buscar.jsp";
                break;

            case "toJuego":
                url = "juego.jsp";
                break;
                
            case "toSalir":
                url = "logout.jsp";
                break;
                
            case "toModificarUsuario":
                url = "modificar.jsp";
                break;

            case "doCrearUsuario":
                url = "AltaUsuarioAction";
                break;

            case "doCrearLista":
                url = "AltaListaAction";
                break;
            
            case "doRellenarListaJuegos":
                url = "LeerJsonAction";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
}
