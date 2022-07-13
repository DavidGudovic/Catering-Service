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

// Zove Kategorija i Proizvod repository da napune liste iz baze i predaje ih index.jsp-u za prikaz;
public class Pocetna extends HttpServlet {  

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
        } catch (SQLException sqle) {
            request.setAttribute("msg", sqle + " GRESKA");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }   // puni listu svih proizvoda i svih kategorija iz baze 

        if (request.getParameter("kategorija") == null) {  //Obican poziv pocetne - predaje nefiltrirane liste
            request.setAttribute("proizvodi", proizvodi);
        } else{  // filtriran poziv po kategoriji - filtira liste po zahtevu iz get-a
            List<Proizvod> filtriraniProizvodi = Proizvod.filtrirajPonudu(proizvodi, null, Integer.parseInt(request.getParameter("kategorija")));
            request.setAttribute("proizvodi", filtriraniProizvodi);
        }
        
        if (request.getParameter("program") != null){ // filtriran poziv po programu;
            List<Proizvod> filtriraniProizvodi = Proizvod.filtrirajPonudu(proizvodi, request.getParameter("program"), -1);
            request.setAttribute("proizvodi", filtriraniProizvodi);
        }

        List<Kategorija> slaneKategorije = Kategorija.filterKategorije(kategorije,"slani");
        List<Kategorija> slatkeKategorije = Kategorija.filterKategorije(kategorije,"slatki");
        request.setAttribute("slaneKategorije", slaneKategorije);
        request.setAttribute("slatkeKategorije", slatkeKategorije);
        
        request.getRequestDispatcher("/index.jsp").forward(request, response);
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
