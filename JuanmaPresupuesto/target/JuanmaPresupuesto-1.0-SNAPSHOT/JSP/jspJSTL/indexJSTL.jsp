<%-- 
    Document   : index.jsp
    Created on : 20-oct-2017, 17:24:23
    Author     : shirone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Seguros JSTL</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/conjunto.css"/>
    </head>
    <body>
        <div id="cabecera">
            <img src="${pageContext.request.contextPath}/IMG/seguros.png" />
            <div id="eslogan">
                <img class="eslogan" src="${pageContext.request.contextPath}/IMG/eslogan.png" />
            </div>
        </div>
        <div id="contenido">
        <h1> ¡ Elija su seguro jstl !</h1>
        <h2>Por favor, elegir seguro de los edificios, seguro de contenido, o ambos, marcando las casillas de abajo.</h2>
        <p>¿Que tipo de seguro quiere?</p>
        <form method="post" action="${pageContext.request.contextPath}/eleccion">
            <input type="checkbox" name="edificios" checked/><label>Seguro de edificios</label><br><br>
            <input type="checkbox" name="contenido" checked/><label>Seguro de contenido</label><br><br>
            <input type="hidden" name="jstl" value="jstl">
            <input type="submit" value="Enviar"/>
        </form>  
        </div>
    </body>
</html>
    