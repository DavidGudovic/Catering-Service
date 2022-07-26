package repository;

import beans.Korisnik;
import beans.Narudzbina;
import beans.Proizvod;
import database.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

/*
Ne implementira IRepository, a i nije bas repository.. 
Dohvaca podatke potrebne za izradu izvestaja iz baze
*/
public class IzvestajRepository {
    
    // Vraca sve narudzbine iz trenutnog meseca
     public List<Narudzbina> getSve() throws SQLException{
               Connection con = ConnectionManager.getConnection();
        String sqlNarudzba = "SELECT `NarudzbinaID`,`KorisnickoIme`,`DatumKreiranja`, `DatumOstvarivanja`,`Status`, `UkupnaCena`, `Popust` "
                + "FROM `narudzbine` WHERE MONTH(DatumKreiranja) = ? AND YEAR(DatumKreiranja) = ?";
        String sqlStavke = "SELECT `proizvodi`.`ProizvodID`, `Kolicina`, `NazivProizvoda`, `CenaPoPorciji`"
                + "FROM `stavkenarudzbine` "
                + "INNER JOIN `proizvodi` ON `stavkenarudzbine`.`ProizvodID` = `proizvodi`.`ProizvodID` "
                + "WHERE `NarudzbinaID` = ? AND proizvodi.`ProizvodID` != 0";
        List<Narudzbina> rezultat = new ArrayList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        // Puni listu narudzbi
        try ( PreparedStatement stmt = con.prepareStatement(sqlNarudzba)) {
            stmt.setInt(1, Calendar.getInstance().get(Calendar.MONTH) + 1);
            stmt.setInt(2, Calendar.getInstance().get(Calendar.YEAR));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String datumOstvarivanja;
                if (rs.getDate("DatumOstvarivanja") == null) {
                    datumOstvarivanja = "";
                } else {
                    datumOstvarivanja = dateFormat.format(rs.getDate("DatumOstvarivanja"));
                }
                Narudzbina nar = new Narudzbina(dateFormat.format(rs.getDate("DatumKreiranja")),
                        datumOstvarivanja,
                        rs.getInt("Status"),
                        new Korisnik(rs.getString("KorisnickoIme")),
                        rs.getInt("NarudzbinaID"),
                        rs.getInt("Popust"),
                        rs.getInt("UkupnaCena"),
                        new HashMap<Proizvod, Integer>());
                rezultat.add(nar);
            }
            rs.close();
        } catch (SQLException sqle) {
            con.close();
            throw sqle;
        }

        //puni hash mapu svake narudzbe
        for (Narudzbina nar : rezultat) {
            try ( PreparedStatement stmt = con.prepareStatement(sqlStavke)) {
                stmt.setInt(1, nar.getNarudzbinaID());
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Proizvod prod = new Proizvod(rs.getInt("ProizvodID"));
                    prod.setCenaPoPorciji(rs.getInt("CenaPoPorciji"));
                    prod.setNazivProizvoda(rs.getString("NazivProizvoda"));
                    nar.dodajProizvod(prod, rs.getInt("Kolicina"));
                }
                rs.close();
            } catch (SQLException sqle) {
                con.close();
                throw sqle;
            }
        }

        con.close();
        return rezultat;
    }
 
}
