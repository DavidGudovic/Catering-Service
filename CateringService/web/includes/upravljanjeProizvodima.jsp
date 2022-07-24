<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<div class='panel edit-ponude'>

    <!-- LISTA PROIZVODA ZA EDIT -->
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
                    <select id="kategorija${proizvod.getProizvodID()}">
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
                <!-- LISTA SLANIH KATEGORIJA ZA EDIT -->
                <div class="slane-kategorije">
                    <p>Slane</p>
                    <form action="Kategorije" method="get">
                        <input type="hidden" name="program" value="slani">
                        <input type="text" name="naziv" placeholder="Naziv kategorije" required>
                        <input type="submit" class="btn btn-warning" name="Zahtev" value="Dodaj">
                    </form>
                    <div class="kategorije-lista">
                        <c:forEach var="kategorija" items="${requestScope.slaneKategorije}">
                            <div class="kat-stavka">
                                <div contentEditable="true" id="katNaziv${kategorija.getKategorijaID()}">${kategorija.getNazivKategorije()}</div>
                                <select id="program${kategorija.getKategorijaID()}">
                                    <option selected>slani</option>
                                    <option>slatki</option>
                                </select>
                                <div class="kategorija-btn">
                                    <a href="Kategorije?Zahtev=Izbrisi&Kategorija=${kategorija.getKategorijaID()}" class="btn btn-danger">X</a>
                                    <a class="btn btn-warning kat-izmeni" id="${kategorija.getKategorijaID()}" >Izmeni</a>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>

                <!-- LISTA SLATKIH KATEGORIJA ZA EDIT -->
                <div class="slatke-kategorije">
                    <p>Slatke</p>
                    <form action="Kategorije" method="get">
                        <input type="hidden" name="program" value="slatki">
                        <input type="text" name="naziv" placeholder="Naziv kategorije" required>
                        <input type="submit" class="btn btn-warning" name="Zahtev" value="Dodaj">
                    </form>
                    <div class="kategorije-lista">
                        <c:forEach var="slatKategorija" items="${requestScope.slatkeKategorije}">
                            <div class="kat-stavka">
                                <div contentEditable="true" id="katNaziv${slatKategorija.getKategorijaID()}">${slatKategorija.getNazivKategorije()}</div>
                                <select id="program${slatKategorija.getKategorijaID()}">
                                    <option selected>slatki</option>
                                    <option>slani</option>
                                </select>
                                <div class="kategorija-btn">
                                    <a href="Kategorije?Zahtev=Izbrisi&Kategorija=${slatKategorija.getKategorijaID()}" class="btn btn-danger">X</a>
                                    <a class="btn btn-warning kat-izmeni" id="${slatKategorija.getKategorijaID()}">Izmeni</a>
                                </div>
                            </div>  
                        </c:forEach>                       
                    </div>
                </div>                   
            </div>
        </div>

        <!-- FORMA ZA NOV PROIZVOD -->
        <div class="nov-proizvod">
            <form action="Proizvodi" method='post' enctype="multipart/form-data">                
                <input  type="hidden" name="zahtev" value='dodaj'>
                <div>
                    <label for="slika">Izaberite sliku</label>
                    <input id="slika" type="file" name="slika" placeholder="Izaberite fotografiju!" required>
                </div>
                <div>
                    <label for="naziv">Naziv</label>
                    <input id="naziv" type="text" name="naziv" placeholder="Naziv proizvoda" required>
                </div>
                <div>
                    <label for="opis">Opis</label>
                    <textarea id="opis" name="opis" maxlength="200" required></textarea>
                </div>
                <div>
                    <label for="kategorija">Kategorija</label>
                    <!-- onchange jquery -->
                    <select class="katSelect" id="kategorija" name="kategorija" placeholder="Kategorije">
                        <option disabled selected>Izaberite kategoriju</option>
                        <c:forEach var="kategorija" items="${requestScope.kategorije}">
                            <option id="${kategorija.getKategorijaID()}">${kategorija.getNazivKategorije()}</option>
                        </c:forEach>
                    </select>
                    <!-- value punjen JQuery-em -->
                    <input type="hidden" class="katID" name="kategorijaID" value="">
                </div>
                <div>
                    <input type="number" name="cena" min="0">  <span> RSD </span>
                </div>
                           
                <input class="btn-dark" type="submit" value="Dodaj u ponudu">
            </form>
        </div>

    </div>        
</div>