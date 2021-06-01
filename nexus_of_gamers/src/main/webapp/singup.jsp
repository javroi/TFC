<%-- 
    Document   : singup.jsp
    Created on : 28 abr. 2021, 16:18:14
    Author     : javier
--%>

<%@page import="java.util.List"%>
<%@page import="com.tfc.javierros.servlets.Controller"%>
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
    <body id="pagina_princi">
        <img src="images/logo_white_large.png" width="900" height="200" id="logo_ini">
        <form name="singup" method="post" id="singup_form"> 
            <h2 id="titulo_sing">Crear usuario </h2> 
            <input name="nombre" type="text" class="creacion_usuario" value="" id="input_sing"  placeholder="Nombre" /> 
            <input name="apellido" type="text" class="creacion_usuario" value="" id="input_sing" placeholder="Apellido" /> 
            <input name="nickname" type="text" class="creacion_usuario" value="" id="input_sing" placeholder="Nickname"/>
            <input name="email" type="text" class="creacion_usuario" value="" id="input_sing" placeholder="Email" />
            <input name="password" type="password" class="creacion_usuario" value="" id="input_sing" placeholder="Contraseña" />
            <input name="password2" type="password" class="creacion_usuario" value=""  id="input_sing" placeholder="Confirmar contraseña" />
            <input value="Crear" type="submit" name = "crear_u" id="input_sing_sub"/> 
        </form>
        <%
            //Comprobacion de los inputs y de si existe el usuario
            if (request.getParameter("crear_u") != null) {
                String nickname = request.getParameter("nickname");
                String pass = request.getParameter("password");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String email = request.getParameter("email");
                String pass2 = request.getParameter("password2");
                String error = "";
                boolean valid = true;
                int numCount = 0;// Variable usada para almacenar numeros en el password
                int capCount = 0;//Variable usada para almacenar Mayusculas
                Pattern pattern = Pattern
                        .compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");//Patron para comprobar el correo
                Matcher mather = pattern.matcher(email);//Comprobador del email
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
                    error = error + "Contraseña ha de contener al menos un numero\n";
                }

                //valida las mayusculas
                if (capCount < 1) {
                    error = error + "Contraseña ha de contener al menos una mayuscula\n";
                }
                //Comprueba si los errores estan vacios 
                if (!error.isEmpty()) {
                    valid = false;

                }

                //Comprueba campos vacios
                if (nickname.isEmpty() || pass.isEmpty() || nombre.isEmpty() || apellido.isEmpty() || email.isEmpty() || pass2.isEmpty()) {
                    out.print("<p class=\"errores\">No puede haber campos vacios</p>");
                } //Comprobueba el email
                else if (!mather.find()) {
                    out.print("<p class=\"errores\">Error: La dirección de correo " + email + " no existe.</p>");
                } //Comprueba que las contrasenyas coincidan 
                else if (!pass.contentEquals(pass2)) {
                    out.print("<p class=\"errores\">Las contraseñas no coinciden</p>");
                } //Comprueba si hay errores en el formato de las contrasenyas
                else if (!valid) {
                    out.print("<p class=\"errores\">Error:" + error + " </p>");
                } else {
                    for (int i = 0; i < lista_users.size(); i++) {//Recorre la bd para ver si ya hay algun usuario creado con esas credenciales
                        if (lista_users.get(i).getNickname().contentEquals(nickname) || lista_users.get(i).getEmail().contentEquals(email)) {
                            existe = true;
                        }
                    }
                    if (existe) {
                        out.print("<p class=\"errores\">Usuario o email existente</p>");
                    } else {
                        request.getRequestDispatcher("Controller?op=doCrearUsuario").forward(request, response);
                    }
                }

            }

        %>
    </body>
</html>
