// Skripta menja link buttona za menjanje kolicine u korpi
function updateUrl(element){
            var link = document.getElementById("a" + element.id);
            link.setAttribute("href", "Korpa?Zahtev=Izmeni&Proizvod="+ element.id +"&Kolicina=" + element.value);  
}