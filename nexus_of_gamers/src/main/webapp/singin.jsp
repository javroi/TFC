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
    <body>
        <h1>Ingresa Tus Datos 
        </h1> 
        <form name="login" method="post"> 
            <table width="200" border="0"> 
                <tr> 
                    <th scope="row"><h2>Usuario</h2></th> 
                    <td>
                        <input name="nickname" type="text" class="Input" value="" size="20"/> 
                    </td> 
                </tr> 
                <tr> 
                    <th height="33" scope="row"><h2>Contraseña</h2></th> 
                    <td>
                        <input name="password" type="password" class="Input" value="" size="20" /> 
                    </td> 
                </tr> 
                <tr>
                    <td>
                        <input value="Entrar" type="submit" class="boton" name = "enviar">            
                    </td> 
                </tr>
            </table> 
        </form> 
        <%
            //Comprobacion de los inputs y de si existe el usuario
            if (request.getParameter("enviar") != null) {
                String nickname = request.getParameter("nickname");
                String pass = request.getParameter("password");
                boolean existe = false;
                GestionUsuarios gUsuarios = new GestionUsuarios();
                List<Usuario> lista_users = gUsuarios.existeUsuario();

                if (nickname.isEmpty() || pass.isEmpty()) {
                    out.print("<p>No puede haber campos vacios</p>");
                } else {
                    for (int i = 0; i < lista_users.size(); i++) {//Recorremos toda la bd para buscar a ver si el usuario y contrasenya coninciden
                        if (lista_users.get(i).getNickname().contentEquals(nickname) && lista_users.get(i).getPassword().contentEquals(pass)) {
                            request.getSession().setAttribute("usuario", lista_users.get(i));
                            existe = true;
                        }
                    }
                    if (existe) {
                        response.sendRedirect("ControllerUsuario?op=toHome");
                    } else {
                        out.print("<p>Usuario o contraseña erroneo</p>");
                    }
                }
            }
        %>
    </body>
</html>


