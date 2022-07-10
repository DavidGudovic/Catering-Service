package servlets;

import beans.Korisnik;
import beans.Rola;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import repository.KorisnikRepository;

public class Authenticate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        KorisnikRepository repositorij = new KorisnikRepository();
        try {
            Korisnik noviKorisnik = new Korisnik(request.getParameter("adresa"),
                    request.getParameter("ime"),
                    request.getParameter("prezime"),
                    request.getParameter("korisnickoIme"),
                    request.getParameter("password"),
                    0, new Rola(3, "Klijent"));
            repositorij.dodaj(noviKorisnik);
        } catch (SQLException sqle) {
            request.setAttribute("msg", "GRESKA");
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
        }
        request.setAttribute("msg", "Uspesna registracija, ulogujte se!");
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
