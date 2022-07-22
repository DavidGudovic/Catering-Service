package servlets;

import beans.Kategorija;
import beans.Proizvod;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Proizvodi extends HttpServlet {
      
    //Poziv za brisanje proizvoda;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");
        
        Proizvod zaBrisanje = new Proizvod(Integer.valueOf(request.getParameter("Proizvod")));
        try{
            zaBrisanje.izbrisiProizvod();
            request.getRequestDispatcher("Administracija?Zahtev=Proizvodi").forward(request, response);
        }catch(SQLException sqle){
            request.setAttribute("msg", sqle.getMessage());
            request.getRequestDispatcher("Administracija").forward(request, response);
        }
    }

    
    //AJAX poziv iz scripts.js za izmenu proizvoda
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        Proizvod zaIzmenu = new Proizvod(Integer.valueOf(request.getParameter("proizvod")));
        Proizvod izmene = new Proizvod();
        izmene.setNazivProizvoda(request.getParameter("naziv"));
        izmene.setOpis(request.getParameter("opis"));
        izmene.setCenaPoPorciji(Integer.valueOf(request.getParameter("cena")));
        izmene.setKategorija(new Kategorija(Integer.valueOf(request.getParameter("kategorijaID"))));
        try{
            zaIzmenu.izmeniProizvod(izmene);
        }catch(SQLException sqle){
           response.sendError(500);
        } 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
