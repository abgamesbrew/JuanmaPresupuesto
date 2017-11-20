<%-- 
    Document   : visualizar.jsp
    Created on : 20-oct-2017, 17:24:31
    Author     : shirone
--%>


<%@page import="es.albarregas.pojos.Contenido"%>
<%@page import="es.albarregas.pojos.Edificio"%>
<%@page import="es.albarregas.models.CalcularCuota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/conjunto.css"/>
        <title>Ver cuotas</title>
    </head>
    <body>
        <%      
            HttpSession sesion = request.getSession(false);
            String seguros="";
            double totaledificio=0;//el resultado del calculo del seguro de edificio tendra muchos decimales y debe ser redondeado
            
            //** sacamos el total calculado que nos envian los controladores y lo redondeamos a dos cifras**//
            double redondeado = Math.round( (double)sesion.getAttribute("total") * 100.0 ) / 100.0;
            
            if(sesion.getAttribute("edificio") != null){//** si en la sesion existe el seguro de edificio **//
                totaledificio = Math.round( (double)sesion.getAttribute("totaledificio") * 100.0 ) / 100.0;  
            }
           
        %>
        <%@ include file="../../INCLUDES/cabecera.inc" %>
        <h1>Ya hemos terminado!</h1>
        <h3>Esperamos que los precios sean de su agrado</h3>
        <div id="derecha">
        <table>
            <% if(sesion.getAttribute("edificio") != null && sesion.getAttribute("contenido") != null){
            //** comprobamos si se marcaron en el index los dos seguros **//%>
            <tr>
                <td>Seguro de edificios:</td>
                <td><span><%= totaledificio %>€</span></td>
            </tr>
            <tr>
                <td>Seguro de contenido:</td>
                <td><span><%= sesion.getAttribute("totalcontenido") %>€</span></td>
            </tr>
            <tr>
                <td>Total: </td>
                <td><span><%= redondeado %>€</span></td>
            </tr>
            <%}else if(sesion.getAttribute("edificio") != null){
             //** comprobamos si se marco en el index el edificio **//%>
            <tr>
                <td>Seguro de edificios:</td>
                <td><%= totaledificio %>€</td>
            </tr>
            <tr>
                <td>Total: </td>
                <td><%= redondeado %>€</td>
            </tr>
            <%}else if(sesion.getAttribute("contenido") != null){
             //** comprobamos si se marco en el index el contenido **//%>
            <tr>
                <td>Seguro de contenido</td>
                <td><%= sesion.getAttribute("totalcontenido") %>€</td>
            </tr>
            <tr>
                <td>Total: </td>
                <td><%= redondeado %>€</td>
            </tr>    
            <%}
            
            %>
        </table>
        <input type="button" onclick=" location.href='<%= request.getContextPath() %>/index.html' " value="Volver al inicio" name="boton" /> 
    </div>
    <div id="izquierda">
        <p><strong><ins>Tus elecciones</ins></strong></p>
             <% 
                 if(sesion.getAttribute("edificio") != null){
                 Edificio edificio = (Edificio)sesion.getAttribute("edificio");
                 
             %>
                 <table border="1px">
                   <tr>
                    <td colspan="2"><ins>Edificio</ins></td>
                    </tr>
                    <tr>
                        <td>Tipo de vivienda: </td>
                        <td><%= edificio.getTipoEdificio()%></td>
                    </tr>
                    <tr>
                        <td>Numero de habitaciones: </td>
                        <td><%= edificio.getNumHab()%></td>
                    </tr>
                    <tr>
                        <td>Año de Construcción: </td>
                        <td><%= edificio.getAnioConstruccion()%></td>
                    </tr>
                    <tr>
                        <td>Tipo de Construcción: </td>
                        <td><%= edificio.getTipoConstruccion()%></td>
                    </tr>
                    <tr>
                        <td>Valor de mercado: </td>
                        <td><%= edificio.getValorMercado()%></td>
                    </tr>      
                 </table>
             <%} %>
             <% 
                 if(sesion.getAttribute("contenido") != null){
                 Contenido contenido = (Contenido)sesion.getAttribute("contenido");
                 String danios ="seleccionado";
                 
             %>
                 <table border="1px">
                   <tr>
                    <td colspan="2"><ins>Contenido</ins></td>
                    </tr>
                    <tr>
                        <td>Daños: </td>
                        <c:set value="seleccionado" var="danios" />
                        <%if(contenido.getDanios() == false){
                            danios="no seleccionado";
                        }%>
                        <td><%= danios %></td>
                    </tr>
                    <tr>
                        <td>Cantidad Asegurada: </td>
                        <td><%= contenido.getCantidadAsegurada() %></td>
                    </tr>
                    <tr>
                        <td>Franquicia: </td>
                        <td><%=contenido.getFranquicia() %></td>
                    </tr>  
                        <%}%>
        </div>
        
        <%@ include file="../../INCLUDES/footer.inc" %>
        
    </body>
</html>
