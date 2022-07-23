package servlets;

import beans.Kategorija;
import beans.Proizvod;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class Proizvodi extends HttpServlet {

    //Poziv za brisanje proizvoda;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Proizvod zaBrisanje = new Proizvod(Integer.valueOf(request.getParameter("Proizvod")));
        try {
            zaBrisanje.izbrisiProizvod();
            request.getRequestDispatcher("Administracija?Zahtev=Proizvodi").forward(request, response);
        } catch (SQLException sqle) {
            request.setAttribute("msg", sqle.getMessage());
            request.getRequestDispatcher("Administracija").forward(request, response);
        }

    }

    //Hendluje AJAX poziv iz scripts.js za izmenu proizvoda i normalan poziv za dodavanje proizvoda
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("zahtev") != null) { // Zahtev za dodavanje proizvoda
            
            //Upload slike
            Part filePart = request.getPart("slika"); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = filePart.getInputStream();
            response.sendRedirect(fileName);
            
            //Pozivanje modela 

        } else {  // Ajaz poziv za izmenu proizvoda
            Proizvod zaIzmenu = new Proizvod(Integer.valueOf(request.getParameter("proizvod")));
            Proizvod izmene = new Proizvod();
            izmene.setNazivProizvoda(request.getParameter("naziv"));
            izmene.setOpis(request.getParameter("opis"));
            izmene.setCenaPoPorciji(Integer.valueOf(request.getParameter("cena")));
            izmene.setKategorija(new Kategorija(Integer.valueOf(request.getParameter("kategorijaID"))));
            try {
                zaIzmenu.izmeniProizvod(izmene);
            } catch (SQLException sqle) {
                response.sendError(500);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
