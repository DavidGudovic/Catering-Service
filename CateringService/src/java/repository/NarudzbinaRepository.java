package repository;

import beans.Korisnik;
import beans.Narudzbina;
import beans.Proizvod;
import database.ConnectionManager;
import interfaces.IRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class NarudzbinaRepository implements IRepository<Narudzbina> {

    @Override
    public void dodaj(Narudzbina zaDodavanje) throws SQLException {
        Connection con = ConnectionManager.getConnection();
        String sqlNarudzbina = "INSERT INTO `narudzbine`( `KorisnickoIme`, `DatumKreiranja`, `DatumOstvarivanja`, `Ostvarena`, `UkupnaCena`, `Popust`) "
                + "VALUES (?,?,?,?,?,?)";
        String sqlStavke = "INSERT INTO `stavkenarudzbine`(`ProizvodID`, `NarudzbinaID`, `Kolicina`)"
                + " VALUES (?,?,?)";
        Date trenutniDatum = new Date();
        java.sql.Date sqlDate = new java.sql.Date(trenutniDatum.getTime());
        //Dodavanje narudzbe
        try ( PreparedStatement stmt = con.prepareStatement(sqlNarudzbina, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, zaDodavanje.getKorisnik().getKorisnickoIme());
            stmt.setDate(2, sqlDate);
            stmt.setDate(3, null);
            stmt.setInt(4, 0);
            stmt.setInt(5, zaDodavanje.getUkupnaCena());
            stmt.setInt(6, zaDodavanje.getPopust());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                zaDodavanje.setNarudzbinaID(rs.getInt(1));
            }
        } catch (SQLException sqle) {
            con.close();
            throw sqle;
        }
        //Dodavanje stavki batch
        try ( PreparedStatement stmt = con.prepareStatement(sqlStavke)) {
            for (HashMap.Entry<Proizvod, Integer> stavka : zaDodavanje.getStavkeNarudzbine().entrySet()) {
                stmt.setInt(1, stavka.getKey().getProizvodID());
                stmt.setInt(2, zaDodavanje.getNarudzbinaID());
                stmt.setInt(3, stavka.getValue());
                stmt.addBatch();
            }
            stmt.executeBatch();
        } catch (SQLException sqle) {
            throw sqle;
        } finally {
            con.close();
        }

    }

    public List<Narudzbina> getSveOdKorisnika(Korisnik korisnik) throws SQLException {
        Connection con = ConnectionManager.getConnection();
        String sqlNarudzba = "SELECT `NarudzbinaID`,`DatumKreiranja`, `DatumOstvarivanja`, `UkupnaCena`, `Popust` "
                + "FROM `narudzbine` WHERE KorisnickoIme = ?";
        String sqlStavke = "SELECT `proizvodi`.`ProizvodID`, `Kolicina`, `NazivProizvoda`, `CenaPoPorciji`"
                + "FROM `stavkenarudzbine` "
                + "INNER JOIN `proizvodi` ON `stavkenarudzbine`.`ProizvodID` = `proizvodi`.`ProizvodID` "
                + "WHERE `NarudzbinaID` = ?";
        List<Narudzbina> rezultat = new ArrayList<>();

        
        // Puni listu narudzbi
        try ( PreparedStatement stmt = con.prepareStatement(sqlNarudzba)) {
            stmt.setString(1, korisnik.getKorisnickoIme());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String datumOstvarivanja;
                if (rs.getDate("DatumOstvarivanja") == null) {
                    datumOstvarivanja = "";
                } else {
                    datumOstvarivanja = rs.getDate("DatumOstvarivanja").toString();
                }
                Narudzbina nar = new Narudzbina(rs.getDate("DatumKreiranja").toString(),
                        datumOstvarivanja,
                        korisnik,
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

    @Override
    public List<Narudzbina> getSve() {
        // Fill Listu narudzbi
        throw new UnsupportedOperationException();
        // Fill Stavke
    }

    @Override
    public void izmeni(Narudzbina stariT, Narudzbina noviT) {
        throw new UnsupportedOperationException();
    }

    @Override
    public void izbrisi(Narudzbina zaBrisanje) {
        throw new UnsupportedOperationException();
    }

    @Override
    public Narudzbina getJedan(Narudzbina trazeni) throws SQLException {
        throw new UnsupportedOperationException();
    }

}
