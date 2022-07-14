<!-- PRIKAZUJE FORMU ZA IZMENU KORISNICKIH INFORMACIJA -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<div class="profil-prikaz">
    <form class="forma-prikaz" action="Profil" method="post">  
        <strong>VAŠ PROFIL</strong><br>
        <label for="korisnickoIme"><strong>Korisničko ime</strong></label> 

        <input type="text" name="korisnickoIme" id="korisnickoIme" value="${User}" disabled/></br>

        <label for="ime"><strong>Ime</strong></label> 

        <input class="input-prikaz" type="text" name="ime" id="ime" value="${Ime}" required/></br>

        <label for="prezime"><strong>Prezime</strong></label> 

        <input class="input-prikaz" type="text" name="prezime" id="prezime" value="${Prezime}" required/></br>

        <label for="password"><strong>Password</strong></label> 

        <input class="input-prikaz" type="password" name="password" id="password" placeholder="Trenutni" required/></br>

        <label for="noviPassword"><strong>Novi Password</strong></label> 

        <input class="input-prikaz" type="password" name="noviPassword" id="noviPassword" placeholder="Ponovite trenutni ako ne menjate!" required/></br>

        <label for="adresa"><strong>Adresa</strong></label> 

        <input class="input-prikaz" type="text" name="adresa" id="adresa" value="${Adresa}" required/></br>
        <div class="prikaz-button">
            <input class="btn btn-primary " type="submit" value="Izmeni" name="zahtev">                                 
        </div>
        <p class="Info-${param.Status}"> 
        <c:if test="${param.Status == 'uspeh'}">
            Uspešno ste izmenili informacije!
        </c:if>
             
        <c:if test="${param.Status == 'greska'}">
            Uneli ste pogrešnu šifru!
        </c:if>
             
        <c:if test="${param.Status == 'con'}">
            Došlo je do greške pokušajte ponovo!
        </c:if>
        </p> <!-- Ispisuje poruku o greski ili uspehu -->
    </form>
</div>
