// Skripta menja link buttona za menjanje kolicine u korpi
function updateUrl(element){
            var link = document.getElementById("a" + element.id);
            link.setAttribute("href", "Korpa?Zahtev=Izmeni&Proizvod="+ element.id +"&Kolicina=" + element.value);  
}
// Skripta dinamicki racuna Total sa popustom u korpi
function popust(element){
     let subtotal = document.getElementById("subtotal").textContent;
     let total = document.getElementById("total");  
    
     if(element.value > 2){
         element.value = 0;
     }
     if(element.value < 0){
         element.value = 0;
     }s
     let popust = element.value * 10;
     total.textContent = subtotal - ((subtotal/100) * popust);
             
}