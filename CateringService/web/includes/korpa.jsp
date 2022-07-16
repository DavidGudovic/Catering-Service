<!-- PRIKAZ KORPE -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<c:if test="${Narudzbina == null}">
    <div class="prazna-korpa">
        <p>Vaša korpa je prazna! <br><a href="Pocetna" class="btn btn-dark">Pogledajte ponudu!</a></p>
    </div>
</c:if>
<c:if test="${Narudzbina != null}">
    <form class="korpa-prikaz" action="Narucivanje" method="post">
        <h3>Vaša narudžbina</h3>
        <div class='stavke-prikaz'>
            <c:forEach var="stavka" items="${Narudzbina.getStavkeNarudzbine().keySet()}">
                <div class='korpa-stavka'>
                    <h2 name="${stavka.getProizvodID()}">${stavka.getNazivProizvoda()}</h2>
                    <input class="btn btn-light poeni-korpa" type="number" min="1" name="kolicina" placeholder="${Narudzbina.getStavkeNarudzbine().get(stavka)}">
                </div>
                <p class='stavka-total'>Cena: ${stavka.getCenaPoPorciji() * Narudzbina.getStavkeNarudzbine().get(stavka)} RSD</p>
            </c:forEach>
        </div>
        <div class="korpa-footer">

            <input class="btn btn-light poeni-korpa" type="number" min="0" max="<c:if test="${sessionScope.Poeni>2}">2</c:if><c:if test="${sessionScope.Poeni<=2}">${sessionScope.Poeni}</c:if>" name="poeni" placeholder="Poeni za popust">
                <input class="btn btn-warning btn-korpa" type="submit" name="zahtev" value="Izračunaj popust">
                <input class="btn btn-danger btn-korpa" type="submit" name="zahtev" value="Otkaži">
                <input class="btn btn-dark btn-korpa" type="submit" name="zahtev" value="Naruči">
                    <p class='total'>Total: ${Narudzbina.getTotalBezPopusta()} RSD</p>
        </div>
    </form>  
</c:if>

