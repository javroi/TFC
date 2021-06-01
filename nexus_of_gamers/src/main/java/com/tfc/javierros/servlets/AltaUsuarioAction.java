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
 *  
 * @author javier
 * 
 * @description Servlet encagado de crear un nuevo usuario
 * 
 */
@WebServlet("/AltaUsuarioAction")
public class AltaUsuarioAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String passw = request.getParameter("password");
        Usuario u = new Usuario(nombre, apellidos, nickname, email, passw);
        GestionUsuarios gUsuario = new GestionUsuarios();
        gUsuario.altaUsuario(nombre, apellidos, nickname, email, passw);
        List<Usuario> lista = gUsuario.existeUsuario();
        Usuario usuario = new Usuario();
        for (int i = 0; i < lista.size(); i++) {
            if(lista.get(i).getNickname().contentEquals(nickname)){
               usuario = lista.get(i);
            }
        }
        request.getSession().setAttribute("usuario", usuario);//Creamos una sesion y pasamos el usuario creado a la sesion
        request.getRequestDispatcher("Controller?op=doCrearLista").forward(request, response);

    }
}
