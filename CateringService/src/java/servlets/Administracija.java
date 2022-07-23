package servlets;

import beans.Kategorija;
import beans.Narudzbina;
import beans.Proizvod;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Hendluje prikaze panela za administraciju
public class Administracija extends HttpServlet {

    //Ako korisnik nije Menadzer ili Administrator prikazuje 404Forbidden stranu
    private boolean autorizacija(HttpServletRequest request)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String zahtev;
        int rola;

        if (session.getAttribute("UserRola") != null && request.getParameter("Zahtev") != null) {
            zahtev = request.getParameter("Zahtev");
            rola = Integer.valueOf(session.getAttribute("UserRola").toString());
        } else {
            return false;
        }

        return !(rola > 2 || (rola > 1 && zahtev.equals("Korisnici")));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!autorizacija(request)) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        switch (request.getParameter("Zahtev")) {
            case "Narudzbine":                
                try {
                List<Narudzbina> narudzbine = Narudzbina.prikazNeostvarenih();
                Collections.reverse(narudzbine);
                request.setAttribute("Narudzbine", narudzbine);
            } catch (SQLException sqle) {
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            break;
            case "Proizvodi":
                try {
                List<Proizvod> proizvodi = Proizvod.celaPonuda();
                List<Kategorija> kategorije = Kategorija.sveKategorije();
                List<Kategorija> slaneKategorije = Kategorija.filterKategorije(kategorije, "slani");
                List<Kategorija> slatkeKategorije = Kategorija.filterKategorije(kategorije, "slatki");
                request.setAttribute("proizvodi", proizvodi);
                request.setAttribute("kategorije", kategorije);
                request.setAttribute("slaneKategorije", slaneKategorije);
                request.setAttribute("slatkeKategorije", slatkeKategorije);
            } catch (SQLException sqle) {
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            break;
            case "Izvestaji":
                break;
            case "Korisnici":
                break;
            default:
                request.getRequestDispatcher("error.jsp").forward(request, response);
                break;
        }
        request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        autorizacija(request);
        request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Hendluje pozive vezane za prikaz administratorskih panela";
    }

}
