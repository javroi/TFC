<%-- 
    Document   : modificar.jsp
    Created on : 7 may. 2021, 18:02:52
    Author     : javie
--%>
<%@page import="com.tfc.javierros.domain.GestionUsuarios"%>
<%@page import="com.tfc.javierros.modelo.AddGames"%>
<%@page import="com.tfc.javierros.modelo.ListaJuegos"%>
<%@page import="com.tfc.javierros.domain.GestionListaJuegos"%>
<%@page import="com.tfc.javierros.domain.GestionAddGames"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.tfc.javierros.servlets.ControllerUsuario"%>
<%@page import="com.tfc.javierros.domain.GestionJuegos"%>
<%@page import="com.tfc.javierros.modelo.Juego"%>
<%@page import="com.tfc.javierros.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="styles/styles.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header>
            <div class="wrapper">
                <div class="logo"><a href="home.jsp"><img src="images/logo_redux_large.png" width="150"
                                                          height="200"></a></div>

                <nav>
                    <form method="post">		    
                        <input type="search" placeholder="Search..." name="buscador" value="">	
                        <input type="submit" id="buscar" name="buscar">
                    </form>
                    <%
                        GestionJuegos gJuego = new GestionJuegos();
                        Usuario u = (Usuario) session.getAttribute("usuario");
                        if (u == null) {
                            response.sendRedirect("ControllerUsuario?op=toIndex");
                        } else {
                            out.print("<a href=\"perfil.jsp\">Perfil</a>");
                            out.print(u.getNickname());
                        

                    %>
                    <a href="ControllerUsuario?op=toSalir">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <h3>Datos del usuario</h3>
        <%
            
            GestionUsuarios gestionUsuarios = new GestionUsuarios();
            out.print("<h4><b>Nombre: </b>"+u.getName()+"</h4>");
            out.print("<h4><b>Apellidos: </b>"+u.getSurname()+"</h4>");
            out.print("<h4><b>Nickname: </b>"+u.getNickname()+"</h4>");
            out.print("<h4><b>Email: </b>"+u.getEmail()+"</h4>");
        %>
        <p>Introduzca los campos que se quiera modificar de su usuario</p>
        <form name="modificacion" method="post">
            <input type="text" name="nombre" placeholder="Nombre" value=""></br>
            <input type="text" name="apellido" placeholder="Apellidos" value=""></br>
            <input type="text" name="nickname" placeholder="Nickname" value=""></br>
            <input type="text" name="email" placeholder="Email" value=""></br>
            <input type="text" name="contrasenya" placeholder="Contraseña" value=""></br>
            <input type="submit" name="enviar" placeholder="Enviar">
        </form>
        <%    
            if(request.getParameter("enviar") != null){
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String nickname = request.getParameter("nickname");
                String email = request.getParameter("email");
                String pass = request.getParameter("contrasenya");
                
                if(nombre.contentEquals("")){
                    nombre = u.getName();
                }
                if(apellido.contentEquals("")){
                    System.out.println(u.getSurname());
                    apellido = u.getSurname();
                }
                if(nickname.contentEquals("")){
                    System.out.println(u.getNickname());
                    nickname = u.getNickname();
                }
                if(email.contentEquals("")){
                    System.out.println(u.getEmail());
                    email = u.getEmail();
                }
                if(pass.contentEquals("")){
                    System.out.println(u.getPassword());
                    pass = u.getPassword();
                }
                
                gestionUsuarios.ModificarUsuario(u.getId_user(), nombre, apellido, nickname, email, pass);
                Usuario u2 = new Usuario(nombre, apellido, nickname, email, pass);
                session.setAttribute("usuario", u2);
            }
            }
        %>
    </body>
</html>
