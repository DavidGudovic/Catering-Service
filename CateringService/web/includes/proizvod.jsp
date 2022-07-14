<!-- PRIKAZUJE CARD ZA PRIKAZ INDIVIDUALNIH PROIZVODA -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="proizvod rounded">
    <img class="proizvod-slika" src="${proizvod.getSlika()}" onerror="this.src='./img/svg/minilogo.svg';" class="card-img-top" alt="...">
    <div class="proizvod-body">
        <h5 class="">${proizvod.getNazivProizvoda()}</h5>
        <p class="proizvod-opis">${proizvod.getOpis()}</p>

    </div>
    <div class="proizvod-footer">
        <div class="row">
            <h6>Cena:  ${proizvod.getCenaPoPorciji()} RSD </h6>
        </div>
        <form action="Pocetna" method="post">

            <div class="row">            
                <div class="col-6"> 
                    <input class="kolicina-input" placeholder="Kolicina" type="number"  name="kolicina">
                </div>
                <div class="col-6">
                    <input type="submit" class="btn btn-primary" value="Dodaj u korpu!"/>
                </div>        
            </div>
        </form>
    </div>
</div> 