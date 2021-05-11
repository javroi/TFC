<%-- 
    Document   : juego.jsp
    Created on : 2 may. 2021, 18:13:30
    Author     : javie
--%>

<%@page import="com.tfc.javierros.domain.GestionReview"%>
<%@page import="com.tfc.javierros.modelo.Review"%>
<%@page import="com.tfc.javierros.domain.GestionAddGames"%>
<%@page import="com.tfc.javierros.modelo.AddGames"%>
<%@page import="com.tfc.javierros.domain.GestionListaJuegos"%>
<%@page import="com.tfc.javierros.modelo.ListaJuegos"%>
<%@page import="com.tfc.javierros.domain.GestionJuegos"%>
<%@page import="com.tfc.javierros.modelo.Juego"%>
<%@page import="java.util.List"%>
<%@page import="com.tfc.javierros.servlets.ControllerUsuario"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.tfc.javierros.domain.GestionUsuarios"%>
<%@page import="com.tfc.javierros.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>The nexus of gamers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="styles/styles.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            String nombre = request.getParameter("juego");
            String opcion = null;
            GestionJuegos gJuegos = new GestionJuegos();
            GestionReview gReview = new GestionReview();
            GestionListaJuegos gListaJuegos = new GestionListaJuegos();
            GestionAddGames gAddGames = new GestionAddGames();

            List<Juego> juegos = gJuegos.traerJuegos();
            List<ListaJuegos> listas = gListaJuegos.traerListas();
            List<AddGames> add = gAddGames.traerAdd();
            List<Review> reviews = gReview.traerAdd();

            ListaJuegos listaJuegos = new ListaJuegos();
            Juego juego = new Juego();
            Usuario u = (Usuario) session.getAttribute("usuario");
            AddGames addGame = new AddGames();
            boolean juegoenlista = false;
            int nota = 0;
            List<Integer> notas = new ArrayList<>();
        %>
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
                        if (u == null) {
                            response.sendRedirect("ControllerUsuario?op=toIndex");
                        } else {
                            out.print("<a href=\"perfil.jsp\">Perfil</a>");
                        
                    %>
                    <a href="ControllerUsuario?op=toSalir">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <%            if (request.getParameter("buscar") != null) {
                response.sendRedirect("buscar.jsp?juego=" + request.getParameter("buscador"));
            }
            for (int i = 0; i < juegos.size(); i++) {
                if (juegos.get(i).getNombre().contentEquals(nombre)) {
                    juego = juegos.get(i);
                }
            }
            for (int i = 0; i < listas.size(); i++) {
                if (listas.get(i).getId_user() == u.getId_user()) {
                    listaJuegos = listas.get(i);
                }
            }
            for (int i = 0; i < listas.size(); i++) {
                if (listas.get(i).getId_user() == u.getId_user()) {
                    listaJuegos = listas.get(i);
                }
            }
            for (int i = 0; i < add.size(); i++) {
                if (add.get(i).getId_games_list() == listaJuegos.getId()) {
                    if (add.get(i).getId_game() == juego.getId_game()) {
                        juegoenlista = true;
                        addGame = add.get(i);
                    }
                }
            }
            %>
            <div class="radio">
            <%
            if (juegoenlista) {
                out.print("<h2 id=\"titulo_radio\">Modificar estado del juego</h2>");
                out.print("<form name=\"seleccion\" method=\"post\" action=\"\">");
                out.print("<input type=\"radio\" name = \"add\" value=\"Jugado\" id=\"opcion1\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion1\"> Jugado </label>");
                out.print("<input type=\"radio\" name = \"add\" value=\"Jugando\" id=\"opcion2\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion2\"> Jugando </label>");
                out.print("<input type=\"radio\" name = \"add\" value=\"Pendiente\" id=\"opcion3\" class=\"radio__input\"> <label class=\"radio__label\" for=\"opcion3\"> Pendiente </label>");
                out.print("<input type=\"submit\" name=\"modificar\" value=\"Modificar\" id=\"radio_sub\">");
                out.print("</form>");
            } else {
                out.print("<h2 id=\"titulo_radio\">Añadir un juego</h2>");
                 out.print("<form name=\"seleccion\" method=\"post\" action=\"\">");
                out.print("<input type=\"radio\" name = \"add\" value=\"Jugado\" id=\"opcion1\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion1\"> Jugado </label>");
                out.print("<input type=\"radio\" name = \"add\" value=\"Jugando\" id=\"opcion2\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion2\"> Jugando </label>");
                out.print("<input type=\"radio\" name = \"add\" value=\"Pendiente\" id=\"opcion3\" class=\"radio__input\"> <label class=\"radio__label\" for=\"opcion3\"> Pendiente </label>");
                out.print("<input type=\"submit\" name=\"anyadir\" value=\"Añadir\" id=\"radio_sub\">");
                out.print("</form>");
            }
        %>
            </div>
            <div class="datos">
        <%
                for (int i = 0; i < juegos.size(); i++) {
                    if (juegos.get(i).getNombre().contentEquals(nombre)) {
                        out.print("<img id=\"caratula_j\" src=\"images/" + juegos.get(i).getCaratula() + "\">");
                        out.print("<div class=\"caja_datos\"><p class=\"datos_categoria\">Titulo:</p><p class=\"datos_juego\">" + juegos.get(i).getNombre() + "</p>");
                        out.print("<p class=\"datos_categoria\">Empresa:</p><p class=\"datos_juego\">" + juegos.get(i).getEmpresa() + "</p>");
                        out.print("<p class=\"datos_categoria\">Genero:</p><p class=\"datos_juego\">" + juegos.get(i).getGenero() + "</p>");
                        out.print("<p class=\"datos_categoria\">Descripción:</p><p class=\"datos_juego\">" + juegos.get(i).getResumen() + "</p>");
                        juego = juegos.get(i);
                    }
                }

                if (request.getParameter("add") != null) {
                    opcion = request.getParameter("add");
                }

                if (request.getParameter("anyadir") != null) {
                    int estado = 0;
                    switch(opcion){
                        case "Jugado":
                            estado = 2;
                            break;
                        case "Jugando":
                            estado = 3;
                            break;
                        case "Pendiente":
                            estado = 4;
                            break;
                                    
                    }
                    gJuego.ActualizarEstado(juego.getId_game(), estado);
                    gAddGames.altaAnyadir(juego.getId_game(), listaJuegos.getId());

                }
                if (request.getParameter("modificar") != null) {
                    int estado = 0;
                    switch(opcion){
                        case "Jugado":
                            estado = 2;
                            break;
                        case "Jugando":
                            estado = 3;
                            break;
                        case "Pendiente":
                            estado = 4;
                            break;
                                    
                    }
                    gJuego.ActualizarEstado(juego.getId_game(), estado);

                }

                for (int i = 0; i < reviews.size(); i++) {
                    if (reviews.get(i).getId_game() == juego.getId_game()) {
                        notas.add(reviews.get(i).getNota());
                    }
                }

                for (int i = 0; i < notas.size(); i++) {
                    nota = nota + notas.get(i);
                }
                if (nota > 0) {
                    nota = nota / notas.size();
                }
            }
        %>
    <a id="valoracion" href="review.jsp?juego=<%out.print(juego.getId_game());%>">Valoración:<%out.print(nota);%></a>
        
                </div>
            </div>
    </body>
</html>
