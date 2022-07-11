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
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) // get se poziva samo za logout
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        KorisnikRepository repositorij = new KorisnikRepository();
        
        if (request.getParameter("loginKorisnicko") == null) {  //register, kreira korisnika i salje ga Repozitorijumu za dodavanje u bazu
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
            
            
        } else {    //login  Objekat se pretrazuje po ID-u u repozitorijumu, sifra se provjerava ovdje.
            Korisnik loginKorisnik = new Korisnik(request.getParameter("loginKorisnicko"), request.getParameter("password"));
            HttpSession session = request.getSession();
            try {
                Korisnik sessionKorisnik = repositorij.getJedan(loginKorisnik);
                if (sessionKorisnik != null && loginKorisnik.getPassword().equals(sessionKorisnik.getPassword())) {
                    session.setAttribute("User", sessionKorisnik.getKorisnickoIme());
                    session.setAttribute("UserRola", sessionKorisnik.getRola().getRolaID());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "Pogrešna šifra ili username");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }                  
            } catch (SQLException sqle) {
                request.setAttribute("msg", "Interna greška, pokušajte ponovo!");
            }
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet upravlja HTTP pozivima za registraciju, login i logout";
    }
    
}
