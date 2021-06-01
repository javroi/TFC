package com.tfc.javierros.servlets;

import com.tfc.javierros.domain.GestionListaJuegos;
import com.tfc.javierros.modelo.Usuario;
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
 * @description Servlet encagado de crear y asignar una lista de juegos cada vez
 *             que se crea un nuevo usuario
 * 
 */
@WebServlet("/AltaListaAction")
public class AltaListaAction extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        GestionListaJuegos glj = new GestionListaJuegos();
        System.out.println(u.getId_user());
        glj.altaLista(u.getId_user());
        request.getRequestDispatcher("Controller?op=doRellenarListaJuegos").forward(request, response);

    }
    
}
