package repository;

import beans.Korisnik;
import beans.Rola;
import database.ConnectionManager;
import interfaces.IRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class KorisnikRepository implements IRepository<Korisnik> {
    
    @Override
    // Dodaje korisnika u bazu 
    public void dodaj(Korisnik t) throws SQLException {
        Connection con = ConnectionManager.getConnection();
            String sql = "INSERT INTO `korisnici`(`KorisnickoIme`, `Ime`, `Prezime`, `Adresa`, `Poeni`, `PasswordHash`, `RolaID`)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)";
            try {
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, t.getKorisnickoIme());
                stmt.setString(2, t.getIme());
                stmt.setString(3, t.getPrezime());
                stmt.setString(4, t.getAdresa());
                stmt.setInt(5, t.getPoeni());
                stmt.setString(6, t.getPassword());
                stmt.setInt(7, t.getRola().getRolaID());

                stmt.executeUpdate();
                stmt.close();
            } catch (SQLException sqle) {
                throw sqle;
            } finally {
                con.close();
            }
    }
    // Vraca korisnika po ID-u, ako nema vraca null, baca SQLException. 
     @Override
    public Korisnik getJedan(Korisnik trazeni) throws SQLException {
            Connection con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM `korisnici` WHERE `KorisnickoIme` = ?";
            
            try(PreparedStatement stmt = con.prepareStatement(sql)){
                stmt.setString(1, trazeni.getKorisnickoIme());
                ResultSet rs = stmt.executeQuery();
                Korisnik nadjeni = new Korisnik();
                if(rs.next()){                
                nadjeni.setKorisnickoIme(rs.getString("KorisnickoIme"));
                nadjeni.setIme(rs.getString("Ime"));
                nadjeni.setPrezime(rs.getString("Prezime"));
                nadjeni.setPasswordHash(rs.getString("PasswordHash"));
                nadjeni.setAdresa(rs.getString("Adresa"));
                nadjeni.setPoeni(rs.getInt("Poeni"));
                nadjeni.setRola(new Rola(rs.getInt("RolaID"), ""));      
                rs.close();
                return nadjeni;
                }               
            }catch(SQLException sqle){
                throw sqle;
            }finally{              
                con.close();
            }
            return null;
    }
    
    @Override
    public List<Korisnik> getSve() {
        return null;
    }

    @Override
    public void izmeni(Korisnik oldT, Korisnik newT) {

    }

    @Override
    public void izbrisi(Korisnik objekat) {

    }

   

}
