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
    public void dodaj(Korisnik zaDodavanje) throws SQLException {
        Connection con = ConnectionManager.getConnection();
        String sql = "INSERT INTO `korisnici`(`KorisnickoIme`, `Ime`, `Prezime`, `Adresa`, `Poeni`, `PasswordHash`, `RolaID`)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, zaDodavanje.getKorisnickoIme());
            stmt.setString(2, zaDodavanje.getIme());
            stmt.setString(3, zaDodavanje.getPrezime());
            stmt.setString(4, zaDodavanje.getAdresa());
            stmt.setInt(5, zaDodavanje.getPoeni());
            stmt.setString(6, zaDodavanje.getPassword());
            stmt.setInt(7, zaDodavanje.getRola().getRolaID());

            stmt.executeUpdate();
        } catch (SQLException sqle) {
            throw sqle;
        } finally {
            con.close();
        }
    }

    // Vraca korisnika po ID-u sa svim podacima, ako nema vraca null, baca SQLException. 
    @Override
    public Korisnik getJedan(Korisnik trazeni) throws SQLException {
        Connection con = ConnectionManager.getConnection();
        String sql = "SELECT `KorisnickoIme`, `Ime`, `Prezime`, `Adresa`, `Poeni`, `PasswordHash`, korisnici.`RolaID`, role.`NazivRole` "
                + "FROM `korisnici` INNER JOIN `role` ON korisnici.RolaID = role.RolaID "
                + "WHERE `KorisnickoIme` = ? AND `KorisnickoIme` != 'izbrisani'";

        try ( PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, trazeni.getKorisnickoIme());
            ResultSet rs = stmt.executeQuery();
            Korisnik nadjeni = new Korisnik();
            if (rs.next()) {
                nadjeni.setKorisnickoIme(rs.getString("KorisnickoIme"));
                nadjeni.setIme(rs.getString("Ime"));
                nadjeni.setPrezime(rs.getString("Prezime"));
                nadjeni.setPasswordHash(rs.getString("PasswordHash"));
                nadjeni.setAdresa(rs.getString("Adresa"));
                nadjeni.setPoeni(rs.getInt("Poeni"));
                nadjeni.setRola(new Rola(rs.getInt("RolaID"), rs.getString("NazivRole")));
                rs.close();
                return nadjeni;
            }
        } catch (SQLException sqle) {
            throw sqle;
        } finally {
            con.close();
        }
        return null;
    }

    @Override
    public List<Korisnik> getSve() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    // Menja red u bazi sa stariT.KorisnickoIme informacijama iz noviT
    @Override
    public void izmeni(Korisnik stariT, Korisnik noviT) throws SQLException {
        Connection con = ConnectionManager.getConnection();
        String sql = "UPDATE `korisnici` SET `Ime`=?,`Prezime`=?,`Adresa`=?,`Poeni`=?,`PasswordHash`=?,`RolaID`=? "
                + "WHERE `KorisnickoIme` = ?";
        try ( PreparedStatement stmt = con.prepareStatement(sql)) {
          stmt.setString(1,noviT.getIme());
          stmt.setString(2,noviT.getPrezime());
          stmt.setString(3,noviT.getAdresa());
          stmt.setInt(4,noviT.getPoeni());
          stmt.setString(5,noviT.getPassword());
          stmt.setInt(6,noviT.getRola().getRolaID());
          
          stmt.setString(7, stariT.getKorisnickoIme());
          stmt.executeUpdate();
        } catch (SQLException sqle) {
            throw sqle;
        } finally {
            con.close();
        }
    }
    
    //Brise red u bazi sa korisnickim imenom iz ZaBrisanje
    @Override
    public void izbrisi(Korisnik zaBrisanje) throws SQLException{
       Connection con = ConnectionManager.getConnection();
       String sql = "DELETE FROM `korisnici` WHERE `KorisnickoIme` = ?";
       try(PreparedStatement stmt = con.prepareStatement(sql)){
           stmt.setString(1,zaBrisanje.getKorisnickoIme());
           stmt.executeUpdate();
       } catch(SQLException sqle){
           throw sqle;
       }
    }

}
