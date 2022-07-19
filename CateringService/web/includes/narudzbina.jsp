<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- PRIKAZ ISTORIJE -->


<div class="narudzbina status${narudzbina.getStatus()}">
    <div class='istorija-heading'>
        <h4> Narucena: ${narudzbina.getDatumKreiranja()} </h4>
        <p> Status: <c:if test="${narudzbina.getStatus() == 0}">Priprema se</c:if><c:if test="${narudzbina.getStatus() == 1}">Ostvarena</c:if><c:if test="${narudzbina.getStatus() == 2}">Otkazana</c:if></p>
            <h4> Stavke </h4>
        </div>

        <div class='narudzbina-stavke'>
        <c:forEach var="stavka" items="${narudzbina.getStavkeNarudzbine().keySet()}">
            <div class="narudzbina-stavka">
                <p>${stavka.getNazivProizvoda()}: </p><p>${stavka.getCenaPoPorciji()} RSD x ${narudzbina.getStavkeNarudzbine().get(stavka)}</p>
            </div>                 
        </c:forEach>
    </div>

    <div class='narudzbina-footer'>
        <div>               
            <p> Popust: ${narudzbina.getPopust()} %</p>
            <p> Total: ${narudzbina.getUkupnaCena()} RSD </p>
        </div>
        <c:if test="${narudzbina.getStatus() == 1 || narudzbina.getStatus() == 2}">
            <a href="Istorija?Zahtev=Ponovi&Narudzba=${narudzbina.getNarudzbinaID()}" class="btn btn-warning">Ponovi!</a>
        </c:if>
        <c:if test="${narudzbina.getStatus() == 0}">
            <a href="Istorija?Zahtev=Otkazi&Narudzba=${narudzbina.getNarudzbinaID()}" class="btn btn-dark" >Otkazi</a>
        </c:if>
    </div>
</div> 


<!-- KRAJ PRIKAZA ISTORIJE -->