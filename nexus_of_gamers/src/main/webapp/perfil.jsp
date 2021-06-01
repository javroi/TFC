<%-- 
    Document   : perfil
    Created on : 4 may. 2021, 16:13:42
    Author     : javier
--%>
<%@page import="com.tfc.javierros.domain.GestionAddGames"%>
<%@page import="com.tfc.javierros.modelo.AddGames"%>
<%@page import="com.tfc.javierros.modelo.ListaJuegos"%>
<%@page import="com.tfc.javierros.domain.GestionListaJuegos"%>
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
        <title>The nexus of gamers</title>
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
                        String actualizado = request.getParameter("actualizado");
                        if (u == null) {
                            response.sendRedirect("Controller?op=toIndex");
                        } else {
                            out.print("<a href=\"perfil.jsp\">Perfil</a>");


                    %>
                    <a href="Controller?op=toSalir">Cerrar Sesion</a>
                </nav>
            </div>
        </header>

        <div class ="perfil_juegos">
            <h2>Estos son tus juegos <%
                    out.print(u.getName());
                %>:</h2>
            <nav>
                <div class = "form_perfil">
                    <form name="seleccion" method="post">
                        <input type="submit" name="jugados" class ="estados" value="Jugado">
                        <input type="submit" name="jugando" class ="estados" value="Jugando">
                        <input type="submit" name="pendientes" class ="estados" value="Pendiente">
                    </form>
                </div>
            </nav>
            <div class="gallery-container-user">
                <%                        if (request.getParameter("buscar") != null) {
                            response.sendRedirect("buscar.jsp?juego=" + request.getParameter("buscador"));
                        }
                        GestionAddGames gAdGestionJuegos = new GestionAddGames();
                        GestionListaJuegos gLJuegos = new GestionListaJuegos();
                        List<AddGames> adds;

                        adds = gAdGestionJuegos.traerAdd();

                        List<Juego> juegos = gJuego.traerJuegos();
                        List<ListaJuegos> listas = gLJuegos.traerListas();

                        ListaJuegos lista = new ListaJuegos();
                        Juego juego = new Juego();

                        for (int i = 0; i < listas.size(); i++) {
                            if (listas.get(i).getId_user() == u.getId_user()) {
                                lista = listas.get(i);
                            }
                        }
                        if (request.getParameter("jugados") == null && request.getParameter("jugando") == null && request.getParameter("pendientes") == null) {
                            for (int i = 0; i < adds.size(); i++) {
                                if (adds.get(i).getId_games_list() == lista.getId()) {
                                    juego.setId_game(adds.get(i).getId_game());
                                    for (int j = 0; j < juegos.size(); j++) {
                                        if (juegos.get(j).getId_game() == juego.getId_game()) {
                                            if (juegos.get(j).getEstado() == 2) {
                                                out.print("<div class=\"gallery_item\"><a class=\"gallery_enlace\" href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><h2 class=\"gallery_title\">" + juegos.get(j).getNombre() + "</h2><img src=\"images/" + juegos.get(j).getCaratula() + "\" class=\"gallery_img_perfil\"></a>");
                                                out.print("</div>");
                                            }
                                        }
                                    }
                                }

                            }
                        } else if (request.getParameter("jugados") != null) {
                            for (int i = 0; i < adds.size(); i++) {
                                if (adds.get(i).getId_games_list() == lista.getId()) {
                                    juego.setId_game(adds.get(i).getId_game());
                                    for (int j = 0; j < juegos.size(); j++) {
                                        if (juegos.get(j).getId_game() == juego.getId_game()) {
                                            System.out.println(juegos.get(j).getEstado());
                                            if (juegos.get(j).getEstado() == 2) {
                                                out.print("<div class=\"gallery_item\"><a class=\"gallery_enlace\" href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><h2 class=\"gallery_title\">" + juegos.get(j).getNombre() + "</h2><img src=\"images/" + juegos.get(j).getCaratula() + "\" class=\"gallery_img_perfil\"></a>");
                                                out.print("</div>");
                                            }
                                        }
                                    }
                                }
                            }
                        } else if (request.getParameter("jugando") != null) {
                            for (int i = 0; i < adds.size(); i++) {
                                if (adds.get(i).getId_games_list() == lista.getId()) {
                                    juego.setId_game(adds.get(i).getId_game());
                                    for (int j = 0; j < juegos.size(); j++) {
                                        if (juegos.get(j).getId_game() == juego.getId_game()) {
                                            if (juegos.get(j).getEstado() == 3) {
                                                out.print("<div class=\"gallery_item\"><a class=\"gallery_enlace\" href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><h2 class=\"gallery_title\">" + juegos.get(j).getNombre() + "</h2><img src=\"images/" + juegos.get(j).getCaratula() + "\" class=\"gallery_img_perfil\"></a>");
                                                out.print("</div>");
                                            }
                                        }
                                    }
                                }
                            }
                        } else if (request.getParameter("pendientes") != null) {
                            for (int i = 0; i < adds.size(); i++) {
                                if (adds.get(i).getId_games_list() == lista.getId()) {
                                    juego.setId_game(adds.get(i).getId_game());
                                    for (int j = 0; j < juegos.size(); j++) {
                                        if (juegos.get(j).getId_game() == juego.getId_game()) {
                                            if (juegos.get(j).getEstado() == 4) {
                                                out.print("<div class=\"gallery_item\"><a class=\"gallery_enlace\" href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><h2 class=\"gallery_title\">" + juegos.get(j).getNombre() + "</h2><img src=\"images/" + juegos.get(j).getCaratula() + "\" class=\"gallery_img_perfil\"></a>");
                                                out.print("</div>");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                %>
            </div>
            <div class="modificacion">
                <a href="Controller?op=toModificarUsuario">Modificar datos de usuario</a>
            </div>
    </body>
</html>
