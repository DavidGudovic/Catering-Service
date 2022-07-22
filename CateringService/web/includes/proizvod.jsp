<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="proizvod">
    <img class="proizvod-slika" src="${proizvod.getSlikaPath()}" onerror="this.src='./img/svg/minilogo.svg';"  alt="...">
    <div class="proizvod-body">
        <h5 class="">${proizvod.getNazivProizvoda()}</h5>
        <p class="proizvod-opis">${proizvod.getOpis()}</p>

    </div>
    <div class="proizvod-footer">
        <div class="row">
            <h6>Cena:  ${proizvod.getCenaPoPorciji()} RSD </h6>
        </div>
        <form action="Narucivanje" method="post">

            <div class="row">            
                <div class="col-6"> 
                    <input class="kolicina-input" placeholder="Kolicina" type="number"  name="kolicina" min="1" required>
                    <input type="hidden" name="proizvodID" value="${proizvod.getProizvodID()}")>
                </div>
                <div class="col-6">
                    <input type="submit" class="btn btn-primary" name="zahtev" value="Dodaj u korpu!"/>
                </div>        
            </div>
        </form>
    </div>
</div> 