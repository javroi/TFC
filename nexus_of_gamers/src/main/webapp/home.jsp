<%-- 
    Document   : home
    Created on : 25 abr. 2021, 10:22:23
    Author     : javie
--%>

<%@page import="com.tfc.javierros.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="styles/styles.css" rel="stylesheet" type="text/css">

    </head>

    <body>
        <header>
            <div class="wrapper">
                <div class="logo"><a href="home.html"><img src="images/logo_redux_large.png" width="150"
                                                           height="200"></a></div>

                <nav>
                    <form>		    
                        <input type="search" placeholder="Search...">	
                        <a href="#">Buscar</a>
                    </form>
                    <a href="perfil.html">Perfil</a>
                    <p>
                        <%
                            Usuario u = (Usuario) session.getAttribute("usuario");
                            
                            out.print(u.getNickname());
                        %>
                    </p>
                </nav>
            </div>
        </header>
        <div>
            <select>
                <option>Alfabeticamente</option>
                <option>Calificacion</option>
                <option>Popularidad</option>
            </select>
            <ul class="navega">
                <li><a href="juego.html"><img src="images/uncharted4.jpg" width="80"
                                              height="100">Juego 1</a></li>
                <li<a href="juego.html"><img src="images/uncharted4.jpg" width="80"
                                             height="100">Juego 1</a></li>
                <li><a href="juego.html"><img src="images/uncharted4.jpg" width="80"
                                              height="100">Juego 1</a></li>
            </ul>
        </div>



    </body>
</html>