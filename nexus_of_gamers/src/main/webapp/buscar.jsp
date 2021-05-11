<%-- 
    Document   : buscar
    Created on : 9 may. 2021, 11:14:30
    Author     : javie
--%>

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
        <title>Nexus Of Gamers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="styles/styles.css" rel="stylesheet" type="text/css">
    </head>

    <body >
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
                        List<Juego> juegos = gJuego.traerJuegos();
                        Usuario u = (Usuario) session.getAttribute("usuario");
                        if (u == null) {
                            response.sendRedirect("index.html");
                        } else {
                            out.print("<a href=\"perfil.jsp\">Perfil</a>");
                            out.print(u.getNickname());
                        }

                    %>
                    <a href="ControllerUsuario?op=toSalir">Cerrar Sesion</a>
                    <p>

                    </p>
                </nav>
            </div>
        </header>
    <body>
        <%            
            boolean encontrado = false;
            String nombre_j = request.getParameter("juego").toLowerCase();
            for (int i = 0; i < juegos.size(); i++) {
                String nombre_jbd = juegos.get(i).getNombre().toLowerCase();
                if (nombre_jbd.contentEquals(nombre_j)) {
                    out.print("<li><a href=\"juego.jsp?juego=");
                    out.print(juegos.get(i).getNombre());
                    out.print("\"><img src=\"images/" + juegos.get(i).getCaratula() + "\" width=\"150\" height=\"200\"></a>");
                    out.print("</li>");
                    encontrado = true;
                }
            }
            if (!encontrado) {
                out.print("<p>Juego no encontrado</p>");
            }
            if (request.getParameter("buscar") != null) {
                response.sendRedirect("buscar.jsp?juego="+request.getParameter("buscador"));
            }



        %>
    </body>
</html>
