/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tfc.javierros.servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.tfc.javierros.domain.GestionJuegos;
import com.tfc.javierros.modelo.Juego;
import java.io.BufferedReader;
import java.io.FileReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

/**
 *
 * @author javie
 */

@WebServlet("/LeerJsonAction")
public class LeerJsonAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String JSON_PATH = "C:\\Users\\javie\\TFC\\nexus_of_gamers\\src\\main\\java\\juegos.json";

        Gson gson = new Gson();
        BufferedReader br = new BufferedReader(new FileReader(JSON_PATH));
        Type type = new TypeToken<List<Juego>>() {
        }.getType();
        List<Juego> juegos = gson.fromJson(br, type);
        GestionJuegos gJuegos = new GestionJuegos();
        
        for (int i = 0; i < juegos.size(); i++) {
            String nombre = juegos.get(i).getNombre();
            String empresa = juegos.get(i).getEmpresa();
            String genero = juegos.get(i).getGenero();
            String resumen = juegos.get(i).getResumen();
            String caratula = juegos.get(i).getCaratula();
            int estado = juegos.get(i).getEstado();
            gJuegos.altaUsuario(nombre, empresa, resumen, caratula, genero,estado);
        }

        request.getRequestDispatcher("ControllerUsuario?op=toCargarUsuario").forward(request, response);

    }

}
