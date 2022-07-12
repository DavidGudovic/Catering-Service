/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import beans.Kategorija;
import beans.Proizvod;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repository.KategorijaRepository;
import repository.ProizvodRepository;

public class Pocetna extends HttpServlet {  // Puni Listu proizvodima iz baze i predaje ih index.jsp-u za prikaz;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProizvodRepository proizvodRepository = new ProizvodRepository();
        KategorijaRepository kategorijaRepository = new KategorijaRepository();
        List<Proizvod> proizvodi = null;
        List<Kategorija> kategorije = null;
        
        try {
            kategorije = kategorijaRepository.getSve();
            proizvodi = proizvodRepository.getSve();           
        } catch (SQLException sqle){
        request.setAttribute("msg", sqle + " GRESKA");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        }   // puni listu proizvoda i kategorija iz baze 
        
        
        if(request.getParameter("kategorija") == null){  //Obican poziv pocetne
        request.setAttribute("proizvodi", proizvodi);
        } else {  // filtriran poziv
            
        List<Proizvod> filtriraniProizvodi = new ArrayList<>();
        for(Proizvod p: proizvodi){
            if(Integer.parseInt(request.getParameter("kategorija")) == p.getKategorija().getKategorijaID()){
                filtriraniProizvodi.add(p);
            }
        }
        request.setAttribute("proizvodi", filtriraniProizvodi);
        }
         request.setAttribute("kategorije", kategorije);
         request.getRequestDispatcher("/index.jsp").forward(request, response);
             
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
        return "Puni listu proizvoda i predaje index.jsp-u za prikaz";
    }

}
