<%-- 
    Document   : singup.jsp
    Created on : 28 abr. 2021, 16:18:14
    Author     : javie
--%>

<%@page import="com.tfc.javierros.servlets.ControllerUsuario"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
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
        <h1>Crear Usuario
        </h1> 
        <form name="singup" method="post"> 
            <table width="200" border="0"> 
                <tr> 
                    <th scope="row"><h2>Nombre</h2></th> 
                    <td>
                        <input name="nombre" type="text" class="creacion_usuario" value="" id="nombre" size="20" /> 
                    </td> 
                </tr> 
                <tr> 
                    <th scope="row"><h2>Apellidos</h2></th> 
                    <td>
                        <input name="apellido" type="text" class="creacion_usuario" value="" id="apellido" size="20" /> 
                    </td> 
                </tr> 
                <tr> 
                    <th scope="row"><h2>Usuario</h2></th> 
                    <td>
                        <input name="nickname" type="text" class="creacion_usuario" value="" id="usuario" size="20" /> 
                    </td> 
                </tr> 
                <tr> 
                    <th scope="row"><h2>Email</h2></th> 
                    <td>
                        <input name="email" type="text" class="creacion_usuario" value="" id="email" size="20" /> 
                    </td> 
                </tr> 
                <tr> 
                    <th height="33" scope="row"><h2>Contraseña</h2></th> 
                    <td>
                        <input name="password" type="password" class="creacion_usuario" value="" id="contrasenya" size="20" />
                    </td> 
                </tr> 
                <tr> 
                    <th height="33" scope="row"><h2>Repetir Contraseña</h2></th> 
                    <td>
                        <input name="password2" type="password" class="creacion_usuario" value=""  id="contrasenya2" size="20" />
                    </td> 
                </tr> 
                <tr>
                    <td>
                        <input value="Crear" type="submit" name = "crear"/> 
                    </td> 
                </tr>
            </table> 
        </form>
        <%
            if (request.getParameter("crear") != null) {
                        String nickname = request.getParameter("nickname");
                            String pass = request.getParameter("password");
                            String nombre = request.getParameter("nombre");
                            String apellido = request.getParameter("apellido");
                            String email = request.getParameter("email");
                            String pass2 = request.getParameter("password2");
                            String error = "";
                            boolean valid = true;
                            int numCount = 0;                   // Variable usada para almacenar numeros en el password
                            int capCount = 0;
                            Pattern pattern = Pattern
                                    .compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                                            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
                            Matcher mather = pattern.matcher(email);
                            boolean existe = false;
                            GestionUsuarios gUsuarios = new GestionUsuarios();
                            List<Usuario> lista_users = gUsuarios.existeUsuario();
                    for (int x = 0; x < pass.length(); x++) {

                        if ((pass.charAt(x) > 47 && pass.charAt(x) < 58)) { // Cuenta la cantidad de numero
                            numCount++;
                        }

                        if ((pass.charAt(x) > 64 && pass.charAt(x) < 91)) { // Cuenta la cantidad de mayusculas
                            capCount++;
                        }

                    }
                    //valida el tamanyo
                    if (pass.length() < 8) {
                        error = error + "Contraseña ha de ser mayor de 8 caracteres\n";
                    }

                    //valida los numeros
                    if (numCount < 1) {
                        error = error + "Contraseña ha de contener numeros\n";
                    }

                    //valida las mayusculas
                    if (capCount < 1) {
                        error = error + "Contraseña ha de contener mayusculas\n";
                    }

                    if (!error.isEmpty()) {
                        valid = false;
                        
                    }
                    if (nickname.isEmpty() || pass.isEmpty() || nombre.isEmpty() || apellido.isEmpty() || email.isEmpty() || pass2.isEmpty()) {
                        out.print("<p>No puede haber campos vacios</p>");
                    } 
                    else if (!mather.find()) {                                                            //COMPRUEBA MAIL
                        out.print("<p>Error: La dirección de correo " + email + " no existe.</p>");
                    }
                    else if (!pass.contentEquals(pass2)) {
                        out.print("<p>Las contraseñas no coinciden</p>");
                    }  
                    else if (!valid) {
                        out.print("<p>Error:" + error + " </p>");
                    } 
                    else {
                            for (int i = 0; i < lista_users.size(); i++) {
                                if (lista_users.get(i).getNickname().contentEquals(nickname) || lista_users.get(i).getEmail().contentEquals(email)) {
                                    existe = true;
                                }
                            }
                            if (existe) {
                                out.print("<p>Usuario o email existente</p>");
                            } else {
                                request.getRequestDispatcher("ControllerUsuario?op=doCrearUsuario").forward(request, response);
                            }
                    }

                }
            
        %>
    </body>
</html>
