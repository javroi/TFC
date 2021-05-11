<%-- 
    Document   : singin
    Created on : 25 abr. 2021, 10:50:48
    Author     : javie
--%>

<%@page import="com.tfc.javierros.domain.GestionUsuarios"%>
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
    <body id="pagina_princi">
        <img src="images/logo_white_large.png" width="900" height="200" id="logo_ini">
        <form name="login" method="post" id="login_form"> 

            <h2 id="titulo_log">Ingresa Tus Datos </h2> 
            <input name="nickname" type="text" id="input_log" value="" placeholder="Usuario"/> 
            <input name="password" type="password" id="input_log" value="" placeholder="Contraseña" /> 
            <input value="Entrar" type="submit" class="boton" id="input_log_sub" name = "enviar">            
        </form> 
        <%
            //Comprobacion de los inputs y de si existe el usuario
            if (request.getParameter("enviar") != null) {
                String nickname = request.getParameter("nickname");
                String pass = request.getParameter("password");
                boolean existe = false;
                GestionUsuarios gUsuarios = new GestionUsuarios();
                List<Usuario> lista_users = gUsuarios.existeUsuario();

                if (nickname.isEmpty() || pass.isEmpty()) {%>
        <p class="errores">No puede haber campos vacios</p>
        <%} else {
            for (int i = 0; i < lista_users.size(); i++) {//Recorremos toda la bd para buscar a ver si el usuario y contrasenya coninciden
                if (lista_users.get(i).getNickname().contentEquals(nickname) && lista_users.get(i).getPassword().contentEquals(pass)) {
                    session.setAttribute("usuario", lista_users.get(i));
                    existe = true;
                }
            }
            if (existe) {
                response.sendRedirect("ControllerUsuario?op=toHome");
            } else {%>
        <p class="errores">Usuario o contraseña erroneo</p>
        <%}
                }
            }
        %>
    </body>
</html>


