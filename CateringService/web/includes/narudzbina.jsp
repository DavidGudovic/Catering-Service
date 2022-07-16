<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- PRIKAZ ISTORIJE -->


    <div class="narudzbina">

        <div class='istorija-heading'>
            <h4> Narucena: ${narudzbina.getDatumKreiranja()} </h4>
            <p> Status: Priprema se</p>
            <h4> Stavke </h4>
        </div>
                   
            <div class='istorija-stavke'>
                 <c:forEach var="stavka" items="${narudzbina.getStavkeNarudzbine().keySet()}">
                <div class="istorija-stavka">
                    <p>${stavka.getNazivProizvoda()}: </p> <p>${stavka.getCenaPoPorciji()} RSD</p> <p>x ${narudzbina.getStavkeNarudzbine().get(stavka)}</p>
                </div>                 
                </c:forEach>
            </div>

            <div class='istorija-footer'>
                <p> Popust: ${narudzbina.getPopust()} </p>
                <p> Total: ${narudzbina.getUkupnaCena()} </p>
            </div>
        

    </div> 


<!-- KRAJ PRIKAZA ISTORIJE -->