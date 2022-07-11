/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import beans.Proizvod;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repository.ProizvodRepository;

public class Pocetna extends HttpServlet {  // Puni Listu proizvodima iz baze i predaje ih index.jsp-u za prikaz;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProizvodRepository repository = new ProizvodRepository();
        try {
            List<Proizvod> proizvodi = repository.getSve();
            request.setAttribute("proizvodi", proizvodi);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (SQLException sqle){
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        request.setAttribute("msg", sqle + " GRESAK");
        }
             
        // if slatki
        // do work
        // if slani
        // do work
        // if kategorije
        // do work
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
