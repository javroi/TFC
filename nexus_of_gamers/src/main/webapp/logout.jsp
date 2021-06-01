<%-- 
    Document   : logout
    Created on : 8 may. 2021, 11:58:08
    Author     : javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <%
        session.removeAttribute("usuario");
        session.invalidate(); // Este comportamiento borra la sesión
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        response.sendRedirect("index.html");
    %>

</html>
