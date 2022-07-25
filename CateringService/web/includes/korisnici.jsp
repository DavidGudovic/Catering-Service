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
        <form action="Korisnici" method="post" class="korisnik-stavka">
            <input type="text" name="korisnicko" placeholder="Korisnicko ime">
            <input type="text" name="ime" placeholder="Ime">
            <input type="text" name="prezime" placeholder="Prezime">
            <input type="text" name="adresa" placeholder="Adresa">
            <input type="number" min="0" name="poeni" placeholder="0">
            <select class='nov-rola'>
                <option id="3">Klijent</option>
                <option id="2">Menadžer</option>
                <option id="1">Administrator</option>               
            </select>
            <input type="hidden" class="nov-rolaID" name="rola" value="3">
            <input type="pass" name="password" placeholder="password">
            <input type="submit" class="btn btn-dark btn-dodaj" name="zahtev" value="Dodaj">
        </form>
        <c:forEach var="korisnik" items="${requestScope.korisnici}">
            <div class='korisnik-stavka'>
                <p id="korisnicko${korisnik.getKorisnickoIme()}"contentEditable="true">${korisnik.getKorisnickoIme()}</p>
                <p id="ime${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getIme()}</p>
                <p id="prezime${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getPrezime()}</p>
                <p id="adresa${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getAdresa()}</p>
                <p id="poeni${korisnik.getKorisnickoIme()}" contentEditable="true">${korisnik.getPoeni()}</p>
                <select name='rola' id='rola${korisnik.getKorisnickoIme()}'>
                    <option id="${korisnik.getRola().getRolaID()}"> ${korisnik.getRola().getNazivRole()} </option>
                    <option disabled >--------</option>
                    <option id="1"> Administrator </option>
                    <option id="2"> Menadžer </option>
                    <option id="3"> Klijent </option>
                </select>
                <p id="password${korisnik.getKorisnickoIme()}" contentEditable="true" >Neizmenjen</p>
                <div>
                    <a href='Korisnici?Zahtev=Izbrisi&Korisnik=${korisnik.getKorisnickoIme()}' class='btn btn-danger'>X</a>
                    <a id="${korisnik.getKorisnickoIme()}" class='btn btn-warning btn-izmeni-kor'>Izmeni</a>
                </div>
            </div>
        </c:forEach>

    </div>

</div>