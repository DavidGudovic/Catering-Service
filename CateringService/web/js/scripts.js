// Skripta menja link buttona za menjanje kolicine u korpi
function updateUrl(element){
            var link = document.getElementById("a" + element.id);
            link.setAttribute("href", "Korpa?Zahtev=Izmeni&Proizvod="+ element.id +"&Kolicina=" + element.value);  
}
function popust(element){
     let subtotal = document.getElementById("subtotal").textContent;
     let total = document.getElementById("total");
    
     if(element.value > 2){
         element.value = 2;
     }
     if(element.value < 0){
         element.value = 0;
     }
     let popust = element.value * 10;
     total.textContent = subtotal - ((subtotal/100) * popust);
             
}