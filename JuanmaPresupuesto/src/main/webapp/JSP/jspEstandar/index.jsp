<%-- 
    Document   : index.jsp
    Created on : 20-oct-2017, 17:24:23
    Author     : shirone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Seguros</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/conjunto.css"/>
    </head>
    <body>
        <div id="cabecera">
            <img src="<%=request.getContextPath()%>/IMG/seguros.png" />
            <div id="eslogan">
                <img class="eslogan" src="<%=request.getContextPath()%>/IMG/eslogan.png" />
            </div>
        </div>
        <div id="contenido">
        <h1> ¡ Elija su seguro !</h1>
        <h2>Por favor, elegir seguro de los edificios, seguro de contenido, o ambos, marcando las casillas de abajo.</h2>
        <p>¿Que tipo de seguro quiere?</p>
        <form method="post" action="<%= request.getContextPath() %>/eleccion">
            <input type="checkbox" name="edificios" checked/><label>Seguro de edificios</label><br><br>
            <input type="checkbox" name="contenido" checked/><label>Seguro de contenido</label><br><br>
            <input type="submit" value="Enviar"/>
        </form>  
        </div>  
    </body>
</html>
    