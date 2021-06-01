package com.tfc.javierros.servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.tfc.javierros.domain.GestionJuegos;
import com.tfc.javierros.modelo.Juego;
import java.io.BufferedReader;
import java.io.FileInputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.util.List;

/**
 *
 * @author javier
 * 
 * @description Servlet encagado de leer el archivo JSON y guardarlo en la base de datos
 * 
 */

@WebServlet("/LeerJsonAction")
public class LeerJsonAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String JSON_PATH = "C:\\Users\\javie\\TFC\\nexus_of_gamers\\src\\main\\java\\juegos.json";

        Gson gson = new Gson();
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(JSON_PATH), "utf-8"));
        Type type = new TypeToken<List<Juego>>() {
        }.getType();
        List<Juego> juegos = gson.fromJson(br, type);
        GestionJuegos gJuegos = new GestionJuegos();
        boolean existe = false;
        
        for (int i = 0; i < juegos.size(); i++) {
            String nombre = juegos.get(i).getNombre();
            String empresa = juegos.get(i).getEmpresa();
            String genero = juegos.get(i).getGenero();
            String resumen = juegos.get(i).getResumen();
            String caratula = juegos.get(i).getCaratula();
            int estado = juegos.get(i).getEstado();
            List<Juego> juegos_guardados = gJuegos.traerJuegos();
            for(int j = 0; j < juegos_guardados.size(); j++){
                if(juegos.get(i).getNombre().contentEquals(juegos_guardados.get(j).getNombre())){
                    existe = true;
                }
            }
            if(!existe){
                gJuegos.altaJuego(nombre, empresa, resumen, caratula, genero,estado);
            }
        }

        request.getRequestDispatcher("Controller?op=toHome").forward(request, response);

    }

}
