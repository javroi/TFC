<%-- 
    Document   : perfil
    Created on : 4 may. 2021, 16:13:42
    Author     : javie
--%>
<%@page import="com.tfc.javierros.domain.GestionAddGames"%>
<%@page import="com.tfc.javierros.modelo.AddGames"%>
<%@page import="com.tfc.javierros.modelo.ListaJuegos"%>
<%@page import="com.tfc.javierros.domain.GestionListaJuegos"%>
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
                        String actualizado = request.getParameter("actualizado");
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

        <div>
            <nav>
                <form name="seleccion" method="post">
                    <input type="submit" name="jugados" value="Jugado">
                    <input type="submit" name="jugando" value="Jugando">
                    <input type="submit" name="pendientes" value="Pendiente">
                </form>
            </nav>
            <ul class="navega">
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
                                                out.print("<li><a href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><img src=\"images/" + juegos.get(j).getCaratula() + "\" width=\"150\" height=\"200\"></a>");
                                                out.print("</li>");
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
                                                out.print("<li><a href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><img src=\"images/" + juegos.get(j).getCaratula() + "\" width=\"150\" height=\"200\"></a>");
                                                out.print("</li>");
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
                                                out.print("<li><a href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><img src=\"images/" + juegos.get(j).getCaratula() + "\" width=\"150\" height=\"200\"></a>");
                                                out.print("</li>");
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
                                                out.print("<li><a href=\"juego.jsp?juego=");
                                                out.print(juegos.get(j).getNombre());
                                                out.print("\"><img src=\"images/" + juegos.get(j).getCaratula() + "\" width=\"150\" height=\"200\"></a>");
                                                out.print("</li>");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                %>
            </ul>
            <a href="ControllerUsuario?op=toModificarUsuario">Modificar datos de usuario</a>

    </body>
</html>
