/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.pojos.Eleccion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shirone
 */
@WebServlet(name = "eleccion", urlPatterns = {"/eleccion"})
public class eleccion extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url="";//url donde nos dirigira el servlet
        String complementocarpeta="";//ruta de la carpeta donde vamos a apuntar
        String complemento="";//estara vacio o contendra JSTL (por ahora)
        HttpSession sesion = request.getSession(false);//inicializamos la sesion a falso
        
        if(sesion.getAttribute("fin") != null){//si existe este atributo en la sesion la invalidamos y creamos una nueva
            sesion.invalidate();  
            sesion=request.getSession(true);
        }else{//si no esta pues creamos una nueva
            sesion=request.getSession(true);
        }
        
        String referrer = "";//contendra la ruta de donde venimos
        
        if(sesion.getAttribute("referrer") == null){//si la sesion no contiene este atributo se lo asignamos
         referrer = request.getHeader("referer");
         sesion.setAttribute("referrer", referrer);   
        }
        
        referrer=(String)sesion.getAttribute("referrer");//cargamos el atributo de sesion en la variable (por si el cliente tiene la genial idea de no seleccionar nada) 
        
        if(referrer.contains("Estandar")){//dependiendo de si nuestra url contiene Estandar o JSTL sabremos de donde proviene y que compleento debera llevar
            complementocarpeta = "Estandar";
        }else if(referrer.contains("JSTL")){
            complementocarpeta = "JSTL";
            complemento="JSTL";
        }
        
        //** pasamos por sesión desde donde venimos y hacia donde vamos dependiendo de lo elegido en el index. **//
        sesion.setAttribute("complementocarpeta", complementocarpeta);
        sesion.setAttribute("complemento", complemento);
        
         Eleccion eleccion = new Eleccion();
        
        if(request.getParameter("edificios") == null && request.getParameter("contenido") == null){
            url="JSP/jsp"+complementocarpeta+"/index"+complemento+".jsp";
        }else{
            if(request.getParameter("edificios") != null){
            eleccion.setEdificio(true);
            }
            if(request.getParameter("contenido") != null ){
                eleccion.setContenido(true);
            }
            
            //** cuando lleguemos a elegir algun seguro en el formulario creamos la sesion y le pasamos nuestra eleccion como atributo **//
            sesion.setAttribute("eleccion", eleccion);
            
            
            if(eleccion.getEdificio()){//** Si hemos elegido la opcion Seguro de edificio vamos al jsp que contendrá la información requerida**//
              url="JSP/jsp"+complementocarpeta+"/edificio"+complemento+".jsp";
            }else{
              url="JSP/jsp"+complementocarpeta+"/contenido"+complemento+".jsp";
            }
        }
        
        request.getRequestDispatcher(url).forward(request, response);  
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
