<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<div class='panel edit-ponude'>

    <div>
        <div class="lista-naslov">
            <p>Proizvod</p>
            <p>Slika</p>
            <p>Opis</p>
            <p>RSD</p>
            <p>Kategorija</p>
            <p>Akcije</p>
        </div>
        <div class="lista">
            <c:forEach var="proizvod" items="${requestScope.proizvodi}">
                <div class="lista-stavka " >
                    <p id="naziv${proizvod.getProizvodID()}" contentEditable="true">${proizvod.getNazivProizvoda()}</p>
                    <p id="slika${proizvod.getProizvodID()}">${proizvod.getSlikaPath()}</p>
                    <p id="opis${proizvod.getProizvodID()}" contentEditable="true" class="lista-stavka-opis">${proizvod.getOpis()}</p>
                    <p id="cena${proizvod.getProizvodID()}" contentEditable="true">${proizvod.getCenaPoPorciji()}</p>
                    <select id="kategorija${proizvod.getProizvodID()}" placeholder="Kategorije">
                        <option id="${proizvod.getKategorija().getKategorijaID()}" selected> ${proizvod.getKategorija().getNazivKategorije()} </option>
                        <option disabled>---------</option>
                        <c:forEach var="kategorija" items="${requestScope.kategorije}">
                            <option id="${kategorija.getKategorijaID()}">${kategorija.getNazivKategorije()}</option>
                        </c:forEach>
                    </select>
                    <div class="lista-btn">
                        <a href="Proizvodi?Zahtev=Izbrisi&Proizvod=${proizvod.getProizvodID()}" class="btn btn-danger">X</a>
                        <a id="${proizvod.getProizvodID()}" class="btn btn-warning btn-izmeni">Izmeni</a>
                    </div>            
                </div>                    
            </c:forEach>  

        </div>  
    </div>

    <div class="ponuda-dole">

        <div class="prikaz-kategorija">
            <p>Kategorije</p>
            <div>
                <div class="slatke-kategorije">
                    <p>Slane</p>
                    <span><input type=text value="Naziv"> <a class="btn btn-warning" href="Proizvodi">Dodaj</a></span>
                </div>
                <div class="slane-kategorije">
                    <p>Slatke</p>
                </div>                   
            </div>
        </div>

        <div class="nov-proizvod">
            <form action="">
                <input type="file" name="slika" placeholder="Izaberite fotografiju!">
                <input type="text" name="naziv" placeholder="Naziv proizvoda">
                <textarea maxlength="200"></textarea>
                <select placeholder="Kategorije">
                    <c:forEach var="kategorija" items="${requestScope.kategorije}">
                        <option id="${kategorija.getKategorijaID()}">${kategorija.getNazivKategorije()}</option>
                    </c:forEach>
                </select>
                <input type="number" naziv cena> RSD
                <input class="btn-dark" type="submit" value="Dodaj u ponudu">
            </form>
        </div>

    </div>           


</div>