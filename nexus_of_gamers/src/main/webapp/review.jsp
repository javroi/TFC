<%-- 
    Document   : review
    Created on : 5 may. 2021, 18:45:29
    Author     : javier
--%>
<%@page import="com.tfc.javierros.modelo.Review"%>
<%@page import="com.tfc.javierros.domain.GestionReview"%>
<%@page import="com.tfc.javierros.domain.GestionJuegos"%>
<%@page import="com.tfc.javierros.modelo.Juego"%>
<%@page import="java.util.List"%>
<%@page import="com.tfc.javierros.servlets.Controller"%>
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
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="styles/styles.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            int id_juego = Integer.parseInt(request.getParameter("juego"));
            int nota = 0;
            GestionUsuarios gUsuario = new GestionUsuarios();
            GestionReview gReview = new GestionReview();
            GestionJuegos gJuegos = new GestionJuegos();

            List<Review> reviews = gReview.traerReview();
            List<Usuario> usuarios = gUsuario.existeUsuario();
            List<Juego> juegos = gJuegos.traerJuegos();

            Juego juego = new Juego();
            Usuario u = (Usuario) session.getAttribute("usuario");
            Review review = new Review();
            int contador = 0;

            for (int i = 0; i < juegos.size(); i++) {
                if (juegos.get(i).getId_game() == id_juego) {
                    juego = juegos.get(i);
                }
            }
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
                            response.sendRedirect("Controller?op=toIndex");
                        } else {
                            out.print("<a href=\"perfil.jsp\">Perfil</a>");

                    %>
                    <a href="Controller?op=toSalir">Cerrar Sesion</a>
                </nav>
            </div>
        </header>
        <div class="popup-wrapper">
            <div class="popup">
                <div class="popup-close">x</div>
                <div class="popup-content">
                    <h3>No puedes dejar la review sin nota o una valoracion escrita</h3>
                </div>
            </div>
        </div>
        <div class="radio_review">
            <form name="review_u" method="post" action="">
                <%                if (request.getParameter("buscar") != null) {
                        response.sendRedirect("buscar.jsp?juego=" + request.getParameter("buscador"));
                    }
                    boolean existe = false;

                    for (int i = 0; i < reviews.size(); i++) {
                        if (reviews.get(i).getId_user() == u.getId_user() && reviews.get(i).getId_game() == juego.getId_game()) {
                            review = reviews.get(i);
                            existe = true;
                        }

                    }

                    if (existe) {
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"1\" id=\"opcion1\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion1\">1</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"2\" id=\"opcion2\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion2\">2</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"3\" id=\"opcion3\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion3\">3</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"4\" id=\"opcion4\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion4\">4</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"5\" id=\"opcion5\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion5\">5</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"6\" id=\"opcion6\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion6\">6</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"7\" id=\"opcion7\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion7\">7</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"8\" id=\"opcion8\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion8\">8</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"9\" id=\"opcion9\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion9\">9</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"10\" id=\"opcion10\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion10\">10</label>");
                        out.print("<textarea rows=\"4\" cols=\"50\" name = \"texto\" placeholder = \"Escriba aqui la descripcion\" id=\"descripcion_review\"></textarea>");
                        out.print("<input type=\"submit\" name=\"modificar_r\" value=\"Modificar\" id=\"radio_sub_review\" >");
                    } else {
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"1\" id=\"opcion1\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion1\">1</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"2\" id=\"opcion2\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion2\">2</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"3\" id=\"opcion3\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion3\">3</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"4\" id=\"opcion4\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion4\">4</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"5\" id=\"opcion5\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion5\">5</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"6\" id=\"opcion6\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion6\">6</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"7\" id=\"opcion7\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion7\">7</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"8\" id=\"opcion8\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion8\">8</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"9\" id=\"opcion9\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion9\">9</label>");
                        out.print("<input  type = \"radio\" name = \"nota\" value = \"10\" id=\"opcion10\" class=\"radio__input\"><label class=\"radio__label\" for=\"opcion10\">10</label>");
                        out.print("<textarea rows=\"4\" cols=\"50\" name = \"texto\" placeholder = \"Escriba aqui la descripcion\" id=\"descripcion_review\"></textarea>");
                        out.print("<input type=\"submit\" name=\"crear_r\" value=\"Crear\" id=\"radio_sub_review\" >");
                    }


                %>
            </form>

        </div>


        <%            for (int i = 0; i < reviews.size(); i++) {
                if (reviews.get(i).getId_game() == juego.getId_game()) {
                    contador++;
                }

            }
            if (contador == 0) {
                out.print("<div class=\"no_reviews\"<p id=\"noreview\">Aun no hay reviews de este juego</p></div>");
            } else {
                for (int i = 0; i < reviews.size(); i++) {
                    for (int j = 0; j < usuarios.size(); j++) {
                        if (reviews.get(i).getId_user() == usuarios.get(j).getId_user() && reviews.get(i).getId_game() == juego.getId_game()) {
                            out.print("<div class=\"reviews\"><p><b>Usuario:</b> " + usuarios.get(j).getNickname() + "</p>");
                            out.print("<p><b>Nota: </b>" + reviews.get(i).getNota() + "</p>");
                            out.print("<p><b>Review: </b>" + reviews.get(i).getTexto() + "</p></div>");
                        }
                    }

                }
            }
            if (request.getParameter("nota") != null) {
                nota = Integer.parseInt(request.getParameter("nota"));
            }
            if (request.getParameter("crear_r") != null) {
                String url = "juego.jsp?juego=" + juego.getNombre();
                String texto = request.getParameter("texto");
                if (nota == 0 || texto.contentEquals("")) {
                    %>
                    <script>
                        const popup = document.querySelector('.popup-wrapper');
                        const close = document.querySelector('.popup-close');

                        popup.style.display = 'block';

                        close.addEventListener('click', () => {
                            popup.style.display = 'none';
                        });

                        popup.addEventListener('click', e => {
                            // console.log(e);
                            if (e.target.className === 'popup-wrapper') {
                                popup.style.display = 'none';
                            }
                        });
                    </script>
                    <%
                } else {
                    gReview.altaReview(juego.getId_game(), u.getId_user(), nota, texto);   
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }
            if (request.getParameter("modificar_r") != null) {
                String url = "juego.jsp?juego=" + juego.getNombre();
                String texto = request.getParameter("texto");
                if (nota == 0 || texto.contentEquals("")) {
                    %>
                    <script>
                        const popup = document.querySelector('.popup-wrapper');
                        const close = document.querySelector('.popup-close');

                        popup.style.display = 'block';

                        close.addEventListener('click', () => {
                            popup.style.display = 'none';
                        });

                        popup.addEventListener('click', e => {
                            // console.log(e);
                            if (e.target.className === 'popup-wrapper') {
                                popup.style.display = 'none';
                            }
                        });
                    </script>
                    <%
                    } else {
                        gReview.ModificarReview(review.getId(), juego.getId_game(), u.getId_user(), nota, texto);
                        request.getRequestDispatcher(url).forward(request, response);
                    }

                }
            }
        %>

    </body>
</html>
