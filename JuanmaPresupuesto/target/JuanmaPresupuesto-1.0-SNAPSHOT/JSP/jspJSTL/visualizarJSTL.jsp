<%-- 
    Document   : visualizar.jsp
    Created on : 20-oct-2017, 17:24:31
    Author     : shirone
--%>


<%@page import="es.albarregas.models.CalcularCuota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/conjunto.css"/>
        <title>Ver cuotas JSTL</title>
    </head>
    <body>
        <fmt:setLocale value="es_ES"/>
        <c:set value="" var="seguros"/>
        <c:set var="totaledificio" value="0"/>
        <c:set var="redondeado" value=""/> <fmt:formatNumber type="currency" var="redondeado" value="${sessionScope.total}"  />
        <c:if test="${sessionScope.edificio != null}">
            
            <fmt:formatNumber type="currency" var="totaledificio" value="${sessionScope.totaledificio}"  />
        </c:if>
        <%@ include file="../../INCLUDES/cabecera.inc" %>
        <h1>Ya hemos terminado !</h1>
        <h3>Esperamos que los precios sean de su agrado</h3>
        <div id="derecha">
            <p><strong>Total a pagar</strong></p>
            <table>
                <c:choose>
                    <c:when test="${sessionScope.edificio != null  && sessionScope.contenido != null}">
                        <tr>
                             <td>Seguro de edificios:</td>
                             <td><span>${totaledificio}</span></td>
                        </tr>
                        <tr>
                            <td>Seguro de contenido:</td>
                            <td><span>${sessionScope.totalcontenido}€</span></td>
                        </tr>
                        <tr>
                            <td>Total: </td>
                            <td><span>${redondeado}</span></td>
                        </tr>
                    </c:when>
                    <c:when test="${sessionScope.edificio != null}">
                        <tr>
                            <td>Seguro de edificios:</td>
                            <td>${totaledificio}</td>
                        </tr>
                        <tr>
                            <td>Total: </td>
                            <td>${redondeado}</td>
                        </tr>
                    </c:when>
                    <c:when test="${sessionScope.contenido != null}">
                        <tr>
                            <td>Seguro de contenido</td>
                            <td>${sessionScope.totalcontenido}</td>
                        </tr>
                        <tr>
                            <td>Total: </td>
                            <td>${redondeado}</td>
                        </tr>
                    </c:when>
                </c:choose>
            </table>
        <input type="button" onclick=" location.href='${pageContext.request.contextPath}/index.html' " value="Volver al inicio" name="boton" /> 
        </div>
        <div id="izquierda">
            <p><strong><ins>Tus elecciones</ins></strong></p>
             <c:if test="${sessionScope.edificio != null}">
                 <table border="1px">
                   <tr>
                    <td colspan="2"><ins>Edificio</ins></td>
                    </tr>
                    <tr>
                        <td>Tipo de vivienda: </td>
                        <td>${sessionScope.edificio.tipoEdificio}</td>
                    </tr>
                    <tr>
                        <td>Numero de habitaciones: </td>
                        <td>${sessionScope.edificio.numHab}</td>
                    </tr>
                    <tr>
                        <td>Año de Construcción: </td>
                        <td>${sessionScope.edificio.anioConstruccion}</td>
                    </tr>
                    <tr>
                        <td>Tipo de Construcción: </td>
                        <td>${sessionScope.edificio.tipoConstruccion}</td>
                    </tr>
                    <tr>
                        <td>Valor de mercado: </td>
                        <td>${sessionScope.edificio.valorMercado}</td>
                    </tr>      
                 </table>
             </c:if>
             <c:if test="${sessionScope.contenido != null}">
                 <table border="1px">
                   <tr>
                    <td colspan="2"><ins>Contenido</ins></td>
                    </tr>
                    <tr>
                        <td>Daños: </td>
                        <c:set value="seleccionado" var="danios" />
                        <c:if test="${sessionScope.contenido.danios == false}">
                            <c:set value="no seleccionado" var="danios"/> 
                        </c:if>
                        <td>${danios}</td>
                    </tr>
                    <tr>
                        <td>Cantidad Asegurada: </td>
                        <td>${sessionScope.contenido.cantidadAsegurada}</td>
                    </tr>
                    <tr>
                        <td>Franquicia: </td>
                        <td>${sessionScope.contenido.franquicia}</td>
                    </tr>  
                     </table>
             </c:if>
        </div>
        <%@ include file="../../INCLUDES/footer.inc" %>
    </body>
</html>

