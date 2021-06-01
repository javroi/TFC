<%-- 
    Document   : home
    Created on : 25 abr. 2021, 10:22:23
    Author     : javier
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.tfc.javierros.servlets.Controller"%>
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
                            response.sendRedirect("Controller?op=toIndex");
                        }
                        out.print("<a href=\"perfil.jsp\">Perfil</a>");

                        if (request.getParameter("buscar") != null) {
                            response.sendRedirect("buscar.jsp?juego=" + request.getParameter("buscador"));
                        }
                    %>
                    <a href="Controller?op=toSalir">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <div class="gallery-container">
            <%
                for (int i = 0; i < juegos.size(); i++) {
                    out.print("<div class=\"gallery_item\"><a class=\"gallery_enlace\" href=\"juego.jsp?juego=");
                    out.print(juegos.get(i).getNombre());
                    out.print("\"><h2 class=\"gallery_title\">" + juegos.get(i).getNombre() + "</h2><img src=\"images/" + juegos.get(i).getCaratula() + "\" class=\"gallery_img\"></a>");
                    out.print("</div>");
                }

            %>
        </div>

    </body>
</html>
