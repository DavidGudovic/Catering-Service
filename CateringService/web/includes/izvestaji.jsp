<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<div id='izvestaj' class='panel izvestaj'>
    <div class='naslov-izvestaja'>
        <span class='bold'>Mesečni izveštaj</span> 
    </div>

    <div class='telo-izvestaja'>
        <div class='proizvodi-izvestaj'>
            <p class="bold">Prodaja proizvoda: </p>
            <c:forEach var="proizvod" items="${requestScope.proizvodi.keySet()}">
                <p>${requestScope.proizvodi.get(proizvod)} x ${proizvod.getNazivProizvoda()} :  ${requestScope.proizvodi.get(proizvod) * proizvod.getCenaPoPorciji()}</p>
            </c:forEach>
        </div>
        <div class='korisnici-izvestaj'>
            <p class="bold">Potrošnja korisnika: </p>
            <c:forEach var="korisnik" items="${requestScope.korisnici.keySet()}">
                <p>${korisnik} je potrošio ${requestScope.korisnici.get(korisnik)} RSD</p>
            </c:forEach>
        </div>
    </div>
    
    <div class='footer-izvestaja'>
        <div class="izvestaj-totali">
            <p class='bold'>${ostvarenih} Ostvarenih narudzbi: ${totalOstvarenih} RSD</p>
            <p class='bold'>${otkazanih} Otkazanih narudzbi: ${totalOtkazanih} RSD</p>
        </div>
        <div class="izvestaji-btn">
            <a id='pdf' class="btn btn-warning btn-pdf">PDF</a> 
        </div>
                
    </div>
</div>