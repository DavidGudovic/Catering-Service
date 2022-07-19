<!-- PRIKAZ KORPE -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<c:if test="${Narudzbina == null}">
    <div class="prazna-korpa">
        <p>Vaša korpa je prazna! <br><a href="Pocetna" class="btn btn-dark">Pogledajte ponudu!</a></p>
    </div>
</c:if>

<!-- PRIKAZ KORPE -->
<c:if test="${Narudzbina != null}">
    <form class="korpa-prikaz" action="Narucivanje" method="post">
        <h3>Vaša narudžbina</h3>
        
        <!-- STAVKE -->
        <div class='stavke-prikaz'>
            <c:forEach var="stavka" items="${Narudzbina.getStavkeNarudzbine().keySet()}">
                <div class='korpa-stavka'>
                    <h5>${stavka.getNazivProizvoda()}</h5>
                    <input class="btn btn-light poeni-korpa" type="number" min="1" id="${stavka.getProizvodID()}" onchange="updateUrl(this)" value="${Narudzbina.getStavkeNarudzbine().get(stavka)}">
                    <div class="stavka-buttons">
                        <!-- Link se puni dinamicki js scriptom -->
                        <a href="" id="a${stavka.getProizvodID()}" class="btn btn-warning btn-stavka">Izmeni</a>
                        <a href="Korpa?Zahtev=Izbrisi&Proizvod=${stavka.getProizvodID()}" class="btn btn-danger btn-stavka">Izbriši</a>
                    </div>
                </div>
                <p class='stavka-total'>Cena: ${stavka.getCenaPoPorciji() * Narudzbina.getStavkeNarudzbine().get(stavka)} RSD</p>
            </c:forEach>
        </div>
        <!-- KRAJ STAVKI -->
        
        <!-- Footer narudzbine -->
        <div class="korpa-footer">
            <input class="btn btn-light poeni-korpa" type="number" min="0" id="poeni" onchange='popust(this)' max="<c:if test="${sessionScope.Poeni>2}">2</c:if><c:if test="${sessionScope.Poeni<=2}">${sessionScope.Poeni}</c:if>" name="poeni" placeholder="Poeni za popust">
                <input class="btn btn-danger btn-korpa" type="submit" name="zahtev" value="Otkaži">
                <input class="btn btn-dark btn-korpa" type="submit" name="zahtev" value="Naruči">
                <div class="total">
                        <p>Sub Total: <span id="subtotal">${Narudzbina.getTotalBezPopusta()}</span> RSD</p>
                <p>Total: <span id="total">${Narudzbina.getTotalBezPopusta()}</span> RSD</p>

            </div>
        </div>
    </form>  
</c:if>

