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

public class Authenticate extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) // logout request
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("Pocetna").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        if (request.getParameter("loginKorisnicko") == null) {  //register request;  kreira korisnika i poziva registruj() nad njim 
            try {
                Korisnik noviKorisnik = new Korisnik(request.getParameter("adresa"),
                        request.getParameter("ime"),
                        request.getParameter("prezime"),
                        request.getParameter("korisnickoIme"),
                        request.getParameter("password"),
                        0, new Rola(3, "Klijent"));
                noviKorisnik.registruj();
            } catch (SQLException sqle) {
                request.setAttribute("msg", "GRESKA");
                request.getRequestDispatcher("registracija.jsp").forward(request, response);
            }
            request.setAttribute("msg", "Uspesna registracija, ulogujte se!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
            
        } else {    //login request; kreira korisnika sa samo ID-em i passwordom, poziva login, ako uspije zapocinje sesiju; 
            Korisnik loginKorisnik = new Korisnik(request.getParameter("loginKorisnicko"), request.getParameter("password"));
            HttpSession session = request.getSession();
            try {                
                if (loginKorisnik.login()) {
                    session.setAttribute("User", loginKorisnik.getKorisnickoIme());
                    session.setAttribute("UserRola", loginKorisnik.getRola().getRolaID());
                    response.sendRedirect("Pocetna");
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
