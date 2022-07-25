<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<div class='panel edit-korisnika'>
    <div class='header-korisnika'>
        <p>Username</p>
        <p>Ime</p>
        <p>Prezime</p>
        <p>Adresa</p>
        <p>Poeni</p>
        <p>Rola</p>
        <p>Password</p>
        <p>Akcije</p>
    </div>
    <div class='lista-korisnika'>
        <c:forEach var="korisnik" items="${requestScope.korisnici}">
            <div class='korisnik-stavka'>
                <p id="korisnicko${korisnik.getKorisnickoIme()}"contentEditable="true">${korisnik.getKorisnickoIme()}</p>
                <p id="ime${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getIme()}</p>
                <p id="prezime${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getPrezime()}</p>
                <p id="adresa${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getAdresa()}</p>
                <p id="poeni${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getPoeni()}</p>
                <select name='rola' id='rola${korisnik.getKorisnickoIme()}'>
                    <option> ${korisnik.getRola().getNazivRole()} </option>
                    <option disabled >--------</option>
                    <option> Administrator </option>
                    <option> Menadžer </option>
                    <option> Klijent </option>
                </select>
                <p id="password${korisnik.getKorisnickoIme()}" contentEditable="true" >Neizmenjen</p>
                <div>
                    <a href='Korisnici?Zahtev=Izbrisi&Korisnik=${korisnik.getKorisnickoIme()}' class='btn btn-danger'>X</a>
                    <a class='btn btn-warning '>Izmeni</a>
                </div>
            </div>
        </c:forEach>
        
    </div>

</div>